# post-firewall rules to reject remaining traffic
class openstack::firewall::post(
  $accept_source_management,
  $accept_source_data,
){
  firewall { '8999 - Accept all management network traffic':
    proto  => 'all',
    state  => ['NEW'],
    action => 'accept',
    source => $accept_source_management,
  } ->
  firewall { '9100 - Accept all vm network traffic':
    proto  => 'all',
    state  => ['NEW'],
    action => 'accept',
    source => $accept_source_data,
  } ->
  firewall { '9999 - Reject remaining traffic':
    proto  => 'all',
    action => 'reject',
    reject => 'icmp-host-prohibited',
    source => '0.0.0.0/0',
  }
}
