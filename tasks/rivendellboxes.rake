namespace :rivendellboxes do

  class RivendellBoxes

    def release_name
      "rivendellboxes-#{release_number}"
    end

    def release_filename
      release_name
    end

    def release_number
      @release_number ||= YAML.load(IO.read("dist/rivendellairbox/latest.yml"))["name"].scan(/box-([0-9-]+)$/).join
    end

    def upgrade_file
      "dist/rivendellboxes/upgrade.tar"
    end

    def latest_file
      SystemBuilder::LatestFile.new(self)
    end

  end

  def rivendell_boxes
    @rivendell_boxes ||= RivendellBoxes.new
  end

  namespace :dist do
    desc "Create joined upgrade files for RivendellNas/AirBoxes"
    task :upgrade do
      mkdir_p "dist/rivendellboxes"
      sh "tar -cf dist/rivendellboxes/upgrade.tar -C dist rivendellairbox/latest.yml rivendellairbox/upgrade.tar rivendellnasbox/latest.yml rivendellnasbox/upgrade.tar"
      rivendell_boxes.latest_file.create("dist/rivendellboxes/latest.yml")
    end
  end

  namespace :ci do
    task :dist do
      target_directory = (ENV['DIST'] or "#{ENV['HOME']}/dist/rivendellboxes")
      mkdir_p target_directory
      cp "dist/rivendellboxes/upgrade.tar", "#{target_directory}/#{rivendell_boxes.release_filename}.tar"
      cp "dist/rivendellboxes/latest.yml", "#{target_directory}/#{rivendell_boxes.release_filename}.yml"
      ln_sf "#{target_directory}/#{rivendell_boxes.release_filename}.yml", "#{target_directory}/latest.yml"
    end
  end

  desc "Tag and publish latest ci RivendellAir&NasBoxes release"
  task :release do
    SystemBuilder::Publisher.new("rivendellboxes").publish
  end

end
