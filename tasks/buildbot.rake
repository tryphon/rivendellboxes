boxes = %{rivendellallbox rivendellnasbox rivendellairbox}

task :buildbot do
  # clean after build
  cleans = boxes.map { |box| "#{box}:clean" }
  FileUtils::sh "rake #{cleans.join(' ')}"
end

boxes.each do |box|
  task :buildbot => ["#{box}:clean" , "#{box}:dist:all"]
end

# %{rivendellallbox rivendellnasbox rivendellairbox}.each do |box|
#   task :buildbot => "#{box}:buildbot:dist"
# end
