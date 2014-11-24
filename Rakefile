require 'system_builder/box_tasks'

SystemBuilder.define_tasks(:rivendellallbox, :rivendellairbox, :rivendellnasbox) do |box|
  if [ :rivendellallbox, :rivendellairbox ].include? box.name
    box.disk_image do |image|
      image.kernel_options = "usbhid.quirks=0xeef:0x1:0x40"
    end
  end

  if box.name == :rivendellallbox
    box.vmbox.memory = 1024
  end
end
