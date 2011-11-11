import "defaults"
import "classes/*.pp"
import "config"

import "box"

$source_base="/tmp/puppet"

$box_name="rivendellbox"
include box

$amixerconf_mode="duplex"
include box::audio

$box_storage_name="rivendell"
include box::storage

include apache
include apache::dnssd
# include rivendellcontrol

include users
include munin-node::local

include ftp::server
include rivendell::server
include rivendell::station
