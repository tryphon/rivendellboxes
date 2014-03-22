class rivendellcontrol {
  include apache::passenger
  include ruby::bundler

  include apt::tryphon::dev

  file { "/etc/rivendellcontrol/database.yml":
    source => "$source_base/files/rivendellcontrol/database.yml",
    require => Package[rivendellcontrol]
  }
  file { "/etc/rivendellcontrol/production.rb":
    source => "$source_base/files/rivendellcontrol/production.rb",
    require => Package[rivendellcontrol]
  }
  package { rivendellcontrol:
    ensure => "latest",
    require => [Apt::Source[tryphon-dev], Package[libapache2-mod-passenger]]
  }

  readonly::mount_tmpfs { "/var/lib/rivendellcontrol": }

  file { "/etc/puppet/manifests/classes/rivendellcontrol.pp":
    source => "puppet:///files/rivendellcontrol/manifest.pp"
  }
}
