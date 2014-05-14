When /^the test USB disk is plugged$/ do
  disk_file = File.expand_path '../../fixtures/usbdisk.qcow2', __FILE__

  current_box.qemu_monitor.drive_add 0, :id => 'usb_disk', :if => 'none', :file => disk_file
  current_box.qemu_monitor.device_add 'usb-storage', :id => 'usb_disk', :drive => 'usb_disk'

  sleep 5

  before_rollback do |scenario|
    current_box.qemu_monitor.device_del 'usb_disk'
  end
end
