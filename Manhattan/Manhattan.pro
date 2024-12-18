QT += network
QT += quick
QT += widgets
QT += core
CONFIG += qml_debug

CONFIG += c++17

# RC_ICONS = /todo

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
TARGET = Manhattan
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

WIN_DB{
    message("Manhattan Debug")
    CONFIG -= qml_debug
    CONFIG += widgets

    LIBS += -L$$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug -L$$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug/libUiManager.a -lUiManager

    INCLUDEPATH += $$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug
    DEPENDPATH += $$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug
}
DISTFILES +=

