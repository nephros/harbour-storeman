# -*- mode: sh -*-

# x-sailjail-translation-catalog = harbour-storeman
# x-sailjail-translation-key-description = permission-la-data
# x-sailjail-description = Storeman permissions
# x-sailjail-translation-key-long-description = permission-la-data_description
# x-sailjail-long-description = Access necessary ressources for Storeman to work

private-bin /usr/bin/harbour-storeman

writable-run-user

# we need to be able to read
# /home/.zypp-cache/solv/@System/solv
# but no stanza in sailjail will make it work.
# but doing it in firejail config works
#
# use bare name without path here! it will look files in /etc/firejail
include harbour-storeman.local
# the same is true for: /etc/ssu/ssu.ini

# for some reason the Secrets permission does not work for this:
whitelist ${RUNUSER}/sailfishsecretsd/p2pSocket


### D-Bus
### BEG D-Bus SESSION things
dbus-user filter

dbus-user.talk org.freedesktop.DBus
dbus-user.call org.freedesktop.DBus=org.freedesktop.DBus@/*
dbus-user.broadcast org.freedesktop.DBus=org.freedesktop.DBus@/*

# BEG dbus session service
dbus-user.own harbour.storeman.service
dbus-user.own harbour.storeman.service.*
dbus-user.talk harbour.storeman.service
dbus-user.call harbour.storeman.service=harbour.storeman.service@/*
dbus-user.call *=harbour.storeman.service.openPage@/*
dbus-user.call *=harbour.storeman.service.updateAll@/*
dbus-user.call *=harbour.storeman.service.updateRepos@/*
# END dbus session service
#
# BEG dbus service PackageKit
dbus-user.talk org.freedesktop.PackageKit
dbus-user.call org.freedesktop.PackageKit=org.freedesktop.PackageKit@/*
dbus-user.call *=org.freedesktop.PackageKit.CreateTransaction@/*
# END dbus service PackageKit

# BEG dbus service Tracker
# org.freedesktop.Tracker3.Miner.Files call org.freedesktop.DBus.Peer.Ping at /org/freedesktop/Tracker3/Endpoin
# MediaIndexing permission should grant this already
# dbus-user.talk org.freedesktop.Tracker3
# dbus-user.call org.freedesktop.Tracker3=org.freedesktop.Tracker3@/*
# dbus-user.call *=org.freedesktop.Tracker3.Miner.Files@/*
# END dbus service Tracker
### END D-Bus SESSION things


### BEG D-Bus SYSTEM things
dbus-system filter

# BEG dbus service ssu
dbus-system.talk org.nemo.ssu
dbus-system.call org.nemo.ssu=org.nemo.ssu@/*
dbus-system.call *=org.nemo.ssu.addRepo@/*
dbus-system.call *=org.nemo.ssu.modifyRepo@/*
# END dbus service ssu

# BEG dbus system service
#dbus-system filter
#dbus-system.own harbour.storeman.service
#dbus-system.talk harbour.storeman.service
#dbus-system.call harbour.storeman.service=harbour.storeman.service@/*
#dbus-system.call *=harbour.storeman.service.openPage@/*
#dbus-system.call *=harbour.storeman.service.updateAll@/*
# END dbus system service

### END D-Bus SYSTEM things
