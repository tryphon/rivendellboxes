class consolekit {
  package { [consolekit, policykit-1]: }

  if $debian::wheezy {
    apt::source::pin { [consolekit, libck-connector0]:
      source => "wheezy-backports",
      before => Package[consolekit]
    }
  }
}
