import QtQuick
import Quickshell

PopupWindow {
    id: root

    required property var parentWindow

    signal closed()

    property bool closing: false

    anchor.window: parentWindow

    implicitWidth: 200
    implicitHeight: 150
    visible: true
    color: "transparent"

    Item {
        anchors.fill: parent

        opacity: root.closing ? 0 : 1
        scale: root.closing ? 0.92 : 1
        transformOrigin: Item.TopRight

        Behavior on opacity {
            NumberAnimation {
                duration: 160
                easing.type: Easing.OutCubic
            }
        }

        Behavior on scale {
            NumberAnimation {
                duration: 160
                easing.type: Easing.OutCubic
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: 10
            color: "#252525"

            Text {
                anchors.centerIn: parent
                text: "Hello!"
                color: "white"
            }
        }
    }

    function closeAnimated() {
        if (closing)
            return

        closing = true
        closeTimer.start()
    }

    Timer {
        id: closeTimer
        interval: 160

        onTriggered: {
            root.visible = false
            root.closed()
        }
    }
}