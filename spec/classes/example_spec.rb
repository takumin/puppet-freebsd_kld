require 'spec_helper'

describe 'freebsd_kld' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_kld class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_kld::params') }
        it { should contain_class('freebsd_kld::install').that_comes_before('freebsd_kld::config') }
        it { should contain_class('freebsd_kld::config') }
        it { should contain_class('freebsd_kld::service').that_subscribes_to('freebsd_kld::config') }

        it { should contain_service('freebsd_kld') }
        it { should contain_package('freebsd_kld').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_kld class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_kld') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
