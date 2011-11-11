# FIXME RivendellAir will use a NFS mount point
file { "/srv/rivendell/home/$macaddress":
  ensure => directory, 
  owner => radio, group => radio, mode => 755,
  tag => boot
}

exec { "mount-home":
  command => "mount -o bind /srv/rivendell/home/$macaddress /home/radio",
  unless => "mount | grep -q /home/radio",
  require => File["/srv/rivendell/home/$macaddress"],
  tag => boot
}

exec { "rivendell-radio-home":
  command => "rsync -a /etc/skel/ /home/radio/",
  creates => "/home/radio/skel/.profile",
  require => Exec["mount-home"],
  tag => boot,
  user => radio
}

file { "/srv/ftp/rivendell": 
  ensure => directory,
  group => rivendell,
  mode => 775,
  tag => boot
}
