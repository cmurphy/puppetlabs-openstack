# == Class: openstack::memcache
#
# This classi s just a wrapper around the memcached class.
# Creates an instance of memcached listening on tcp and udp ports 11211.
#
# == Parameters:
#
# [*listen_ip*]
#   (Required) IP address to listen on. This should be the controller address.
#
class openstack::memcache(
  $listen_ip,
){
  class { '::memcached':
    listen_ip => $listen_ip,
    tcp_port  => '11211',
    udp_port  => '11211',
  }
}
