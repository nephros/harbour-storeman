OTHER_FILES += \
    $$PWD/harbour-storeman.desktop \
    $$PWD/harbour-storeman.profile \
    $$PWD/harbour-storeman.local \

INSTALLS += sjdesktop sjprofile fjprofile pkla

sjdesktop.files = $$PWD/harbour-storeman.desktop
sjdesktop.path = $$INSTALL_ROOT/etc/sailjail/applications

sjprofile.files = $$PWD/harbour-storeman.profile
sjprofile.path = $$INSTALL_ROOT/etc/sailjail/permissions

fjprofile.files = $$PWD/harbour-storeman.local
fjprofile.path = $$INSTALL_ROOT/etc/firejail

pkla.files = $$PWD/polkit/50-harbour-storeman.pkla
#pkla.path = $$INSTALL_ROOT/var/lib/polkit-1/localauthority/50-local.d
pkla.path = $$INSTALL_ROOT/etc/polkit-1/localauthority/50-local.d
