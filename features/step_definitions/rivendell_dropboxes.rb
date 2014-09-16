require 'pathname'
require 'taglib'

def create_sound_file(attributes = {}, &block)
  Tempfile.open(["sound_file", ".#{attributes[:format]}"]) do |file|
    system "sox -n -b 16 -r 48000 -c 2 -t #{attributes[:format]} #{file.path} synth 3:00 sine 1000 fade q 10 3:00 10" or raise "Can't create sound file"

    TagLib::FileRef.open(file.path) do |fileref|
      tag = fileref.tag
      tag.title = attributes[:title] if attributes[:title]

      fileref.save
    end

    yield file.path
  end
end

When /^a sound file is dropped into "([^"]*)"(?: with title "([^"]*)")?$/ do |dropbox_file, title|
  dropbox_file = Pathname.new(dropbox_file)

  attributes = {
    :format => File.extname(dropbox_file)[1..-1]
  }
  attributes[:title] = title if title

  create_sound_file(attributes) do |file|
    current_box.ftp do |ftp|
      ftp_file = Pathname.new("/dropboxes").join(dropbox_file)

      # mkdir_p
      ftp_file.dirname.descend do |directory|
        begin
          ftp.ls directory
        rescue Net::FTPTempError
          ftp.mkdir directory.to_s
        end
      end

      ftp.putbinaryfile file, ftp_file.to_s
    end
  end
end
