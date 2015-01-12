ENV['BOX_RELEASE_NUMBER'] ||= SystemBuilder::Box.default_release_number

boxes = %w{rivendellallbox rivendellnasbox rivendellairbox}

desc "Run continuous integration tasks (spec, ...)"
task :ci do
  # clean after build
  cleans = boxes.map { |box| "#{box}:clean" }
  FileUtils::sh "rake #{cleans.join(' ')}"
end

task :ci => %w{lint spec}

boxes.each { |box| task :ci => "#{box}:clean" }
boxes.each { |box| task :ci => "#{box}:dist:all" }
task :ci => "rivendellboxes:dist:upgrade"
boxes.each { |box| task :ci => "#{box}:ci:dist" }
task :ci => "rivendellboxes:ci:dist"
