dnsmasq::conf { rivendell_nas:
  content => "address=/rivendellnas/${rivendell_nas}",
  ensure => $rivendell_nas ? {
    "" => absent,
    default => present
  }
}
