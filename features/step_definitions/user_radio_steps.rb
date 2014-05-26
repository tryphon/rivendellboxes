When /^the user radio runs command "([^"]*)"$/ do |command|
  steps "Given a VNC access has been configured"
  vnc do |vnc|
    vnc.key_down :alt
    vnc.key_press :f2
    vnc.key_up :alt
    vnc.type command
    vnc.key_press :return
  end
end
