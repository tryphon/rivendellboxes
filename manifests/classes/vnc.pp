class vnc::server {
  package { 'x11vnc': }

  # x11vnc -auth /var/run/lightdm/root/:0 -display :0 -forever -loop -shared -passwdfile /etc/x11vnc/password 2>&1 | logger -t x11vnc -i

  file { '/etc/init.d/x11vnc':
    source => 'puppet:///files/x11vnc/x11vnc.init',
    mode   => '0755'
  }
  initd_script { 'x11vnc':
    require => [File['/etc/init.d/x11vnc'], Package['lightdm']],
  }

  file { '/etc/x11vnc':
    ensure => directory
  }
  file { '/etc/x11vnc/password':
    ensure => link,
    target => '/var/etc/x11vnc/password'
  }

  file { '/etc/default/x11vnc':
    ensure => link,
    target => '/var/etc/default/x11vnc'
  }

  file { '/etc/puppet/manifests/classes/vnc.pp':
    source => 'puppet:///files/x11vnc/manifest.pp'
  }
}
