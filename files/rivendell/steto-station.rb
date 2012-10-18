Steto.config do
  nagios :rivendellnas_mysql, "check_mysql", :database => "Rivendell", :host => "rivendellnas"

  check :rivendellnas_snd do
    Dir["/var/snd/*.wav"].present?
  end

  process "caed"
  process "ripcd"
  process "rdcatchd"

  nagios "xorg_process", "check_procs", :critical => "1:", :argument => "/usr/bin/X"
end
