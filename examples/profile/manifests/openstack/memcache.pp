# The profile to install a local instance of memcache
class profile::openstack::memcache {
  class { '::openstack::memcache':
    listen_ip => $::openstack::config::controller_address_management,
  }
}
