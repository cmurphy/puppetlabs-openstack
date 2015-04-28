class role::openstack::controller inherits role::openstack {
  include ::profile::openstack::memcache
  include ::profile::openstack::mysql
  include ::openstack::profile::rabbitmq
  include ::openstack::profile::mongodb
  include ::openstack::profile::keystone
  include ::openstack::profile::glance::auth
  include ::openstack::profile::cinder::api
  include ::openstack::profile::ceilometer::api
  include ::openstack::profile::nova::api
  include ::openstack::profile::neutron::server
  include ::openstack::profile::heat::api
  include ::openstack::profile::horizon
  include ::profile::openstack::auth_file

  Class['::profile::openstack::mysql'] ->
  Class['::openstack::profile::keystone']

  Class['::profile::openstack::repo'] ->
  Class['::openstack::profile::keystone']

  Class['::openstack::profile::keystone'] ->
  Class['::openstack::profile::glance::auth']

  Class['::openstack::profile::keystone'] ->
  Class['::openstack::profile::ceilometer::api']

  Class['::openstack::profile::keystone'] ->
  Class['::openstack::profile::cinder::api']

  Class['::openstack::profile::mongodb'] ->
  Class['::openstack::profile::ceilometer::api']
}
