class mount {
  readonly::mount_tmpfs { "/media": }
  package { eject: }
}
