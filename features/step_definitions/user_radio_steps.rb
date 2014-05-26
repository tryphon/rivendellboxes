When /^the user radio starts a "([^"]*)"$/ do |command|
  current_box.ssh "su -l -c '#{command}' radio"
end
