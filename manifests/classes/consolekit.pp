class consolekit {
  package { [consolekit, policykit-1]: }

  if $debian::wheezy {
    apt::source::pin { [consolekit, libck-connector0]:
      source => "wheezy-backports",
      before => Package[consolekit]
    }
  }

  file { "/etc/polkit-1/localauthority/50-local.d/udisks.pkla":
    source => "puppet:///files/polkit/udisks.pkla",
    require => Package[policykit-1]
  }
}
