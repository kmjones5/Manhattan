#include "uimanager.h"
#include <QFile>
#include <QDebug>
#include <QDir>
#include <QtQml/QQmlEngine>
#include <QtGui/QGuiApplication>

UiManager::UiManager() : QObject()
{
    qmlRegisterUncreatableType<UiMgrGlobals>("uimanager.enums", 1, 0, "UiMgrEnums", "not creatable");

    Init();
}

UiManager::~UiManager()
{

}

void UiManager::Init()
{
    currentView(UiMgrGlobals::Start);
}

void UiManager::setView(int view)
{
    currentView(view);
}

