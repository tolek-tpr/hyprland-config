import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../../."
import "../../."
import "../../panel/."

Button {
    id: root

    required property var panel

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    RowLayout {
        id: layout

        anchors.centerIn: parent

        spacing: Theme.barContentSpacing

        Bluetooth {}
        Wifi {}
        Battery {}
    }

    onClicked: (event) => {
        controller.onClicked()
    }

    PopupPanelController {
        id: controller

        parentPanel: root.panel
        panel: Menu {
            parentWindow: root.panel
        }
    }
}