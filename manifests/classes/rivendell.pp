class rivendell::station {
  include apt::tryphon
  include apt::multimedia

  $gdm_automaticlogin = "radio"
  include gnome::minimal
  include gnome::vnc

  package { rivendell: 
    require => Apt::Source[tryphon]
  }
  include rivendell::mpeg
  include rivendell::station::user

  include rivendell::audio
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
  user { radio:
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
    ensure => "/srv/ftp/rivendell"
  }

  define desktop_launcher() {
    exec { "install-desktop-launcher-$name":
      command => "install --mode=755 /usr/share/applications/$name.desktop /etc/skel/Desktop/",
      creates => "/etc/skel/Desktop/$name.desktop",
      require => [Package[rivendell], File["/etc/skel/Desktop"]]
    }
  }

  desktop_launcher { [rdairplay, rdadmin, rdlibrary, rdlogedit]: }

  # Used by dropboxes
  file { "/var/log.model/rivendell":
    ensure => directory,
    group => rivendell,
    mode => 775,
    require => Package[rivendell]
  }
}

class rivendell::server {
  include apt::tryphon
# include rivendellcontrol

  include rivendell::mpeg
  include rivendell::storage
  include rivendell::nfs

  include mysql::server
  include ftp::server

  package { rivendell-server: 
    require => Apt::Source[tryphon]
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

  # TODO update debian package with this script
  file { "/etc/init.d/rivendell":
    source => "puppet:///files/rivendell/rivendell.init"
  }

  file { "/etc/rd.conf":
    source => "puppet:///files/rivendell/rd.conf"
  }

  file { "/etc/default/rivendell":
    source => "puppet:///files/rivendell/rivendell.default"
  }
}

class rivendell::storage {
  include box::storage
}

class rivendell::nfs {
  package { [nfs-kernel-server, portmap]: }

  file { "/etc/exports": 
    content => "/var/snd *(ro,async)\n"  
  }

  readonly::mount_tmpfs { "/var/lib/nfs": }

}
