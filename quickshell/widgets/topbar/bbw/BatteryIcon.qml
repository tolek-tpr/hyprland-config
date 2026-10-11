import QtQuick
import QtQuick.Layouts
import "../../../."

Item {
    id: root

    property real percentage: 1.0
    property bool isCharging: false

    readonly property color barColor: {
        if (root.isCharging) return Theme.good
        if (root.percentage <= 0.15) return Theme.bad
        if (root.percentage <= 0.30) return Theme.warn
        return Theme.text
    }

    implicitWidth: 16
    implicitHeight: 26

    Rectangle {
        id: body
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height - 4
        
        radius: 3
        color: "transparent"
        border.color: Theme.text
        border.width: 2

        Rectangle {
            id: fillLevel
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                margins: 3
            }
            height: Math.max(0, (body.height - 6) * Math.min(1.0, Math.max(0.0, root.percentage)))
            radius: 1.5
            color: root.barColor

            Behavior on height {
                NumberAnimation { duration: 250; easing.type: Easing.InOutQuad }
            }
        }

        Text {
            anchors.centerIn: parent
            visible: root.isCharging
            text: ""
            font.pixelSize: 10
            color: Theme.text
        }
    }

    Rectangle {
        anchors {
            bottom: body.top
            bottomMargin: 1
            horizontalCenter: body.horizontalCenter
        }
        width: 6
        height: 3
        radius: 1
        color: Theme.text
    }
}