#
# blah!
#
# this has mainly been written to facilitate ec2 instance provisioning with puppet.
#
# I am sure that more attributes will have to be added.
#
Puppet::Type.newtype(:noder) do
  @doc = "Manages the provisioing of new machines."

  #
  #  I need additional ensurable states: 
  #    * stopped (stop but dont delete)
  #    * running (alias for present),
  #    * absent - terminate (is there anything more brutal than terminate?)
  # 
  ensurable

  # you cannot only manage security groups on create instance. 
  newparam(:name) do
    desc "inuque id for a machine"
    isnamevar
    validate do
    end
  end

  #
  #  there will initially be a limitation that only one partition (/)
  #  is supported
  #
#  newparam(:disksize) do
#    desc "the size of the root partition created at boot time"
#    # default is GB
#    defaultto 20
#  end

  # I need to consider if owner and password should be params
  #   ie: do we want to move machines between owners??
  newparam(:user) do
    desc "owner of node, this will refer to the account responsible for
    provisioning for cloud services, this may also be required
    "
#    munge do
#      'bob'
#    end
  end

  # this is a feature only required for cloud usage
  newparam(:password) do
    desc "password used to connect to cloud providers"
    # this is only required for cloud providers
  end

  newparam(:image) do 
    desc "base image used during installation"
    # this is only required when we create
  end

  newparam(:desc) do
    desc "description of instance"
  end

  newparam(:type) do
    desc "this is how ec2 qualifies machine strength, I would rather use memory or ncpus or something else..."
  end

  newparam(:sync) do
    desc 'rather or not to wait until images exist, defaults to true'
    defaultto true
  end
 
#  newparam(:group) do
#    desc "node group that will be used for parameterization"
#  end

#  newparam(:role) do
#    desc "list of classes that define machine role"
#  end

#  newproperty(:ncpus) do
#    desc "Number of CPUs for a host"
#    defaultto 1
#  end

#  newproperty(:memory) do
#    desc "Total amount of memory for machine in MB"
#    defaultto 1000
#  end
end
