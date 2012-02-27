file { "/srv/rivendell/home":
  ensure => directory,
  tag => boot,
  require => Exec["storage-mount-rivendell"]
}

file { "/srv/rivendell/snd":
  ensure => directory,
  group => rivendell,
  mode => 2775,
  tag => boot,
  require => Exec["storage-mount-rivendell"]
}

# TODO use rivendell 999999_000 cut created by debian package
exec { "rivendell-default-cut": 
  command => "bunzip2 -c /usr/local/share/rivendell/999999_001.wav.bz > /srv/rivendell/snd/999999_001.wav",
  creates => "/srv/rivendell/snd/999999_001.wav",
  group => rivendell,
  tag => boot,
  require => File["/srv/rivendell/snd"]
}

file { "/srv/ftp/rivendell": 
  ensure => directory,
  group => rivendell,
  mode => 775,
  tag => boot,
  require => Exec["storage-mount-rivendell"]
}

file { "/srv/rivendell/tmp":
  ensure => directory,
  mode => 1777,
  tag => boot,
  require => Exec["storage-mount-rivendell"]
}

exec { "mount-var-tmp":
  command => "mount -o bind /srv/rivendell/tmp /var/tmp",
  unless => "mount | grep -q 'on /var/tmp type ext'",
  require => File["/srv/rivendell/tmp"],
  tag => boot
}

