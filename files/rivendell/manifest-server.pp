file { "/srv/rivendell/home":
  ensure => directory,
  tag => boot
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
  command => "rdgen -t 10 -l 16 /srv/rivendell/snd/999999_001.wav",
  creates => "/srv/rivendell/snd/999999_000.wav",
  group => rivendell,
  tag => boot,
  require => File["/srv/rivendell/snd"]
}
