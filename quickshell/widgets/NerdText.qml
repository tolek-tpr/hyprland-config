import QtQuick
import "../."

Item {
    id: root

    property alias text: iconText.text
    property alias font: iconText.font
    property alias color: iconText.color
    property alias horizontalAlignment: iconText.horizontalAlignment
    property alias verticalAlignment: iconText.verticalAlignment

    implicitWidth: Theme.fontSize * 1.5
    implicitHeight: Theme.fontSize * 1.5

    Text {
        id: iconText
        anchors.fill: parent

        font.pixelSize: Theme.fontSize * 1.5
        font.family: Theme.nerdFont
        color: Theme.text

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}