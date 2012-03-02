# Used in rivendellairbox AND rivendellallbox
class rivendell::station {

  include apt::tryphon
  include apt::multimedia

  $gdm_automaticlogin = "radio"
  include gnome::minimal
  include gnome::vnc

  package { rivendell: 
    require => Apt::Source[tryphon],
    ensure => latest
  }
  
  file { "/usr/share/rivendell/rdairplay_fr.qm":
    source => "puppet:///files/rivendell/fr/rdairplay_fr.qm",
    require => Package[rivendell]
  }
  file { "/usr/share/rivendell/librd_fr.qm":
    source => "puppet:///files/rivendell/fr/librd_fr.qm",
    require => Package[rivendell]
  }

  include rivendell::mpeg
  include rivendell::station::user

  include rivendell::audio
  include rivendell::common

  # Used by dropboxes
  file { "/var/log.model/rivendell":
    ensure => directory,
    group => rivendell,
    mode => 775,
    require => Package[rivendell]
  }
}

class rivendell::common {
  file { "/etc/rd.conf":
    source => ["puppet:///files/rivendell/rd.conf.${box_name}", "puppet:///files/rivendell/rd.conf"]
  }

  if defined(Package[rivendell]) {
    File["/etc/rd.conf"] { require => Package[rivendell] }
  } else {
    File["/etc/rd.conf"] { require => Package[rivendell-server] }
  }

  group { rivendell: 
    gid => 2000
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

class rivendell::station::user {
  include locales

  user { radio:
    uid => 2000,
    groups => [audio, rivendell],
    password => '$6$2Dpz3yn7$IUNqUluNiMLZq6aYDc3cK43BiTKOamNxegwed3PVfMnMbJHDtgyCQnD0OSkBDkJdUAFlZNjb993un4ixe1xOX/',
    home => "/home/radio",
    require => Package[rivendell],
    shell => "/bin/bash"
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

  include rsync
  file { "/etc/puppet/manifests/classes/rivendell-station.pp":
    source => "puppet:///files/rivendell/manifest-station.pp"
  }

  package { polymer: }
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

  file { "/usr/local/bin/rivendell-init-radio-home": 
    source => "puppet:///files/rivendell/rivendell-init-radio-home",
    mode => 755
  }

}

class rivendell::server {
  include apt::tryphon
# include rivendellcontrol

  include rivendell::common
  include rivendell::mpeg
  include rivendell::storage
  include rivendell::nfs

  include mysql::server
  include ftp::server

  package { rivendell-server: 
    require => Apt::Source[tryphon],
    ensure => latest
  }

  if ! defined(User[radio]) {
    user { radio:
      uid => 2000,
      groups => rivendell,
      shell => "/bin/false"
    }
  }

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

  file { "/usr/local/sbin/rivendell-add-station":
    source => "puppet:///files/rivendell/rivendell-add-station",
    mode => 755
  }

  file { "/etc/init.d/rivendell-db":
    source => "puppet:///files/rivendell/rivendell-db.init",
    mode => 755
  }

  exec { "update-rc.d-rivendell-db":
    command => "insserv rivendell-db",
    require => [File["/etc/init.d/rivendell-db"], Package[mysql-server]],
    unless => "ls /etc/rc?.d/S*rivendell-db > /dev/null 2>&1"
  }

  file { "/usr/local/sbin/rivendell-backup-db":
    source => "puppet:///files/rivendell/rivendell-backup-db",
    mode => 755
  }

  file { "/etc/cron.daily/rivendell-backup-db":
    ensure => "/usr/local/sbin/rivendell-backup-db",
    require => Package[cron]
  }
}

class rivendell::storage {
  include box::storage
}

class rivendell::nfs {
  include nfs::common

  package { [nfs-kernel-server, portmap]: }

  file { "/etc/exports": 
    source => "puppet:///files/nfs/exports"
  }
}

class rivendell::station::nfs {
  include nfs::common

  file { "/var/snd": 
   ensure => directory 
  }

  include autofs
  
  package { strace: }

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

  file { ["/nfs", "/nfs/dropboxes"]:
    ensure => directory
  }

}

class rivendell::box::nas {
  include rivendell::server  
  include dnsmasq
  include dnsmasq::dhcp
  include release::airbox
  include network::vlan
  include network::iptables
  include network::gateway
  include rsyslog::server

  # FIXME
  file { "/etc/cron.hourly/ping-for-remote-ip":
    content => "#!/bin/sh\nwget -q -O /dev/null \"http://download.tryphon.eu/rivendellboxes/latest.yml?macaddress=`facter macaddress`\"\n",
    mode => 755
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

  file { "/etc/puppet/manifests/classes/rivendell-box-all.pp":
    source => "puppet:///files/rivendell/manifest-box-all.pp"
  }
}
