import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import Quickshell
import "../../panel/"

PopupPanel {
    anchor.window: containingWindow
    anchor.rect.x: containingWindow.width / 2 - width / 2
    anchor.rect.y: containingWindow.height
    width: 500
    height: 500
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "red"
    }
}