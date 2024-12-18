#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>
#include <QtGlobal>
#include <QCursor>
#include <QTime>
#include <QLoggingCategory>
#include <QSettings>
// #include "../CxnManager/cxnmanager.h"
#include "../UiManager/uimanager.h"
// #include "../CxnManager/CxnManager_global.h"
// #include "../CxnManager/optionstblmodel.h"
// #include "../CxnManager/warningstblmodel.h"
// #include "../CxnManager/confirmationtblmodel.h"
// #include "../CxnManager/rfconfigtblmodel.h"
// #include "../CxnManager/rflayoutstblmodel.h"
// #include "../CxnManager/equipmentlblmodel.h"
// #include "../CxnManager/recentstblmodel.h"



Q_LOGGING_CATEGORY(lcQmlConnections, "qt.connections")//remove connection warning

static const QtMessageHandler QT_DEFAULT_MESSAGE_HANDLER = qInstallMessageHandler(0);

void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString & msg)
{
    switch (type) {
    case QtWarningMsg: {
        if (!msg.contains("TypeError: Cannot read property")){//suppress this warning
            (*QT_DEFAULT_MESSAGE_HANDLER)(type, context, msg);//bypass and display all other warnings
        }
    }
    break;
    default:    //call the default handler
        (*QT_DEFAULT_MESSAGE_HANDLER)(type, context, msg);
        break;
    }
}

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QByteArray localMsg = msg.toLocal8Bit();
    const char *file = context.file ? context.file: "";
    const char *function = context.function ? context.function : "";
    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "%s--Debg: %s (%s L.%u)\n", QTime::currentTime().toString().toLatin1().data(), localMsg.constData(), function, context.line);
        break;
    case QtInfoMsg:
        fprintf(stderr, "%s--Info: %s (%s L.%u)\n", QTime::currentTime().toString().toLatin1().data(), localMsg.constData(), function, context.line);
        break;
    case QtWarningMsg:
        if(!msg.contains("TypeError: Cannot read property"))
        {
            fprintf(stderr, "%s--Warn: %s (%s:%u, %s)\n", QTime::currentTime().toString().toLatin1().data(), localMsg.constData(), file, context.line, function);
        }

        break;

    case QtCriticalMsg:
        fprintf(stderr, "%s--Crit: %s (%s:%u, %s)\n", QTime::currentTime().toString().toLatin1().data(), localMsg.constData(), file, context.line, function);
        break;

    case QtFatalMsg:
        fprintf(stderr, "%s--Fatl: %s (@%s:%u, %s)\n", QTime::currentTime().toString().toLatin1().data(), localMsg.constData(), file, context.line, function);
        break;
    }
    fflush(stderr);
}


int main(int argc, char *argv[])
{
    qInstallMessageHandler(myMessageOutput);

    QApplication app(argc, argv);//QGuiApplication
    QQmlApplicationEngine engine;
    UiManager uimgr;

    QLoggingCategory::setFilterRules("qt.qml.connections.warning = false");//remove connection error
    // qmlRegisterType<OptionsTblModel>("OptionsTblModel",0,1, "OptionsTblModel");
    // qmlRegisterType<WarningsTblModel>("WarningsTblModel",0,1, "WarningsTblModel");
    // qmlRegisterType<ConfirmationTblModel>("ConfirmationTblModel", 0,1, "ConfirmationTblModel");
    // qmlRegisterType<RfConfigTblModel>("RfConfigTblModel", 1,0, "RfConfigTblModel");
    // qmlRegisterType<RfLayoutsTblModel>("RfLayoutsTblModel", 1,0, "RfLayoutsTblModel");
    // qmlRegisterType<RecentsTblModel>("RecentsTblModel",1,0,"RecentsTblModel");



    engine.rootContext()->setContextProperty(QStringLiteral("uimgr"), &uimgr);
    // engine.rootContext()->setContextProperty(QStringLiteral("cxnmgr"), CxnManager::Instance());
    // engine.rootContext()->setContextProperty(QStringLiteral("prop_options"),CxnManager::Instance()->cvtProperties);
    // engine.rootContext()->setContextProperty(QStringLiteral("net"),CxnManager::Instance()->netHandler);
    // engine.rootContext()->setContextProperty(QStringLiteral("filemgr"),CxnManager::Instance()->filemgr);



    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
