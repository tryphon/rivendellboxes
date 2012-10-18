class ftp::server {
  package { proftpd-basic: alias => proftpd }

  file { "/etc/proftpd/proftpd.conf":
    source => "puppet:///files/proftpd/proftpd.conf",
    require => Package[proftpd]
  }

  steto::conf { proftpd: 
    source => "puppet:///files/proftpd/steto.rb"
  }
}

class ftp::client {
  package { lftp: }
}
