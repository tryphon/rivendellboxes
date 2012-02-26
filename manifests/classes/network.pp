class network::dhclient::hostname {
  package { dnsutils: }
  
  file { "/etc/dhcp/dhclient-enter-hooks.d/sethostname":
    source => "puppet:///files/network/sethostname",
    mode => 755
  }
}
