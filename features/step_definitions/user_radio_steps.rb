When /^the user radio runs command "([^"]*)"$/ do |command|
  steps "Given a VNC access has been configured"
  vnc do |vnc|
    # Show desktop
    vnc.key_press :control, :alt, "d"

    vnc.key_press :alt, :f2
    vnc.type command
    vnc.key_press :return
  end
end

Given /^the user radio opens "([^"]*)" in thunar$/ do |path|
  step "the user radio runs command \"thunar #{path}\""
end

Given /^the user radio opens ftp url "([^"]*)" in thunar$/ do |url|
  step "the user radio opens \"#{url}\" in thunar"
  # First ftp connection asks confirmation
  vnc do |vnc|
    sleep 1
    vnc.key_press :return
  end
end

When /^the user radio creates a new directory "([^"]*)" in thunar$/ do |name|
  vnc do |vnc|
    vnc.key_press :shift, :control, "N"
    vnc.type name
    vnc.key_press :return
  end
  sleep 1
end
