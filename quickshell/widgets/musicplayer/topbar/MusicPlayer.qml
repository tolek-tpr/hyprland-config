import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../."
import "."

RowLayout {
    id: root
    spacing: 15

    NormalText {
        text: "Pink Floyd - Learning To Fly"
    }

    MusicPlayerControlButtons {}
}