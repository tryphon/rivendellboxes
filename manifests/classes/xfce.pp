class xfce {
  package { xfce4: }

  include lightdm
  include xfce::default_config
}

class xfce::default_config {
  file { ['/etc/skel/.config/xfce4',
    '/etc/skel/.config/xfce4/xfconf',
    '/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml']:
    ensure => directory
  }

  file { '/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/thunar-volman.xml':
    source => 'puppet:///files/xfce/config/thunar-volman.xml'
  }
}

class lightdm {
  include consolekit
  package { lightdm:
    require => Package[consolekit]
  }

  readonly::mount_tmpfs { "/var/lib/lightdm": }

  $config_file = '/etc/lightdm/lightdm.conf'

  exec { "ligthdm-enable-autologin-user":
    command => "sed -i 's/.*autologin-user=.*/autologin-user=radio/' $config_file",
    unless => "grep ^autologin-user=radio$ $config_file",
    require => Package[lightdm]
  }
}
