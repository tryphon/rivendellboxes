require 'vmbox'

def current_box
  @current_box ||= VMBox.new("rivendellallbox")
end
