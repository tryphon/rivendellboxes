import "defaults"
import "classes/*.pp"
import "config"

import "box"

$source_base="/tmp/puppet"

include box

include users
include munin-node::local

include apache
include apache::dnssd

if $box_name != "rivendellairbox" {
  $box_storage_name="rivendell"
  include rivendell::server  
}

if $box_name != "rivendellnasbox" {
  include rivendell::station  
}

