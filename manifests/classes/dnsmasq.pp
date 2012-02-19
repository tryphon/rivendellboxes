class dnsmasq {
  package { dnsmasq: }

  readonly::mount_tmpfs { "/etc/dnsmasq.d": }
}
