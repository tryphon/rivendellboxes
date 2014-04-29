class xfce {
  package { xfce4: }

  include lightdm
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
