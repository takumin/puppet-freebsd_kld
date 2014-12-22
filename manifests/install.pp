# == Class freebsd_kld::install
#
# This class is called from freebsd_kld for install.
#
class freebsd_kld::install {

  package { $::freebsd_kld::package_name:
    ensure => present,
  }
}
