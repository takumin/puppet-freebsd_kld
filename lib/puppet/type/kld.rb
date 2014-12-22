# vim: set ts=2 sw=2 sts=2 tw=0 et :

Puppet::Type.newtype(:kld) do
  @doc = "FreeBSD kld[stat|load] plugin."

  ensurable

  newparam(:name) do
    desc "kernel module name."
  end
end
