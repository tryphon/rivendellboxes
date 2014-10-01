# coding: utf-8

Rivendell::Import.config do |config|
  config.to_prepare do |file|
    # Files are ignored by default
    # Les fichiers sont ignorés par défault
    task.cancel!

    cart.default_title = file.basename

    # file.in("music") do
    #   cart.group = "MUSIC"
    #   task.priority = 1
    # end

    # To delete file when task is completed
    #task.delete_file!

    # cart.group ||= "TEMP"
    # task.priority ||= 10
  end

  # Enable direct database access
  config.db_url = 'mysql://rduser:letmein@localhost/Rivendell?reconnect=true'
end
