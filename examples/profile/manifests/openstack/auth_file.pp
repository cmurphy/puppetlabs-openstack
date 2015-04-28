# The profile to install an OpenStack specific mysql server
class profile::openstack::auth_file {
  class { '::openstack::auth_file':
    admin_password => $::openstack::config::keystone_admin_password,
    auth_url       => "http://${::openstack::config::controller_address_api}:5000/v2.0/",
    region         => $::openstack::config::region,
  }
}
