exec { 'copy-nfs-model':
  creates => '/var/lib/nfs/v4recovery',
  command => 'cp -a /var/lib/nfs.model/* /var/lib/nfs/',
  tag => boot
}
