class nfs::common {
  package { nfs-common: }

  # To create directories lost by tmpfs
  file { "/etc/init.d/nfs-common":
    source => "puppet:///files/nfs/nfs-common.init",
    mode => 775
  }

  exec { 'create-nfs-model':
    command => 'mv /var/lib/nfs /var/lib/nfs.model',
    creates => '/var/lib/nfs.model',
    require => Package['nfs-common']
  }
  file { '/var/lib/nfs':
    ensure => directory,
    require => Exec['create-nfs-model']
  }
  file { '/etc/puppet/manifests/classes/nfs-common.pp':
    source => 'puppet:///files/nfs/manifest.pp'
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
  package { 'nfs-kernel-server':
    before => Exec['create-nfs-model']
  }
}
