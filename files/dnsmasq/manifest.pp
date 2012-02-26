service { dnsmasq:
  ensure => running
}

define dnsmasq::conf($ensure = present, $source = '', $content = '') {
  $file_name="/etc/dnsmasq.d/$name"

  if $ensure == present {
    if $source != '' { 
      file { $file_name:
        source => $source
      }
    } else {
      file { $file_name:
        content => $content
      }
    }
  } else {
    file { $file_name:
      ensure => absent
    }
  }

  File[$file_name] {
    notify => Service[dnsmasq],
    tag => boot
  }
}
