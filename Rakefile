Dir[File.join(File.dirname(__FILE__), "tasks", "*.rake")].each { |t| load t }

require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.multiple_boxes = true

SystemBuilder::BoxTasks.new(:rivendellallbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.size = 1024.megabytes
  end
end

SystemBuilder::BoxTasks.new(:rivendellnasbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.size = 512.megabytes
  end
end

SystemBuilder::BoxTasks.new(:rivendellairbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.size = 600.megabytes
  end
end

namespace :rivendellallbox do
  namespace :storage do
    desc "Create storage disk"
    task :create do
      sh "qemu-img create -f qcow2 dist/rivendellallbox/storage 1G"
    end
  end
end

namespace :rivendellnasbox do
  namespace :storage do
    desc "Create storage disk"
    task :create do
      if ENV['COUNT'] == "2"
        2.times do |n|
          file = "dist/rivendellnasbox/storage#{n+1}"
          sh "qemu-img create -f raw #{file} 3G" unless File.exists?(file)
        end
      else
        sh "qemu-img create -f qcow2 dist/rivendellnasbox/storage 3G"
      end
    end
  end
end
