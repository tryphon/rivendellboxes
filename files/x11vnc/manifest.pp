file { '/var/etc/x11vnc':
  ensure => directory,
  tag => boot
}

if $vnc_password != '' {
  file { '/var/etc/x11vnc/password':
    content => $vnc_password,
    mode    => '0600',
    notify  => Service['x11vnc'],
    tag     => boot
  }
  service { 'x11vnc': ensure => running, hasstatus => false }
} else {
  file { '/var/etc/x11vnc/password':
    ensure => absent
  }
  service { 'x11vnc': ensure => stopped, hasstatus => false }
}
