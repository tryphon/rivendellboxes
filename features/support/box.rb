require 'vmbox'
require 'open-uri'
require 'fileutils'

def current_box
  @current_box ||= VMBox.new("rivendellallbox")
end

Before do
  Capybara.app_host = current_box.url
end

def before_rollback(&block)
  (@before_rollback_callbacks ||= []) << block
end

After do |scenario|
  if scenario.failed?
    open(current_box.url("log.gz"), "rb") do |read_file|
      File.open("log/cucumber-syslog-#{Time.now.to_i}.gz", "wb") do |saved_file|
        FileUtils.copy_stream read_file, saved_file
      end
    end
  end

  @before_rollback_callbacks.each do |hook|
    hook.call scenario
  end if @before_rollback_callbacks

  retry_count = 0
  begin
    current_box.rollback
  rescue Timeout::Error => e
    retry_count += 1
    VMBox.logger.error "Rollback failed : #{e}"
    if retry_count < 10
      retry
    else
      VMBox.logger.error "Stop tests"
      Cucumber.wants_to_quit = true
    end
  end
end
