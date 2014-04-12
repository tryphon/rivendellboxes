service { dnsmasq:
  ensure => running
}

dnsmasq::conf { "default-dns-servers":
  content => "server=8.8.8.8\nserver=8.8.4.4\n",
  ensure => $network_default_dns ? {
    "true" => present,
    true => present,
    default => absent
  }
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
