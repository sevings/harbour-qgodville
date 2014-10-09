# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-qgodville

CONFIG += sailfishapp

SOURCES += src/harbour-qgodville.cpp

OTHER_FILES += qml/harbour-qgodville.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-qgodville.changes.in \
    rpm/harbour-qgodville.spec \
    rpm/harbour-qgodville.yaml \
    translations/*.ts \
    harbour-qgodville.desktop \
    qml/HeroData.js \
    qml/pages/DataRow.qml \
    qml/pages/DataBar.qml \
    qml/settings.js \
    qml/pages/MainPage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/InventoryString.qml \
    qml/pages/HelpPage.qml

# to disable building translations every time, comment out the
# following CONFIG line
#CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-qgodville_en.ts

i18n.path = /usr/share/harbour-qgodville/translations
i18n.files = translations/harbour-qgodville_en.qm

INSTALLS += i18n
