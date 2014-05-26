require "net/vnc"

def vnc(options = {}, &block)
  options = { :shared => true, :password => @vnc_password }.merge(options)
  Net::VNC.open "#{current_box.ip_address}:0", options do |vnc|
    yield vnc
  end
end

Then /^a VNC access should be possible with password "([^"]*)"$/ do |password|
  vnc :password => password do |vnc|
    vnc.pointer_move 10, 10
  end
end

Then /^a VNC access should not be possible$/ do
  lambda {
    vnc
  }.should raise_error(Errno::ECONNREFUSED)
end

Given /^a VNC access has been configured$/ do
  @vnc_password = (0...8).map { (65 + rand(26)).chr }.join
  steps %Q{
    Given the box configuration contains vnc_password = "#{@vnc_password}"
    Given the configuration is applied
  }
end
