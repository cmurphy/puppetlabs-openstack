# == Class: openstack::repo
#
# This class determines which repositories are needed based on the operating
# system and includes the relevant repo class from openstack_extras::repo.
#
# == Parameters:
#
# [*release*]
#   (optional) The codename for the release to install.
#   Defaults to 'juno'
#
class openstack::repo(
  $release = 'juno',
){
  if $::osfamily == 'Debian' {
    if $::operatingsystem == 'Ubuntu' {
      class { '::openstack_extras::repo::debian::ubuntu':
        release         => $release,
        package_require => true,
      }
    } elsif $::operatingsystem == 'Debian' {
      class { '::openstack_extras::repo::debian::debian':
        release         => $release,
        package_require => true,
      }
    } else {
      fail("Operating system ${::operatingsystem} is not supported.")
    }
  } elsif $::osfamily == 'RedHat' {
      class { '::openstack_extras::repo::redhat::redhat':
        release => $release
      }
  } else {
      fail("Operating system family ${::osfamily} is not supported.")
  }
}
