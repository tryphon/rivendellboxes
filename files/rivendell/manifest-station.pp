dnsmasq::conf { rivendell_nas:
  content => "address=/rivendellnas/${rivendell_nas}",
  ensure => $rivendell_nas ? {
    "" => absent,
    default => present
  }
}

file { "/var/etc/rd.conf":
  content => template("/etc/puppet/templates/rivendell/rd.conf"),
  tag => boot
}
