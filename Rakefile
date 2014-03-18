Dir[File.join(File.dirname(__FILE__), "tasks", "*.rake")].each { |t| load t }

require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.multiple_boxes = true

kernel_options = "usbhid.quirks=0xeef:0x1:0x40"

SystemBuilder::BoxTasks.new(:rivendellallbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.kernel_options = kernel_options
  end
end

SystemBuilder::BoxTasks.new(:rivendellnasbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
end

SystemBuilder::BoxTasks.new(:rivendellairbox) do |box|
  box.boot do |boot|
    boot.version = :squeeze
  end
  box.disk_image do |image|
    image.kernel_options = kernel_options
  end
end

namespace :rivendellallbox do
  namespace :storage do
    desc "Create storage disk"
    task :create do
      if ENV['COUNT'] == "2"
        2.times do |n|
          file = "dist/rivendellallbox/storage#{n+1}"
          sh "qemu-img create -f raw #{file} 3G" unless File.exists?(file)
        end
      else
        sh "qemu-img create -f raw dist/rivendellallbox/storage 3G"
      end
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
        sh "qemu-img create -f raw dist/rivendellnasbox/storage 3G"
      end
    end
  end
end

namespace :rivendellboxes do

  def latest_release_number
    YAML.load(IO.read("dist/rivendellairbox/latest.yml"))["name"].scan(/box-([0-9-]+)$/).join
  end

  namespace :dist do
    desc "Create joined upgrade files for RivendellNas/AirBoxes"
    task :upgrade do
      mkdir_p "dist/rivendellboxes"
      sh "tar -cf dist/rivendellboxes/upgrade.tar -C dist rivendellairbox/latest.yml rivendellairbox/upgrade.tar rivendellnasbox/latest.yml rivendellnasbox/upgrade.tar"
      SystemBuilder::LatestFile.new(:name => "rivendellboxes", :release_number => latest_release_number, :upgrade_file => "dist/rivendellboxes/upgrade.tar").create("dist/rivendellboxes/latest.yml")
    end
  end

  namespace :buildbot do
    task :dist do
      target_directory = (ENV['DIST'] or "#{ENV['HOME']}/dist/rivendellboxes")
      mkdir_p target_directory
      cp "dist/rivendellboxes/upgrade.tar", "#{target_directory}/rivendellboxes-#{latest_release_number}.tar"
      cp "dist/rivendellboxes/latest.yml", "#{target_directory}/rivendellboxes-#{latest_release_number}.yml"
      ln_sf "#{target_directory}/rivendellboxes-#{latest_release_number}.yml", "#{target_directory}/latest.yml"
    end
  end

  desc "Tag and publish latest buildbot RivendellAir&NasBoxes release"
  task :release do
    SystemBuilder::Publisher.new("rivendellboxes").publish
  end

end
