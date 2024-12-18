QT += network
QT -= gui

TEMPLATE = lib
DEFINES += UIMANAGER_LIBRARY

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    uimanager.cpp

HEADERS += \
    UiManager_global.h \
    uimanager.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

WIN_DB{
    message("CxnManager 64 bit windows")
    QT += qml
    CONFIG -= qml_debug
    CONFIG += widgets
    LIBS += -Wl,--export-all-symbols
}
