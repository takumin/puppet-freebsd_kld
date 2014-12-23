# vim: set ts=2 sw=2 sts=2 tw=0 et :

Puppet::Type.type(:kld).provide(:freebsd) do
  desc "FreeBSD Kernel module management."

  commands :kldload => "/sbin/kldload"
  commands :kldunload => "/sbin/kldunload"
  commands :kldstat => "/sbin/kldstat"

  confine :operatingsystem => :freebsd

  def create
    kldload('-q', @resource[:name])
  end

  def destroy
    kldunload(@resource[:name])
  end

  def exists?
    kldstat('-v').include? @resource[:name]
  end
end
