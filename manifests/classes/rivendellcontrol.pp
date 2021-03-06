class rivendellcontrol {
  include apache::passenger
  include ruby::bundler

  include apt::tryphon::dev

  file { "/etc/rivendellcontrol/database.yml":
    source => "puppet:///files/rivendellcontrol/database.yml",
    require => Package[rivendellcontrol]
  }
  file { "/etc/rivendellcontrol/production.rb":
    source => "puppet:///files/rivendellcontrol/production.rb",
    require => Package[rivendellcontrol]
  }
  package { rivendellcontrol:
    ensure => "0.2-1+build21",
    require => [Apt::Source[tryphon-dev], Package[libapache2-mod-passenger], Package["ruby1.9.1"]]
  }

  readonly::mount_tmpfs { "/var/lib/rivendellcontrol": }

  file { "/etc/puppet/manifests/classes/rivendellcontrol.pp":
    source => "puppet:///files/rivendellcontrol/manifest.pp"
  }
}
