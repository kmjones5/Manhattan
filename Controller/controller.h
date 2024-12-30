#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "Controller_global.h"
#include "btcontrol.h"
#include <QObject>

class CONTROLLER_EXPORT Controller : public QObject
{
    Q_OBJECT

private:
    static Controller *instance;

#define AUTO_CTRL_PROPERTY(TYPE, NAME) \
    Q_PROPERTY(TYPE NAME READ NAME WRITE NAME NOTIFY NAME ## _Change) \
    public: \
    TYPE NAME() const { return m_ ## NAME ; } \
        void NAME(TYPE value) { \
            if (m_ ## NAME == value) return; \
            m_ ## NAME = value; \
            emit NAME ## _Change(value); \
    } \
        Q_SIGNAL void NAME ## _Change(TYPE value);\
    private: \
    TYPE m_ ## NAME;

public:
    BtControl *bt;

private:
    Controller();

public:
    static Controller* Instance();
    ~Controller();
};

#endif // CONTROLLER_H
