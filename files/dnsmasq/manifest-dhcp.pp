if $dhcp_range_begin == "" {
  $dhcp_range_begin = regsubst($ipaddress_eth0,'^(\d+\.\d+\.\d+)\.\d+$','\1.100')
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

if $nfsroot_static_address == "" {
  $nfsroot_static_address = $ipaddress_eth0
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

file { "/srv/rivendell/boot/pxelinux.0":
  ensure => "/usr/lib/syslinux/pxelinux.0"
}

file { "/srv/rivendell/boot/config.pp":
  source => "/etc/puppet/files/puppet/config.pp.rivendellairbox",
  replace => false,
  tag => boot
}
