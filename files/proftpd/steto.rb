Steto.config do
  process "proftpd"
  nagios "proftpd_ftp", "check_ftp", :host => "127.0.0.1"
end
