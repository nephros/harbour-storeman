TEMPLATE = aux

OTHER_FILES += \
    harbour-storeman.desktop \
    harbour-storeman-debug.desktop \
    harbour-storeman.profile \
    harbour-storeman.local \

INSTALLS += desktop sjprofile fjprofile

sjprofile.files = harbour-storeman.profile
sjprofile.path = $$INSTALL_ROOT/etc/sailjail/permissions

fjprofile.files = harbour-storeman.local
fjprofile.path = $$INSTALL_ROOT/etc/firejail
