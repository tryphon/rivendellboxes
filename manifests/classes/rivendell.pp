class rivendell {
  $release = "2.10.3-1"
}

# Used in rivendellairbox AND rivendellallbox
class rivendell::station {
  include rivendell

  include apt::tryphon
  include apt::tryphon::dev
  include apt::multimedia

  include xfce
  include vnc::server
  include xorg

  include alsa::hdsp

  package { rivendell:
    require => [Apt::Source['tryphon-dev'], Package['librivendell']],
    ensure => $rivendell::release
  }
  package { libhpi:
    require => Apt::Source[tryphon-dev],
    ensure => "4.08.07-3"
  }

  file { "/usr/share/qt3/include":
    ensure => directory,
    require => Package[rivendell]
  }

  file { "/usr/share/qt3/include/qnamespace.h":
    source => "puppet:///files/rivendell/qnamespace.h",
    require => Package[rivendell]
  }

  package { strace: }

  include rivendell::common
  include mount

  include rivendell::mpeg
  include rivendell::station::user

  include rivendell::audio

  # Used by dropboxes
  file { "/var/log.model/rivendell":
    ensure => directory,
    group => rivendell,
    mode => 775,
    require => Package[rivendell]
  }

  steto::conf { "rivendell-station":
    source => "puppet:///files/rivendell/steto-station.rb"
  }

  file { "/etc/puppet/manifests/classes/rivendell-station.pp":
    source => "puppet:///files/rivendell/manifest-station.pp"
  }

  file { "/etc/rd.conf":
    ensure => link,
    target => "/var/etc/rd.conf",
    require => Package[rivendell]
  }

  file { "/etc/puppet/templates/rivendell":
    ensure => directory
  }

  file { "/etc/puppet/templates/rivendell/rd.conf":
    source => "puppet:///files/puppet/templates/rd.conf"
  }

  include rivendell::rd_generate_log
  include rivendell::metalive

  file { '/usr/local/bin/rdcatchd':
    source => 'puppet:///files/rivendell/rdcatchd.wrapper',
    mode => 0755
  }
}

class rivendell::common {
  include rivendell

  group { rivendell:
    gid => 2000
  }

  package { 'librivendell':
    require => Apt::Source['tryphon-dev'],
    ensure => $rivendell::release
  }

  file { "/etc/security/limits.d/rivendell.conf":
    source => "puppet:///files/rivendell/rivendell.limits"
  }
}

class rivendell::audio {
  $amixerconf_mode="duplex"

  include box::audio

}

class rivendell::mpeg {
  include apt::multimedia
  package { [libmp3lame0, libtwolame0, libmad0]: }
}

class rivendell::station::user inherits rivendell::user {
  include locales

  User[radio] {
    groups +> [audio, adm, powerdev, plugdev],
    password => '$6$2Dpz3yn7$IUNqUluNiMLZq6aYDc3cK43BiTKOamNxegwed3PVfMnMbJHDtgyCQnD0OSkBDkJdUAFlZNjb993un4ixe1xOX/',
    home => "/home/radio",
    require => Package[rivendell],
  }

  file { "/home/radio":
    ensure => directory
  }

  file { ["/etc/skel/.config", "/etc/skel/.config/autostart"]:
    ensure => directory
  }

  file { "/etc/skel/.config/autostart/rdairplay.desktop":
    source => "puppet:///files/rivendell/rdairplay.desktop.autostart"
  }

  # FIXME not available in wheezy
  # package { polymer: }
  file { "/etc/skel/.qt":
    ensure => directory
  }
  file { "/etc/skel/.qt/qtrc":
    source => "puppet:///files/rivendell/qtrc",
  }
  file { "/etc/skel/Desktop":
    ensure => directory
  }
  file { "/etc/skel/Desktop/DropBoxes":
    ensure => "/nfs/dropboxes"
  }

  define desktop_launcher() {
    exec { "install-desktop-launcher-$name":
      command => "install --mode=755 /usr/share/applications/$name.desktop /etc/skel/Desktop/",
      creates => "/etc/skel/Desktop/$name.desktop",
      require => [Package[rivendell], File["/etc/skel/Desktop"]]
    }
  }

  desktop_launcher { [rdairplay, rdadmin, rdlibrary, rdlogedit]: }

  include rsync
  file { "/usr/local/bin/rivendell-init-radio-home":
    source => "puppet:///files/rivendell/rivendell-init-radio-home",
    mode => 755
  }
}

class rivendell::user {
  user { radio:
    uid => 2000,
    groups => rivendell,
    shell => "/bin/bash"
  }
}

class rivendell::server {
  include apt::tryphon
# include rivendellcontrol
  include rivendell

  include rivendell::mpeg
  include rivendell::storage
  include rivendell::nfs

  class { 'mysql::server':
    storage_name => 'rivendell'
  }
  include ftp::server

  include sox

  include rivendell::import
  include rivendellcontrol

  package { rivendell-server:
    require => Apt::Source[tryphon-dev],
    ensure => $rivendell::release
  }
  include rivendell::common

  apache::confd { 'increase-timeout':
    source => 'puppet:///files/rivendell/apache-timeout.conf'
  }

  include rivendell::user

  file { "/etc/puppet/manifests/classes/rivendell-server.pp":
    source => "puppet:///files/rivendell/manifest-server.pp"
  }

  file { "/usr/local/share/rivendell":
    ensure => directory
  }

  file { "/usr/local/share/rivendell/rivendell.sql":
    source => "puppet:///files/rivendell/rivendell.sql"
  }

  file { "/usr/local/share/rivendell/999999_001.wav.bz":
    source => "puppet:///files/rivendell/999999_001.wav.bz",
    owner => radio,
    group => rivendell,
    require => User[radio]
  }

  file { "/var/snd":
    ensure => "/srv/rivendell/snd",
    force => true,
    # invalid link breaks package install
    require => Package[rivendell-server]
  }

  file { "/usr/local/sbin/rivendell-migratedb":
    source => "puppet:///files/rivendell/rivendell-migratedb",
    mode => 755
  }

  file { "/usr/local/bin/rivendell":
    source => "puppet:///files/rivendell/rivendell.rb",
    mode => 755
  }
  file { "/usr/local/share/rivendell/xsessionrc":
    source => "puppet:///files/rivendell/xsessionrc",
  }

  file { "/etc/init.d/rivendell-db":
    source => "puppet:///files/rivendell/rivendell-db.init",
    mode => 755
  }
  initd_script { 'rivendell-db':
    require => [File["/etc/init.d/rivendell-db"], Package[mysql-server]],
  }

  file { "/etc/init.d/rivendell":
    source => "puppet:///files/rivendell/rivendell.init",
    mode => 755
  }
  initd_script { rivendell:
    require => File["/etc/init.d/rivendell"]
  }

  file { "/usr/local/sbin/rivendell-backup-db":
    source => "puppet:///files/rivendell/rivendell-backup-db",
    mode => 755
  }

  file { "/etc/cron.daily/rivendell-backup-db":
    ensure => "/usr/local/sbin/rivendell-backup-db",
    require => Package[cron]
  }

  steto::conf { "rivendell-server":
    source => "puppet:///files/rivendell/steto-server.rb"
  }
}

class rivendell::import {
  ruby::gem { 'rivendell-import':
    require => [Package['libsqlite3-dev'], Ruby::Gem['mysql']],
    ensure => '1.02'
  }
  ruby::gem { mysql:
    require => Package[libmysqlclient-dev]
  }

  package { ['libsqlite3-dev', 'libmysqlclient-dev', 'libtag1-dev']: }
  ruby::gem { rb-inotify: ensure => '0.9.0' }

  file { '/etc/default/rivendell-import':
    source => 'puppet:///files/rivendell-import/rivendell-import.default'
  }

  file { '/etc/init.d/rivendell-import':
    source => 'puppet:///files/rivendell-import/rivendell-import.init',
    mode => 755
  }

  initd_script { 'rivendell-import':
    require => Initd_Script['rivendell-db']
  }

  file { '/etc/puppet/manifests/classes/rivendell-import.pp':
    source => 'puppet:///files/rivendell-import/manifest.pp'
  }
  file { '/etc/puppet/files/rivendell-import':
    ensure => directory
  }
  file { '/etc/puppet/files/rivendell-import/config.rb':
    source => 'puppet:///files/rivendell-import/config.rb'
  }
  steto::conf { 'rivendell-import':
    source => 'puppet:///files/rivendell-import/steto.rb'
  }
}

class rivendell::storage {
  class { 'box::storage':
    storage_name => "rivendell",
  }
}

class rivendell::nfs {
  include nfs::server

  file { "/etc/exports":
    source => "puppet:///files/nfs/exports"
  }
}

class rivendell::station::nfs {
  include nfs::client

  file { "/var/snd":
   ensure => directory
  }

  include autofs

  file { "/etc/auto.master":
    content => "/- /etc/auto.rivendell\n",
    require => Package[autofs]
  }

  file { "/etc/auto.rivendell":
    source => "puppet:///files/autofs/autofs.rivendell"
  }

  file { "/etc/default/autofs":
    source => "puppet:///files/autofs/autofs.default",
    require => Package[autofs]
  }

  file { ["/nfs", "/nfs/dropboxes", "/nfs/tmp"]:
    ensure => directory
  }
}

class rivendell::box::nas {
  include rivendell::server
  include dnsmasq
  include dnsmasq::dhcp
  include release::airbox
  include release::boxes
  include network::vlan
  include network::vlan::migrations
  include network::iptables
  include network::gateway
  include rsyslog::server

  file { "/etc/rd.conf":
    source => ["puppet:///files/rivendell/rd.conf.${box_name}", "puppet:///files/rivendell/rd.conf"]
  }

  # FIXME
  file { "/etc/cron.hourly/ping-for-remote-ip":
    content => "#!/bin/sh\nwget -q -O /dev/null \"http://download.tryphon.eu/rivendellboxes/latest.yml?macaddress=`facter macaddress`\"\n",
    mode => 755,
    require => Package[cron]
  }
}

class rivendell::box::air {
  include rivendell::station
  include rivendell::station::nfs

  # to configure rivendellnas (when needed)
  include dnsmasq

  # change hostname according to dhcp
  include network::dhclient::hostname

  file { "/etc/puppet/manifests/classes/rivendell-box-air.pp":
    source => "puppet:///files/rivendell/manifest-box-air.pp"
  }
}

class rivendell::box::all {
  include rivendell::server
  include rivendell::station

  include dnsmasq

  file { "/etc/puppet/manifests/classes/rivendell-box-all.pp":
    source => "puppet:///files/rivendell/manifest-box-all.pp"
  }
}

class rivendell::rd_generate_log {
  file { "/usr/local/bin/rd-generate-log":
    source => "puppet:///files/rivendell/rd-generate-log"
  }
}

class rivendell::metalive {
  package { 'rivendell-metalive': }
}
