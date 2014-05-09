Steto.config do
  process "x11vnc", :level => :warning if box.config["vnc_password"]
end
