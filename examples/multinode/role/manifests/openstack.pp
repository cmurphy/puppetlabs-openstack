class role::openstack {
  include ::openstack
  include ::openstack::profile::base
  include ::profile::openstack::firewall
  include ::profile::openstack::repo
}
