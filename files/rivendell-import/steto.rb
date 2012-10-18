Steto.config do
  # :command => "rivendell-import" doesn't find the process, it's 'rivendell-impor'
  nagios "rivendell_import_process", "check_procs", :critical => "1:", :argument => "rivendell-import"

  nagios "rivendell_import_http", "check_http", :host => "127.0.0.1", :port => 4567
end
