# == Class: openstack::mysql
#
# Class to set up a mysql server for OpenStack.
#
# == Parameters:
#
# [*root_password*]
#   (required) The password for the mysql admin user.

# [*bind_address*]
#   (required) The address to bind to. If hosted on the controller node, this
#   will be the controller address. This is a required parameter because a
#   default value of something like '127.0.0.1' or '0.0.0.0' is almost certainly
#   not the expected bind address in an OpenStack deployment.
#
class openstack::mysql(
  $root_password,
  $bind_address,
){

  class { '::mysql::server':
    root_password    => $root_password,
    restart          => true,
    override_options => {
      'mysqld' => {
        'bind_address'           => $bind_address,
        'default-storage-engine' => 'innodb',
      }
    }
  }

  class { '::mysql::bindings':
    python_enable => true,
  }

  class { 'mysql::server::account_security': }
}
