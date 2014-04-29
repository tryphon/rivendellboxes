class consolekit {
  package { consolekit: }

  if $debian::wheezy {
    apt::source::pin { [consolekit, libck-connector0]:
      source => "wheezy-backports",
      before => Package[consolekit]
    }
  }
}
