file { "/srv/rivendell/home/$macaddress":
  ensure => directory, 
  owner => radio, group => radio, mode => 755,
  tag => boot
}

exec { "mount-home":
  command => "mount -o bind /srv/rivendell/home/$macaddress /home/radio",
  unless => "mount | grep -q /home/radio",
  require => File["/srv/rivendell/home/$macaddress"],
  tag => boot,
  before => Exec["rivendell-radio-home"]
}
