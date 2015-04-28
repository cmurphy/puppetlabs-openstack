# Profile for configuring base firewall rules
class profile::openstack::firewall {
  class { '::openstack::firewall':
    accept_source_management => $::openstack::config::network_management,
    accept_source_data       => $::openstack::config::network_data,
  }
}
