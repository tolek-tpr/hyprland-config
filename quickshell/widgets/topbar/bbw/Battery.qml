import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import "../../../."


Item {
    id: root
    readonly property UPowerDevice battery: UPower.devices.values.find(d => d.type === UPowerDeviceType.Battery)
    readonly property bool isPresent: battery !== null && battery.isPresent
    readonly property real percentage: battery ? battery.percentage : 0

    implicitWidth: icon.implicitWidth + 2

    BatteryIcon {
        id: icon
        anchors.centerIn: parent
        percentage: root.percentage
        isCharging: root.battery ? root.battery.state === UPowerDeviceState.Charging : false
    }
}