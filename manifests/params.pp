# == Class freebsd_kld::params
#
# This class is meant to be called from freebsd_kld.
# It sets variables according to platform.
#
class freebsd_kld::params {
  case $::osfamily {
    'FreeBSD': {
      $packages = {}
      $modules  = {}
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
