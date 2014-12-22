# == Class freebsd_kld::params
#
# This class is meant to be called from freebsd_kld.
# It sets variables according to platform.
#
class freebsd_kld::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'freebsd_kld'
      $service_name = 'freebsd_kld'
    }
    'RedHat', 'Amazon': {
      $package_name = 'freebsd_kld'
      $service_name = 'freebsd_kld'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
