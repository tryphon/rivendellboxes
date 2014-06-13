require "net/vnc"

def vnc(options = {}, &block)
  timeout = options.delete(:timeout) || 20
  options = { :shared => true, :password => @vnc_password }.merge(options)

  vnc = nil
  wait_for(timeout) do
    vnc = Net::VNC.new "#{current_box.ip_address}:0", options
  end

  begin
    yield vnc
  ensure
    vnc.close
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

def vnc_screenshot_name
  @vnc_screenshot_id ||= 0
  @vnc_screenshot_id += 1
  [Time.now.strftime('%Y%m%d-%H%M%S'), @scenario_key, @vnc_screenshot_id].join '-'
end

Then /^a screenshot is saved$/ do
  raise "No known vnc password" unless @vnc_password

  Tempfile.open "vncpassword" do |f|
    f.close
    Net::VNC.save_password @vnc_password, f.path

    filename = "tmp/screenshots/#{vnc_screenshot_name}.jpg"
    FileUtils.mkdir_p File.dirname(filename)

    command = "vncsnapshot -quiet -passwd #{f.path} #{current_box.ip_address}:0 #{filename} > /dev/null 2>&1"
    if system command
      puts "Saved #{filename}"
    end
  end
end
