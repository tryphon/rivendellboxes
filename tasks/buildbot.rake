boxes = %w{rivendellallbox rivendellnasbox rivendellairbox}

task :buildbot do
  # clean after build
  cleans = boxes.map { |box| "#{box}:clean" }
  FileUtils::sh "rake #{cleans.join(' ')}"
end

boxes.each { |box| task :buildbot => "#{box}:clean" }
boxes.each { |box| task :buildbot => "#{box}:dist:all" }
task :buildbot => "rivendellboxes:dist:upgrade"
boxes.each { |box| task :buildbot => "#{box}:buildbot:dist" }
task :buildbot => "rivendellboxes:buildbot:dist"

