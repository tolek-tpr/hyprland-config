import QtQuick
import Quickshell
import "../."

NormalText {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    font.bold: true
    text: Qt.formatDateTime(clock.date, "dd.MM hh:mm")
}