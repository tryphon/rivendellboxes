class ftp::server {
  package { proftpd-basic: alias => proftpd }

  file { "/srv/ftp":
    ensure => directory
  }

  readonly::mount_tmpfs { "/srv/ftp": }

  file { "/etc/proftpd/proftpd.conf":
    source => "puppet:///files/proftpd/proftpd.conf",
    require => Package[proftpd]
  }
}

class ftp::client {
  package { lftp: }
}
