#!/usr/bin/env ruby1.9.1

require 'pathname'
require 'fileutils'

class Object

  def try(method, *args)
    send method, *args unless nil?
  end

end

class Pathname

  def copy_file(src, dest, preserve = false, dereference = true)
    FileUtils.copy_file src, join(dest), preserve, dereference
  end

  def chown_r(user, group, options = {})
    FileUtils.chown_R user, group, @path, options
  end
  alias_method :chown_R, :chown_r

end

class Station

  attr_accessor :name
  attr_accessor :ip_address
  attr_accessor :mac_address

  def add
    return if exist?
    raise "Invalid station #{inspect}" unless name and ip_address

    puts "Add host #{name}/#{ip_address} #{mac_address}"

    query = <<-EOF
      INSERT INTO STATIONS (NAME, DESCRIPTION, USER_NAME, DEFAULT_NAME, IPV4_ADDRESS) VALUES ('#{name}','#{default_name}','user','user','#{ip_address}');
      INSERT INTO SERVICE_PERMS (STATION_NAME, SERVICE_NAME) VALUES ('#{name}','Production');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',0,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',1,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',2,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',3,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',4,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',5,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',6,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',7,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',8,'','');
      INSERT INTO RDAIRPLAY_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',9,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',0,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',1,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',2,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',3,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',4,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',5,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',6,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',7,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',8,'','');
      INSERT INTO RDPANEL_CHANNELS (STATION_NAME, INSTANCE, START_RML, STOP_RML) VALUES ('#{name}',9,'','');
    EOF

    IO.popen(mysql, "w") do |mysql|
      mysql.puts query
    end

    home.try :create
  end

  def default_name
    "#{box_type} #{mac_address}".strip
  end

  def box_type
    name == 'rivendellallbox' ? 'RivendellAllBox' : 'RivendellAirBox'
  end

  def home
    @home ||= Home.new(mac_address) if mac_address and Home.required?
  end

  def mysql
    "mysql -u rduser -pletmein Rivendell"
  end

  def exist?
    `#{mysql} -NBe "select true from STATIONS where NAME='#{name}'"`.strip == "1"
  end

end

class Home

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  @@directory = Pathname.new("/srv/rivendell/home")
  def self.directory
    @@directory
  end

  def self.required?
    directory.exist?
  end

  def directory
    Pathname.new("/srv/rivendell/home").join name
  end

  def create
    return if directory.exist?

    directory.mkpath
    directory.copy_file '/usr/local/share/rivendell/xsessionrc', '.xsessionrc'
    directory.chown_r 'radio', 'rivendell'
  end

end

return unless File.expand_path($0) == File.expand_path(__FILE__)

if ARGV.first(2) == %w{station add}
  ARGV.shift 2
  Station.new.tap do |station|
    while argument = ARGV.pop
      if argument =~ /--([^=]+)=(.+)/
        value = $2
        attribute_name = $1.gsub("-","_")
        station.send "#{attribute_name}=", value
      else
        raise "Invalid argument : #{argument}"
      end
    end
  end.add
end
