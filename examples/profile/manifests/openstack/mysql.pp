# The profile to install an OpenStack specific mysql server
class profile::openstack::mysql {
  class { '::openstack::mysql':
    root_password => $::openstack::config::mysql_root_password,
    bind_address  => $::openstack::config::controller_address_management,
  }
}
