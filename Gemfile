source 'https://rubygems.org'

gem "rake"
gem "system-builder", :git => "git://projects.tryphon.priv/system-builder", :path => "~/Projects/SystemBuilder"
gem "tryphon-vmbox", :git => "git://projects.tryphon.priv/vmbox"#, :path => "~/Projects/VMBox"

group :test, :cucumber do
  gem "rspec"
  gem "tryphon-box", :git => "git://projects.tryphon.priv/box" #, :path => "~/Projects/Box"
end

group :test do
  gem "guard"
  gem "guard-rspec"
end

group :cucumber do
  gem 'capybara'
  gem 'cucumber'
  gem 'capybara-mechanize', :git => "git://github.com/albanpeignier/capybara-mechanize.git"
end
