# Profile for installing OpenStack distribution repositories
class profile::openstack::repo {
  class { '::openstack::repo':
    release => 'juno',
  }
}
