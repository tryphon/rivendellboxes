class MoveToVlan100 < Box::Config::Migration

  def up
    network_interfaces = config[:network_interfaces]
    unless network_interfaces and network_interfaces.find { |interface| interface[:id] =~ /^vlan/ }
      config[:network_interfaces] ||= []
      config[:network_interfaces] << { :id => "vlan100", :method => "dhcp", :options => "nat" }.merge(config.attributes("network_iface1"))
    end
  end

end
