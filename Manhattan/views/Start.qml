import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import uimanager.enums 1.0

Item {
    id: startView
    visible: true

    Rectangle{
        id: divider1
        height: parent.height-20
        width: 1
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.width/3
    }

    Rectangle{
        id: divider2
        height: parent.height-20
        width: 1
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: parent.width/3
    }

    Rectangle{
        id: boardRect
        height: parent.height
        width: parent.width/3
        color: "transparent"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        MouseArea{
            anchors.fill: boardRect
            onClicked: uimgr.setView(UiMgrEnums.Board)
        }
    }

    Rectangle{
        id: mixerRect
        height: parent.height
        width: parent.width/3
        color: "transparent"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: boardRect.right

        MouseArea{
            anchors.fill: mixerRect
            onClicked: uimgr.setView(UiMgrEnums.Mixer)
        }
    }

    Rectangle{
        id: splashRect
        height: parent.height
        width: parent.width/3
        color: "transparent"

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        MouseArea{
            anchors.fill: splashRect
            onClicked: uimgr.setView(UiMgrEnums.Splash)
        }
    }
}
