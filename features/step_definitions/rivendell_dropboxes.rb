require 'pathname'
require 'taglib'

def create_sound_file(attributes = {})
  file = Tempfile.new(["sound_file", ".#{attributes[:format]}"])
  file.close

  system "sox -n -b 16 -r 48000 -c 2 -t #{attributes[:format]} #{file.path} synth 3:00 sine 1000 fade q 10 3:00 10" or raise "Can't create sound file"

  TagLib::FileRef.open(file.path) do |fileref|
    tag = fileref.tag
    tag.title = attributes[:title] if attributes[:title]

    fileref.save
  end

  file.path
end

When /^a sound file is dropped into "([^"]*)" with title "([^"]*)"$/ do |dropbox_file, title|
  dropbox_file = Pathname.new(dropbox_file)

  attributes = {
    :title => title,
    :format => 'mp3'
  }

  file = create_sound_file attributes

  current_box.ftp do |ftp|
    ftp_file = Pathname.new("/dropboxes").join(dropbox_file)

    ftp_file.dirname.descend do |directory|
      begin
        ftp.ls directory
      rescue Net::FTPTempError
        ftp.mkdir directory.to_s
      end
    end

    ftp.putbinaryfile file, ftp_file.to_s
  end

  File.delete file
end
