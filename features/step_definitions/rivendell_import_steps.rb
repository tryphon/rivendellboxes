require 'tempfile'
require 'httparty'

Given /^the rivendell import is configured with$/ do |config|
  current_box.ftp do |ftp|
    Tempfile.open("rivendell_import_config") do |f|
      f.write config
      f.close

      ftp.puttextfile f.path, "/dropboxes/config.rb"
    end
  end
end

When /^all rivendell import tasks are completed$/ do
  tasks = []
  begin
    wait_for do
      tasks = HTTParty.get("http://#{current_box.ip_address}:4567/tasks.json", :format => :json)
      not tasks.empty? and tasks.all? { |t| t['status'] == 'completed' }
    end
  rescue => e
    raise "Remaining tasks #{tasks.parsed_response.inspect}"
  end
end

When /^the rivendell import web interface should be available$/ do
  wait_for do
    Net::HTTP.get(URI("http://#{current_box.ip_address}:4567/tasks"))
  end
end

def wait_for(limit = 60, &block)
  time_limit = Time.now + limit
  begin
    sleep limit / 20
    raise "Timeout" if Time.now > time_limit
  end until yield
end
