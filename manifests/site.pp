import "defaults"
import "classes/*.pp"
import "config"

import "box"

$source_base="/tmp/puppet"

include box

include munin-node::local

include apache
include apache::dnssd

include ftp::client

case $box_name {
  'rivendellallbox':  { include rivendell::box::all }
  'rivendellnasbox':  { include rivendell::box::nas }
  'rivendellairbox':  { include rivendell::box::air }
}
