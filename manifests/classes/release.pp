class release::airbox {
  include wget

  file { "/usr/local/sbin/box-air-release-init":
    source => "puppet:///files/release/box-air-release-init",
    mode => 755
  }
  file { "/etc/cron.d/box-air-release-init":
    source => "puppet:///files/release/box-air-release-init.cron",
    require => Package[cron]
  }

  steto::conf { box-air-release:
    source => "puppet:///files/release/steto-box-air-release.rb"
  }
}

class release::boxes {
  file { "/usr/local/sbin/boxes-upgrade":
    source => "puppet:///files/release/boxes-upgrade",
    mode => 755
  }
  file { "/etc/box/local.d/box-release-with-boxes-upgrade":
    content => "Box::Release.install_command = '/usr/local/sbin/boxes-upgrade'\n"
  }
  sudo::line { "www-data-boxes-upgrade":
    line => "www-data	ALL=(root) NOPASSWD: /usr/local/sbin/boxes-upgrade"
  }
}
