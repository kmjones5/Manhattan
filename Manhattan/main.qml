import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
import uimanager.enums 1.0
import "PUDs"


Window {
    id: window
    width: 1024
    height: 600
    visible: true
    title: qsTr("Manhattan Project")
    color: "blue"

    property int view: uimgr.currentView

    onViewChanged:

    /************* javascript *************/
    function setView(){
        switch(window.view)
        {
        case UiMgrEnums.Start:
            appView.setSource("views/Start.qml")
            break;

        case UiMgrEnums.BtSelect:
            btPud.open()
            break;

        case UiMgrEnums.Board:
            appView.setSource("views/Board.qml")
            break;

        case UiMgrEnums.Mixer:
            appView.setSource("views/Mixer.qml")
            break;

        case UiMgrEnums.Splash:
            appView.setSource("widgets/SpeedoBase.qml", {"width":300, "height":300} )
        }
    }
    /**************************************/

    /* wrapper begins */
    Rectangle{
        id: wrapper
        anchors.fill: parent
        x: 0
        y: 0
        color: "black"

        anchors.margins: 0

        /* Main App Begin */
        Rectangle{
            id: topRect
            height: 30
            color: "transparent"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            //TODO
            /* Time Widget here */
            MouseArea{
                anchors.fill: topRect
                onClicked: uimgr.setView(UiMgrEnums.Start)
            }

        }

        Rectangle{
            id: appViewRect
            color: "transparent"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: topRect.bottom
            anchors.margins: 10
            anchors.topMargin: 0
        }

        Loader{
            id:appView
            anchors.fill: appViewRect
            source: "views/Start.qml"
        }

    }

    BtSelectPUD{
        id: btPud
        anchors.centerIn: Overlay.overlay
        onCancelPressed:{
            //TODO
            btPud.close()
            // uimgr.setView(UiMgrEnums.Start)
        }

        onConnectPressed:{
            //TODO
            btPud.close()
            // uimgr.setView(UiMgrEnums.Start)
        }
    }
}
