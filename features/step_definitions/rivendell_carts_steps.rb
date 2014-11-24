require 'rivendell/api'

def rivendell_xport
  @xport ||= Rivendell::API::Xport.new(:host => current_box.ip_address)
end

Then /^a cart "([^"]*)" should exist in group "([^"]*)"$/ do |title, group|
  rivendell_xport.list_carts(:group_name => group).map(&:title).should include(title)
end

Then /^a cart should exist in group "([^"]*)" with attributes:$/ do |group, table|
  attributes = table.raw.each_with_object({}) do |pair, attributes|
    attribute, value = pair
    attributes[attribute.to_sym] = value
  end
  rivendell_xport.list_carts(:group_name => group).should have_cart_matching(attributes)
end
