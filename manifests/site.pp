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

$box_storage_name="rivendell"

case $box_name {
  'rivendellallbox':  { include rivendell::box::all }
  'rivendellnasbox':  { include rivendell::box::nas }
  'rivendellairbox':  { include rivendell::box::air }
}
