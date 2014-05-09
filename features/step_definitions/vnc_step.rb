require "net/vnc"

Then /^a VNC access should be possible with password "([^"]*)"$/ do |password|
  Net::VNC.open "#{current_box.ip_address}:0", :shared => true, :password => password do |vnc|
    vnc.pointer_move 10, 10
  end
end

Then /^a VNC access should not be possible$/ do
  lambda {
    Net::VNC.new("#{current_box.ip_address}:0")
  }.should raise_error(Errno::ECONNREFUSED)
end

Given /^a VNC access has been configured$/ do
  steps %q{
    Given the box configuration contains vnc_password = "previous_secret"
    Given the configuration is applied
  }
end
