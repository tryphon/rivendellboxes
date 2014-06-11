class alsa::hdsp {
  package { alsa-tools-gui: }
  file { '/usr/local/bin/hdspmixer-if-present':
    source => "puppet:///files/alsa/hdspmixer-if-present"
  }
}
