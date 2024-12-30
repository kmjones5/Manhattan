import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Buttons"

Popup {
    property string overlayColor: "#aa000000"
    property string bkgdColor: "#cc214972"
    property int bkgdOpacity: 1
    property bool infoTxtVisible: true
    property bool cancelBtnActive: true

    id: btPud
    clip: true
    height: 200
    width: 350
    modal: true

    onOpened:{
        console.log("BT pud Opened...")
    }

    closePolicy: Popup.CloseOnPressOutside


    signal connectPressed
    signal cancelPressed

    enter: Transition{
        NumberAnimation{property: "opacity"; duration: 500; easing.type: Easing.InOutQuad; from: 0; to: 1}
    }
    exit: Transition{
        NumberAnimation{property: "opacity"; duration: 500; easing.type: Easing.InOutQuad; from: 1; to: 0}
    }

    Overlay.modal: Rectangle{
        color: btPud.overlayColor
    }

    background: Rectangle{
        id: baseRect
        color: btPud.bkgdColor
        radius: 6
        opacity: btPud.bkgdOpacity
    }

    ColumnLayout{
        id: colLayout
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5

        Text{
            id: title
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            font{family: "helvetica"; pixelSize: 20; bold: true}
            color: "white"
            text: "Bluetooth Devices"
            clip: true
        }

        Text{
            id: infoTxt
            visible: btPud.infoTxtVisible
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            horizontalAlignment: Text.AlignLeft
            font{family: "Open Sans"; pixelSize: 12}
            color: "white"
            text: "Placeholder Description"
            wrapMode: Text.Wrap
        }

        Row{
            id: btnRow
            spacing: 5
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            clip: true

            BaseBtn{
                id: cancelBtn
                visible: btPud.cancelBtnActive
                btnTxt: "Cancel"
                onClicked: btPud.cancelPressed()
                outlineColor: "white"
            }

            BaseBtn{
                id: connectBtn
                btnTxt: "Connect"
                onClicked: btPud.connectPressed()
            }
        }
    }
}




















