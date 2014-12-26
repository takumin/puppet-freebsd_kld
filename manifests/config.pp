# == Class freebsd_kld::config
#
# This class is called from freebsd_kld for service config.
#
class freebsd_kld::config {
  define boot_load {
    sysrc { "${name}_load":
      ensure => present,
      value  => 'YES',
      path   => '/boot/loader.conf',
    }
  }
  boot_load { $freebsd_kld::modules: }
}
