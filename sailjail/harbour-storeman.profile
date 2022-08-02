# -*- mode: sh -*-

# x-sailjail-translation-catalog = harbour-storeman
# x-sailjail-translation-key-description = permission-la-data
# x-sailjail-description = Storeman permissions
# x-sailjail-translation-key-long-description = permission-la-data_description
# x-sailjail-long-description = Access necessary resources for Storeman to work

# x-sailjail-permission = Secrets
# this is an internal permission according to https://github.com/sailfishos/sailjail-permissions/tree/master#permissions
# so we include it here rather than in the Permissions= key in the .desktop file
include /etc/sailjail/permissions/Secrets.permission

# we allow ourselves, and rpm (which we only use in -q mode anyway)
private-bin harbour-storeman,rpm

writable-run-user

# we need to be able to read
# /home/.zypp-cache/solv/@System/solv
# but no stanza in sailjail will make it work.
# but doing it in firejail config works
#
# use bare name without path here! it will look for files in /etc/firejail
include harbour-storeman.local

# needed to make repo lists work.
# TODO: this is a copy of the real thing and will not be synchronised with it!
# i.e., it will become stale when the repo config is altered
private-etc ssu/ssu.ini


### D-Bus
### BEG D-Bus SESSION things

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
dbus-user.broadcast org.freedesktop.PackageKit=org.freedesktop.PackageKit@/*
dbus-user.broadcast org.freedesktop.PackageKit=org.freedesktop.PackageKit.*@/*
dbus-user.call org.freedesktop.PackageKit=org.freedesktop.PackageKit@/*
dbus-user.call *=org.freedesktop.PackageKit.CreateTransaction@/*
# END dbus service PackageKit

### END D-Bus SESSION things


### BEG D-Bus SYSTEM things

# BEG dbus service ssu
dbus-system.talk org.nemo.ssu
dbus-system.broadcast org.nemo.ssu=org.nemo.ssu@/*
dbus-system.broadcast org.nemo.ssu=org.nemo.ssu.*@/*
dbus-system.call org.nemo.ssu=org.nemo.ssu@/*
dbus-system.call *=org.nemo.ssu.addRepo@/*
dbus-system.call *=org.nemo.ssu.modifyRepo@/*
# END dbus service ssu

# BEG dbus service PackageKit
dbus-system.talk org.freedesktop.PackageKit
dbus-system.broadcast org.freedesktop.PackageKit=org.freedesktop.PackageKit@/*
dbus-system.broadcast org.freedesktop.PackageKit=org.freedesktop.PackageKit.*@/*
dbus-system.call org.freedesktop.PackageKit=org.freedesktop.PackageKit@/*
dbus-system.call *=org.freedesktop.PackageKit.CreateTransaction@/*
# END dbus service PackageKit

### END D-Bus SYSTEM things
