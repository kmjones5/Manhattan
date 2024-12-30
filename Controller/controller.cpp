#include "controller.h"
#include <QtQml/QQmlEngine>
#include <QtGui/QGuiApplication>

class QBluetoothAddress;

Controller* Controller::instance = nullptr;
Controller* Controller::Instance()
{
    if(instance == nullptr)
    {
        instance = new Controller();
    }
    return instance;
}

Controller::Controller()
{
    const QBluetoothAddress *addr = new QBluetoothAddress();
    qmlRegisterUncreatableType<CtrlGlobals>("controller.enums", 1, 0, "CtrlEnums", "not creatable");

    bt = new BtControl(nullptr);

}

Controller::~Controller()
{
    delete bt;

}
