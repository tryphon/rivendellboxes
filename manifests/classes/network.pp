class network::dhclient::hostname {
  include network::dnsutils
  
  file { "/etc/dhcp/dhclient-enter-hooks.d/sethostname":
    source => "puppet:///files/network/sethostname",
    mode => 755,
    require => Package[dhcp3-client]
  }
}

class network::vlan::migrations {
  box::config::migration { "20130701211127_move_to_vlan100":
    source => "puppet:///files/network/20130701211127_move_to_vlan100.rb"
  }
}