import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../."
import "../../."

RowLayout {
    id: lay
    spacing: 4

    Repeater {
        model: Hyprland.workspaces.values
        delegate: Rectangle {
            id: pill
            required property var modelData

            readonly property bool isActive: modelData.active

            Layout.preferredWidth: isActive ? textItem.implicitWidth + Theme.wsPillHeight : Theme.wsPillHeight
            Layout.preferredHeight: Theme.wsPillHeight

            Behavior on Layout.preferredWidth {
                NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
            }

            color: isActive ? Theme.active : Theme.inactive
            radius: height / 2

            NormalText {
                id: textItem
                anchors.centerIn: parent
                text: modelData.name !== "" ? modelData.name : modelData.id
                color: Theme.textDark
                font.bold: true

                opacity: pill.isActive ? 1 : 0
                Behavior on opacity {
                    NumberAnimation { duration: 150 }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Hyprland.dispatch("hl.dsp.focus({workspace=\"" + modelData.name + "\"})")
                }
            }
        }
    }
}
