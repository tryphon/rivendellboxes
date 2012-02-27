class dnsmasq {
  package { dnsmasq: }

  readonly::mount_tmpfs { "/etc/dnsmasq.d": }
  readonly::mount_tmpfs { "/var/lib/misc": }

  file { "/etc/puppet/manifests/classes/dnsmasq.pp":
    source => "puppet:///files/dnsmasq/manifest.pp"
  }
}

class dnsmasq::dhcp {
  include dnsmasq
  
  file { "/etc/puppet/manifests/classes/dnsmasq-dhcp.pp":
    source => "puppet:///files/dnsmasq/manifest-dhcp.pp"
  }

  file { "/etc/puppet/templates/dnsmasq":
    ensure => directory
  }

  file { "/etc/puppet/templates/dnsmasq/dhcp":
    source => "puppet:///files/dnsmasq/templates/dhcp"
  }

  file { "/etc/puppet/templates/dnsmasq/pxelinux.cfg":
    source => "puppet:///files/dnsmasq/templates/pxelinux.cfg"
  }

  file { "/etc/network/if-up.d/dnsmasq-update-rivendellnas-address":
    source => "puppet:///files/dnsmasq/update-rivendellnas-address",
    mode => 755
  }

  file { "/etc/puppet/files/puppet":
    ensure => directory
  }

  file { "/etc/puppet/files/puppet/config.pp.rivendellairbox":
    source => "puppet:///files/puppet/config.pp.rivendellairbox"
  }
}
