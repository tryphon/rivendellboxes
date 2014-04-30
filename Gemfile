source 'https://rubygems.org'

gem "rake"
gem "system-builder", :git => "git://projects.tryphon.priv/system-builder" #, :path => "~/Projects/SystemBuilder"
gem "tryphon-vmbox", :git => "git://projects.tryphon.priv/vmbox" #, :path => "~/Projects/VMBox"
gem "qemu", :git => "git://projects.tryphon.priv/ruby-qemu" #, :path => "~/Projects/RubyQEMU"

gem "puppet-syntax"
gem "puppet-lint"

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
