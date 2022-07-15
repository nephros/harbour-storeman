OTHER_FILES += \
    $$PWD/harbour-storeman.desktop \
    $$PWD/harbour-storeman.profile \
    $$PWD/harbour-storeman.local \

INSTALLS += sjdesktop sjprofile fjprofile

sjdesktop.files = $$PWD/harbour-storeman.desktop
sjdesktop.path = $$INSTALL_ROOT/etc/sailjail/applications

sjprofile.files = $$PWD/harbour-storeman.profile
sjprofile.path = $$INSTALL_ROOT/etc/sailjail/permissions

fjprofile.files = $$PWD/harbour-storeman.local
fjprofile.path = $$INSTALL_ROOT/etc/firejail
