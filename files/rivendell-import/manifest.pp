file { "/srv/rivendell/ftp/dropboxes/config.rb":
  source => "/etc/puppet/files/rivendell-import/config.rb",
  replace => false,
  require => Exec["storage-mount-rivendell"],
  owner => radio,
  group => rivendell,
  tag => boot
}

service { "rivendell-import":
  ensure => running
}
