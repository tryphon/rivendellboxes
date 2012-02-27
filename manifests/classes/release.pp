class release::airbox {
  include wget

  file { "/usr/local/sbin/box-air-release-init":
    source => "puppet:///files/release/box-air-release-init",
    mode => 755
  }
  file { "/etc/cron.d/box-air-release-init":
    source => "puppet:///files/release/box-air-release-init.cron"
  }
}
