class xorg {
  # make live easier for driver gma500_gfx
  package { 'xserver-xorg-video-modesetting': }

  file { "/etc/modprobe.d/gma500_gfx.conf":
    content => "blacklist gma500_gfx\n"
  }
  
}
