Dir[File.join(File.dirname(__FILE__), "tasks", "*.rake")].each { |t| load t }

require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.multiple_boxes = true

kernel_options = "usbhid.quirks=0xeef:0x1:0x40"

SystemBuilder::BoxTasks.new(:rivendellallbox) do |box|
  box.boot do |boot|
    boot.version = :wheezy
    boot.architecture = :amd64
  end
  box.disk_image do |image|
    image.kernel_options = kernel_options
  end
  box.vmbox.memory = 1024
end

SystemBuilder::BoxTasks.new(:rivendellnasbox) do |box|
  box.boot do |boot|
    boot.version = :wheezy
    boot.architecture = :amd64
  end
end

SystemBuilder::BoxTasks.new(:rivendellairbox) do |box|
  box.boot do |boot|
    boot.version = :wheezy
    boot.architecture = :amd64
  end
  box.disk_image do |image|
    image.kernel_options = kernel_options
  end
end

namespace :rivendellboxes do

  def latest_release_number
    YAML.load(IO.read("dist/rivendellairbox/latest.yml"))["name"].scan(/box-([0-9-]+)$/).join
  end

  class RivendellBoxes

    def release_name
      "rivendellboxes-#{release_number}"
    end

    def release_filename
      release_name
    end

    def release_number
      @release_number ||=
        YAML.load(IO.read("dist/rivendellairbox/latest.yml"))["name"].scan(/box-([0-9-]+)$/).join
    end

    def upgrade_file
      "dist/rivendellboxes/upgrade.tar"
    end

    def latest_file
      SystemBuilder::LatestFile.new(self)
    end

  end

  namespace :dist do
    desc "Create joined upgrade files for RivendellNas/AirBoxes"
    task :upgrade do
      mkdir_p "dist/rivendellboxes"
      sh "tar -cf dist/rivendellboxes/upgrade.tar -C dist rivendellairbox/latest.yml rivendellairbox/upgrade.tar rivendellnasbox/latest.yml rivendellnasbox/upgrade.tar"
      RivendellBoxes.new.latest_file.create("dist/rivendellboxes/latest.yml")
    end
  end

  namespace :ci do
    task :dist do
      target_directory = (ENV['DIST'] or "#{ENV['HOME']}/dist/rivendellboxes")
      mkdir_p target_directory
      cp "dist/rivendellboxes/upgrade.tar", "#{target_directory}/rivendellboxes-#{latest_release_number}.tar"
      cp "dist/rivendellboxes/latest.yml", "#{target_directory}/rivendellboxes-#{latest_release_number}.yml"
      ln_sf "#{target_directory}/rivendellboxes-#{latest_release_number}.yml", "#{target_directory}/latest.yml"
    end
  end

  desc "Tag and publish latest ci RivendellAir&NasBoxes release"
  task :release do
    SystemBuilder::Publisher.new("rivendellboxes").publish
  end

end
