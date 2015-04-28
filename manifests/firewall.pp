class openstack::firewall(
  $accept_source_management,
  $accept_source_data,
){
  class { '::openstack::firewall::pre': }
  class { '::openstack::firewall::puppet': }
  class { '::openstack::firewall::post':
    accept_source_management => $::openstack::config::network_management,
    accept_source_data       => $::openstack::config::network_data,
  }
}
