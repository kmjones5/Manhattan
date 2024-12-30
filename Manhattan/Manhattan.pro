QT += network
QT += quick
QT += widgets
QT += core
CONFIG += qml_debug

CONFIG += c++17

# RC_ICONS = /todo

static {
    QT += svg

}

target.path = /home/root
QMAKE_CXXFLAGS_WARN_ON += -Wno-unused-parameter

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
INSTALLS += target
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

WIN_DB{
    message("Manhattan Debug")
    CONFIG -= qml_debug
    CONFIG += widgets
    #Controller\build\Desktop_Qt_6_8_1_MinGW_64_bit-Debug

    LIBS += -L$$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug -L$$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug/libUiManager.a -lUiManager
    LIBS += -L$$PWD/../Controller/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug -L$$PWD/../Controller/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug/debug/libController.a -lController

    INCLUDEPATH += $$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug
    DEPENDPATH += $$PWD/../UiManager/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug

    INCLUDEPATH += $$PWD/../Controller/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug
    DEPENDPATH += $$PWD/../Controller/build/Desktop_Qt_6_8_1_MinGW_64_bit-Debug
}

unix:!macx: contlib.path = /usr/lib
unix:!macx: contlib.files = $$PWD/../Controller/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug/libController.so.1.0.0

unix:!macx: uimgrlib.path = /usr/lib
unix:!macx: uimgrlib.files = $$PWD/../UiManager/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug/libUiManager.so.1.0.0

unix:!macx: INSTALLS += contlib
unix:!macx: INSTALLS += uimgrlib

unix:!macx: LIBS += -L$$PWD/../Controller/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug/ -lController
unix:!macx: LIBS += -L$$PWD/../UiManager/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug/ -lUiManager

INCLUDEPATH += $$PWD/../Controller/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug
DEPENDPATH += $$PWD/../Controller/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug

INCLUDEPATH += $$PWD/../UiManager/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug
DEPENDPATH += $$PWD/../UiManager/build/Boot2Qt_6_8_1_Raspberry_Pi_Development_Boards_64bit-Debug

DISTFILES += \
    images/1x/mixIcon.png \
    images/mix3.jpg \
    images/mix4.JPG \
    images/mixIcon.png \
    images/mixer.jpg \
    images/mixer2.jpg \
    meshes/meter_background.mesh \
    meshes/meter_edge.mesh \
    meshes/oldqtlogo.mesh \
    meshes/suzanne.mesh
