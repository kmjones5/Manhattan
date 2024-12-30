#ifndef CONTROLLER_GLOBAL_H
#define CONTROLLER_GLOBAL_H

#include <QtCore/qglobal.h>
#include <qobject.h>

#if defined(CONTROLLER_LIBRARY)
#define CONTROLLER_EXPORT Q_DECL_EXPORT
#else
#define CONTROLLER_EXPORT Q_DECL_IMPORT
#endif

/*------------------Macros----------------*/

/*----------------------------------------*/

/*-----------------Structs----------------*/

/*----------------------------------------*/

class CtrlGlobals : public QObject
{
    Q_GADGET

public:
    /*---------------Enumerations---------------*/

    /*------------------------------------------*/
};

#endif // CONTROLLER_GLOBAL_H
