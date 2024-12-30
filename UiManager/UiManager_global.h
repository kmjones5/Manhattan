#ifndef UIMANAGER_GLOBAL_H
#define UIMANAGER_GLOBAL_H
#include <qobject.h>
#include <QtCore/qglobal.h>

#if defined(UIMANAGER_LIBRARY)
#define UIMANAGER_EXPORT Q_DECL_EXPORT
#else
#define UIMANAGER_EXPORT Q_DECL_IMPORT
#endif

#endif // UIMANAGER_GLOBAL_H

#define APP_VERSION "1.0.0"

class UiMgrGlobals : public QObject
{
    Q_GADGET

public:
    /* enum definitions here */
    enum AppView{
        Start,
        BtSelect,
        Board,
        Mixer,
        Splash
    };
    Q_ENUM(AppView)
};
