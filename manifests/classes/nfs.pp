class nfs::common {
  package { nfs-common: }

  # To create directories lost by tmpfs
  file { "/etc/init.d/nfs-common":
    source => "puppet:///files/nfs/nfs-common.init",
    mode => 775
  }

  readonly::mount_tmpfs { "/var/lib/nfs": }
}
