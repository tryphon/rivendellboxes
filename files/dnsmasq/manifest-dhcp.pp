if $dhcp_range_begin == "" {
  $dhcp_range_begin = $network_static_address
}

dnsmasq::conf { dhcp-server:
  content => template("dnsmasq/dhcp"),
  ensure => $dhcp_enabled ? {
    "true" => present,
    default => absent
  }
}

file { "/srv/rivendell/boot":
  ensure => directory,
  tag => boot,
  require => Exec["storage-mount-rivendell"]
}

file { "/srv/rivendell/boot/pxelinux.cfg":
  ensure => directory,
  tag => boot
}

# Use network_static_address in nfs url
file { "/srv/rivendell/boot/pxelinux.cfg/default":
  content => template("dnsmasq/pxelinux.cfg"),
  tag => boot
}
