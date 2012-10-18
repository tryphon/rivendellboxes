Steto.config do
  nagios "rivendell_mysql", "check_mysql", :database => "Rivendell"

  %w{backup ftp home mysql snd tmp}.each do |name|
    check :"rivendell_#{name}_directory" do
      File.directory? "/srv/rivendell/#{name}"
    end
  end
end
