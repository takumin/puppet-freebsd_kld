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
  $packages = $::freebsd_kld::params::packages,
  $modules  = $::freebsd_kld::params::modules,
) inherits ::freebsd_kld::params {

  include freebsd_sysrc

  # validate parameters here

  class { '::freebsd_kld::install': } ->
  class { '::freebsd_kld::config': } ~>
  Class['::freebsd_kld']
}
