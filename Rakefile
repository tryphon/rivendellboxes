Dir[File.join(File.dirname(__FILE__), "tasks", "*.rake")].each { |t| load t }

require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'


SystemBuilder::BoxTasks.new(:rivendellbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.size = 1024.megabytes
  end
end

task :buildbot => "rivendellbox:buildbot"

namespace :rivendellbox do
  namespace :storage do
    desc "Create storage disk"
    task :create do
      sh "qemu-img create -f qcow2 dist/storage 1G"
    end
  end
end
