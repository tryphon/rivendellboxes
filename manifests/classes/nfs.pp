class nfs::common {
  package { nfs-common: }

  # To create directories lost by tmpfs
  file { "/etc/init.d/nfs-common":
    source => "puppet:///files/nfs/nfs-common.init",
    mode => 775
  }

  readonly::mount_tmpfs { "/var/lib/nfs": }
}

class nfs::client {
  include nfs::common
  file { "/etc/default/nfs-common":
    source => "puppet:///files/nfs/client/nfs-common.default",
  }
}

class nfs::server {
  include nfs::common
  package { [nfs-kernel-server, portmap]: }
}
