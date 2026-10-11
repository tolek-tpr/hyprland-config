import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../."
import "../musicplayer/topbar"
import "../hardwareinfo/topbar"
import "./bbw/."
import "./"

PanelWindow {
    id: panelWindow
    
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Theme.barHeight + (Theme.barMargin * 2)
    color: Theme.transparent

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: Theme.barMargin
        anchors.rightMargin: Theme.barMargin
        anchors.topMargin: Theme.barMargin
        anchors.bottomMargin: Theme.barMargin

        WidgetCollection {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            Workspaces {}
        }

        WidgetCollection {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            MusicPlayer {}
        }

        Item { Layout.fillWidth: true }

        WidgetCollection {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            visible: !tray.isEmpty

            Tray { id: tray }
        }

        WidgetCollection {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            HardwareInfo {}
        }

        WidgetCollection {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

            Microphone {}
            Speaker {}
        }

        WidgetCollection {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            BBWContainer {
                panel: panelWindow
            }
        }
    }

    // Clock
    WidgetCollection {
        anchors.centerIn: parent

        Clock {}
    }
}