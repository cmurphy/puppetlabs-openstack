# == Class: openstack::auth_file
#
# This class is just a wrapper around the openstack_extras::auth_file class.
# Simply creates an openrc file that can be sourced for easier hands-on
# administration.
#
# == Parameters:
#
# [*admin_password*]
#   (required) The password for the admin user.
#
# [*auth_url*]
#   (optional) The API URL to authenticate against. If unspecified, uses the default
#   from openstack:extras::auth_file::auth_url.
#   Defaults to undef
#
# [*region*]
#   (optional) The region to authenticate with. If unspecified, uses the default
#   from openstack:extras::auth_file::region.
#   Defaults to undef
#
class openstack::auth_file(
  $admin_password,
  $auth_url        = undef,
  $region          = undef,
){
  class { '::openstack_extras::auth_file':
    tenant_name => 'admin',
    password    => $admin_password,
    auth_url    => $auth_url,
    region_name => $region,
  }
}
