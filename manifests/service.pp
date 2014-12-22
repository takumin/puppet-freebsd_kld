# == Class freebsd_kld::service
#
# This class is meant to be called from freebsd_kld.
# It ensure the service is running.
#
class freebsd_kld::service {

  service { $::freebsd_kld::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
