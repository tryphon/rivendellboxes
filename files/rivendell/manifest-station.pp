class rivendell::station {
  include alsa
  if $rivendell_config == "" and $alsa::device_id == "DSP" {
    notice("Define default alsa_config for RME HDSP support");
    $rivendell_config = { "alsa" => { "period_quantity" => "2" } }
  }

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
}

include rivendell::station
