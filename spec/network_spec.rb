require 'spec_helper'

describe "Network" do
  describe "migration CreateNetworkInterfaces" do

    let(:config) { Box::PuppetConfiguration.new }
    let(:migration) { Box::Config::Migration.create "files/network/20130701211127_move_to_vlan100.rb" }

    before do
      migration.config = config
    end

    it "should create network_interfaces vlan100 with network_iface1_... attributes" do
      config[:network_iface1_method]="static"
      config[:network_iface1_static_address]="192.168.1.100"
      config[:network_iface1_static_netmask]="255.255.255.0"
      config[:network_iface1_static_gateway]="192.168.1.1"
      config[:network_iface1_static_dns1]="192.168.1.1"

      migration.up

      config[:network_interfaces].should ==
        [
         { :id => "vlan100",
           :method => "static",
           :static_address => "192.168.1.100",
           :static_netmask => "255.255.255.0",
           :static_gateway => "192.168.1.1",
           :static_dns1 => "192.168.1.1",
           :options => "nat"
         }
        ]
    end

    it "should keep unchanged eth0 configuration" do
      config[:network_interfaces] = [ { :id => "eth0", :method => "dhcp" } ]
      config[:network_iface1_method]="dhcp"

      migration.up

      config[:network_interfaces].should ==
        [
          { "id" => "eth0", "method" => "dhcp" },
          { :id => "vlan100",
            :method => "dhcp",
            :options => "nat"
          }
        ]
    end

    it "should not change network_interfaces if any vlan configuration if exists" do
      config[:network_interfaces] = [ { :id => "vlan42", :method => "dummy" } ]
      # FIXME no effect :(
      # lambda { migration.up }.should_not change { config[:network_interfaces] }
      migration.up
      config[:network_interfaces].should == [ { "id" => "vlan42", "method" => "dummy" } ]
    end

  end

end
