if $rivendell_nas != "" {
  file { "/etc/dnsmasq.d/rivendellnas":
    content => "address=/rivendellnas/${rivendell_nas}",
    tag => boot,
    notify => Service[dnsmasq]
  }
}

service { dnsmasq:
  ensure => running
}

# exec { "mount-home":
#   command => "mount -o bind /nfs/rivendell/home/$macaddress /home/radio",
#   unless => "mount | grep -q /home/radio",
#   tag => boot,
#   before => Exec["rivendell-radio-home"]
# }
