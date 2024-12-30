import QtQuick 2.15
import QtQuick.Controls 2.5
// import QtGraphicalEffects 1.0

Button{
    property int btnRad: 10
    property int btnOpacity: 1
    property int outlineWidth: 2
    property string outlineColor: "#141AC9"
    property string btnColor: "transparent"
    property string btnTxt: "Add txt"
    property string txtColor: "white"
    id: baseBtn
    width: 100
    height: 28
    layer.enabled: true
    hoverEnabled: true
    autoExclusive: false

    signal btnPressed

    background: Rectangle{
        id: bkgdRect
        anchors.fill: parent
        radius: baseBtn.btnRad
        opacity: baseBtn.btnOpacity
        color: "transparent"
    }

    Rectangle{
        id: btnRect
        anchors.fill: parent
        radius: baseBtn.btnRad
        color: baseBtn.btnColor
        border.color: baseBtn.outlineColor
        border.width: baseBtn.outlineWidth
        opacity: baseBtn.btnOpacity

        Label{
            id: btnText
            text: baseBtn.btnTxt
            font{pixelSize: 12}
            color: baseBtn.txtColor
            anchors.centerIn: btnRect
        }
    }

    states: [
        State {
            name: "hover"
            when: baseBtn.hovered && !baseBtn.pressed;

            PropertyChanges {
                target: btnRect
                color: baseBtn.outlineColor//"#f0305497"
            }

            PropertyChanges{
                target: btnText
                color: "black"
            }

            PropertyChanges{
                target: baseBtn
                btnTxt: baseBtn.btnTxt
            }
        },
        State{
            name: "pressed"
            when: baseBtn.pressed

            PropertyChanges{
                target: baseBtn
                scale: .95
                opacity: .5
                btnTxt: baseBtn.btnTxt
            }

            PropertyChanges {
                target: btnRect
                color: baseBtn.outlineColor//"#f0305497"
            }

            PropertyChanges{
                target: btnText
                color: "black"
            }

        },

        State{
            name: "disabled"
            when: (baseBtn.enabled === false)

            PropertyChanges {
                target: btnRect
                opacity: .3

            }

            PropertyChanges{
                target: baseBtn
                btnTxt: baseBtn.btnTxt
            }
        }
    ]
}
