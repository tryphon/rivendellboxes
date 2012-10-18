Steto.config do
  process "dnsmasq"

  nagios "dns", "check_dns", :host => "download.tryphon.eu"
end
