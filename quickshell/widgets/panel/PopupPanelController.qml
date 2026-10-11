import QtQuick
import Quickshell

Item {
    id: root

    required property Component panel
    required property var parentPanel

    property bool menuOpen: false
    property bool closing: false

    function onClicked() {
        console.log("clicked")
        if (closing)
            return

        if (menuOpen) {
            closing = true
            console.log(popupLoader.item)
            popupLoader.item.closeAnimated()
        } else {
            popupLoader.active = true
            menuOpen = true
        }
    }

    LazyLoader {
        id: popupLoader

        active: false
        component: root.panel

        Connections {
            target: popupLoader.item

            function onClosed() {
                popupLoader.active = false
                root.menuOpen = false
                root.closing = false
            }
        }
    }
}