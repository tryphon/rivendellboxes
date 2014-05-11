require 'rivendell/api'

Then /^a cart "([^"]*)" should exist in group "([^"]*)"$/ do |title, group|
  xport = Rivendell::API::Xport.new(:host => current_box.ip_address)
  xport.list_carts(:group_name => group).any? { |cart| cart.title == title }
end
