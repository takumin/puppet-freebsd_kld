# == Class: freebsd_kld
#
# Full description of class freebsd_kld here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_kld (
  $package_name = $::freebsd_kld::params::package_name,
  $service_name = $::freebsd_kld::params::service_name,
) inherits ::freebsd_kld::params {

  # validate parameters here

  class { '::freebsd_kld::install': } ->
  class { '::freebsd_kld::config': } ~>
  class { '::freebsd_kld::service': } ->
  Class['::freebsd_kld']
}
