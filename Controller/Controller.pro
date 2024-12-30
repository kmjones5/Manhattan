QT += network
QT -= gui

TARGET = Controller
TEMPLATE = lib
QMAKE_CXXFLAGS_WARN_ON += -Wno-unused-parameter
DEFINES += CONTROLLER_LIBRARY

CONFIG += c++17
CONFIG += network
QT += bluetooth
QT += widgets

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    btcontrol.cpp \
    characteristicinfo.cpp \
    controller.cpp \
    deviceinfo.cpp \
    serviceinfo.cpp

HEADERS += \
    Controller_global.h \
    btcontrol.h \
    characteristicinfo.h \
    controller.h \
    deviceinfo.h \
    serviceinfo.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
    INSTALLS += target
}

WIN_DB {
    message("Controller library")
    QT += qml
    CONFIG -= qml_debug
    CONFIG += widgets
    LIBS += -Wl,--export-all-symbols
}

!isEmpty(target.path): INSTALLS += target
