require 'pathname'
require 'taglib'

def create_sound_file(attributes = {}, &block)
  length = attributes.fetch(:length, "3:00")
  Tempfile.open(["sound_file", ".#{attributes[:format]}"]) do |file|
    system "sox -n -b 16 -r 48000 -c 2 -t #{attributes[:format]} #{file.path} synth #{length} sine 1000 fade q 10 #{length} 10" or raise "Can't create sound file"

    TagLib::FileRef.open(file.path) do |fileref|
      tag = fileref.tag
      tag.title = attributes[:title] if attributes[:title]

      fileref.save
    end

    yield file.path
  end
end

def drop_sound_file(dropbox_file, attributes = {})
  dropbox_file = Pathname.new(dropbox_file)

  attributes = attributes.merge({
    :format => File.extname(dropbox_file)[1..-1]
  })

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

When /^a sound file is dropped into "([^"]*)"$/ do |dropbox_file|
  drop_sound_file dropbox_file
end

When /^a sound file is dropped into "([^"]*)" with attributes:$/ do |dropbox_file, table|
  attributes = table.raw.each_with_object({}) do |pair, attributes|
    attribute, value = pair
    attributes[attribute.to_sym] = value
  end
  drop_sound_file dropbox_file, attributes
end
