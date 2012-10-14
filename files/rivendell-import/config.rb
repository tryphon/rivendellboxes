Rivendell::Import.config do |config|
  config.to_prepare do |file|
    file.in("music") do
      cart.group = "MUSIC"
    end
  
    # To delete file when task is completed
    #task.delete_file!
 
    cart.group ||= "TEMP"
  end
end
