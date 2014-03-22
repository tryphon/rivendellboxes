file { "/var/lib/rivendellcontrol/db":
  ensure => directory,
  owner => www-data,
  group => www-data,
  tag => boot
}

exec { "create-rivendellcontrol-db":
  command => "install --owner=www-data --group=www-data --mode=664 /usr/share/rivendellcontrol/db/production.sqlite3 /var/lib/rivendellcontrol/db",
  creates => "/var/lib/rivendellcontrol/db/production.sqlite3",
  require => File["/var/lib/rivendellcontrol/db"],
  tag => boot
}
