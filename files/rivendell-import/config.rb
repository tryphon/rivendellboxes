# coding: utf-8
Rivendell::Import.config do |config|
  config.to_prepare do |file|
    # Les fichiers sont ignorés par défault
    # Files are ignored by default
    task.cancel!

    # file.in("music") do
    #   cart.group = "MUSIC"
    # end

    # To delete file when task is completed
    #task.delete_file!

    # cart.group ||= "TEMP"
  end
end
