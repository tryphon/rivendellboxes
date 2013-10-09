Steto.config do
  check :box_air_release do
    box_air_release = box.release.name.gsub("nas","air")
    File.exists? "/srv/rivendell/boot/initrd-#{box_air_release}.img"
  end
end
