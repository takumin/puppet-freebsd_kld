# == Class freebsd_kld::config
#
# This class is called from freebsd_kld for service config.
#
class freebsd_kld::config {
  define boot_load ($name) {
    sysrc { "${name}_load":
      value  => "YES",
      rcfile => '/boot/loader.conf',
    }
  }
  create_resources(boot_load, $name)
}
