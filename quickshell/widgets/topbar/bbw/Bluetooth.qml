import QtQuick
import Quickshell
import Quickshell.Bluetooth
import "../../../."
import "../../."

Icon {
    id: root

    readonly property bool isConnected: {
        for (let i = 0; i < Bluetooth.devices.length; i++) {
            if (Bluetooth.devices[i].connected) {
                return true;
            }
        }
        return false;
    }

    icon: "bluetooth-active-symbolic"
    visible: !isConnected
}