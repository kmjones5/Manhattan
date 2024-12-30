import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
// import QtGraphicalEffects
import QtQuick.Controls 2.15
import uimanager.enums 1.0


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

        // states:[
        //     State{
        //         name: "start"
        //         when: window.view == UiMgrEnums.Start

        //         PropertyChanges{
        //             target: appView
        //             source: "views/Start.qml"
        //         }
        //     },

        //     State{
        //         name: "board"
        //         when: window.view == UiMgrEnums.Board

        //         PropertyChanges{
        //             target: appView
        //             source: "views/Board.qml"
        //         }
        //     },

        //     State{
        //         name: "mixer"
        //         when: window.view == UiMgrEnums.Mixer

        //         PropertyChanges{
        //             target: appView
        //             source: "views/Mixer.qml"
        //         }
        //     },

        //     State{
        //         name: "Splash"
        //         when: window.view == UiMgrEnums.Splash

        //         PropertyChanges{
        //             target: appView
        //             source: "views/Splash.qml"
        //         }
        //     }

        // ]

    }

}
