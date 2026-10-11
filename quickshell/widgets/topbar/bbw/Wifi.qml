import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import "../../../."
import "../../."

Icon {
    id: root

    icon: root.wifiIcon

    property string wifiIcon: "network-wireless-offline-symbolic"

    Process {
        id: wifiProcess
        // command: ["sh", "-c", "nmcli -t -f STATE,IP4-CONNECTIVITY dev | grep '^yes' | head -n1"]
        command: ["sh", "-c", "nmcli -t -f STATE,SIGNAL dev wifi | head -n1"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                let parts = data.trim().split(":");
                if (parts.length === 2) {
                    let signal = parseInt(parts[1], 10) || 0;
                    
                    if (signal >= 80) {
                        wifiIcon = "network-wireless-signal-excellent-symbolic"; // Excellent
                    } else if (signal >= 60) {
                        wifiIcon = "network-wireless-signal-good-symbolic"; // Good
                    } else if (signal >= 40) {
                        wifiIcon = "network-wireless-signal-ok-symbolic"; // Fair
                    } else if (signal >= 20) {
                        wifiIcon = "network-wireless-signal-weak-symbolic"; // Weak
                    } else {
                        wifiIcon = "network-wireless-signal-none-symbolic"; // Minimal
                    }
                } else {
                    wifiIcon = "network-wireless-offline-symbolic"; // Disconnected
                }
                // TODO: add no route: network-wireless-no-route-symbolic
            }
        }
    }

    // Poll network status every 5 seconds
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: wifiProcess.running = true
    }
}