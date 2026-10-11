import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../."

RowLayout {
    id: root

    Icon {
        id: prev
        icon: "media-skip-backward-symbolic"
    }

    Icon {
        id: play
        icon: "media-playback-start-symbolic"
    }

    Icon {
        id: next
        icon: "media-skip-forward-symbolic"
    }
}