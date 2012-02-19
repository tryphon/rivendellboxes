# TODO NFS isn't ready at boot
# exec { "rivendell-radio-home":
#   command => "rsync -a /etc/skel/ /home/radio/",
#   creates => "/home/radio/skel/.profile",
#   tag => boot,
#   user => radio
# }

