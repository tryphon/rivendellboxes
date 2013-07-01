class MoveToVlan100 < Box::Config::Migration

  def up
    if network_interfaces = config[:network_interfaces]
      unless network_interfaces.select { |inteface| interface[:id] == "vlan100" }
        config[:network_interfaces] << { :id => "vlan", :method => "dhcp", :options => "nat" }.merge(config.attributes("network_iface1"))
      end
    end
  end

end
