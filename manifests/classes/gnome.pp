class gdm {
  package { gdm: 
    require => Package[xserver-xorg]
  }

  readonly::mount_tmpfs { "/var/lib/gdm": }

  if $gdm_automaticlogin {
    # TODO /etc/gdm/custom.conf doesn't seem supported on lenny
    file { "/etc/gdm/gdm.conf":
      content => "[daemon]
AutomaticLoginEnable=true
AutomaticLogin=$gdm_automaticlogin
",
      require => Package[gdm]
    }
  }
}

class gnome::minimal {
  include gdm
  
  package { xserver-xorg: }
  # Selected from gnome-core dependencies
  package { [ desktop-base,dmz-cursor-theme,eog,epiphany-browser,evince,file-roller,gedit,gnome-control-center,gnome-icon-theme,gnome-keyring,gnome-menus,gnome-panel,gnome-power-manager,gnome-session,gnome-settings-daemon,gnome-terminal,gtk2-engines,gvfs,gvfs-backends,metacity,nautilus,policykit-1-gnome,gnome-themes,gnome-screenshot ]: }
}

class gnome::vnc {
  package { vino: }
}



