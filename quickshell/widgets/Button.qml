import QtQuick
import Quickshell
import "./topbar/."

Item {
    id: root

    signal clicked(var event)

    property alias acceptedButtons: area.acceptedButtons

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: (event) => {
            root.clicked(event)
        }
    }
}