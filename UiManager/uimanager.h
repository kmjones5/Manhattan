#ifndef UIMANAGER_H
#define UIMANAGER_H

#include "UiManager_global.h"
#include <QObject>

class UIMANAGER_EXPORT UiManager : public QObject
{
    Q_OBJECT

private:
    void Init();

public:
    UiManager();
    ~UiManager();

private:
//Macro Definition
#define AUTO_UIMGR_PROPERTY(TYPE, NAME) \
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



    //Property Definition
    AUTO_UIMGR_PROPERTY(int, currentView)

public:
    /* Funct Defs */
    Q_INVOKABLE void setView(int view);
};

#endif // UIMANAGER_H
