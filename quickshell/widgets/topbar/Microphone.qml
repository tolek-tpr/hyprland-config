import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import Quickshell.Widgets
import "../."
import "../../."

RowLayout {
    id: root
    spacing: 6

    property bool sliderOpen: false

    Item {
        id: sliderWrapper
        Layout.preferredWidth: root.sliderOpen ? 140 : 0
        Layout.preferredHeight: Theme.fontSize
        Layout.alignment: Qt.AlignVCenter
        clip: true
        visible: root.sliderOpen || volumeSlider.width > 0

        Behavior on Layout.preferredWidth {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        Slider {
            id: volumeSlider
            anchors.fill: parent
            min: 0
            max: 100

            value: button.isMuted ? 0 : button.volume * 100

            onSliderMoved: (val) => {
                let fraction = (val / 100.0).toFixed(2)
                forceUnmute.running = true
                setVolumeProc.command = ["wpctl", "set-volume", "@DEFAULT_AUDIO_SOURCE@", fraction]
                setVolumeProc.running = true
            }
        }

        Process {
            id: setVolumeProc
        }

        Process {
            id: forceUnmute
            command: ["wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "0"]
        }
    }

    IconButton {
        id: button

        acceptedButtons: Qt.LeftButton | Qt.RightButton

        readonly property PwNodeAudio defaultSource: Pipewire.defaultAudioSource?.audio

        PwObjectTracker {
            objects: [Pipewire.defaultAudioSource]
        }

        readonly property real volume: defaultSource?.volume ?? 0
        readonly property bool isMuted: defaultSource?.muted ?? false

        icon: {
            if (isMuted || volume === 0) return "microphone-sensitivity-muted-symbolic"
            if (volume >= 0.7) return "microphone-sensitivity-high-symbolic"
            if (volume >= 0.3) return "microphone-sensitivity-medium-symbolic"
            return "microphone-sensitivity-low-symbolic"
        }

        onClicked: (event) => {
            if (event.button === Qt.RightButton) {
                toggleAudioProc.running = true
                volumeSlider.forceSet(button.isMuted ? button.volume * 100 : 0)
            } else {
                root.sliderOpen = !root.sliderOpen
            }
        }

        Process {
            id: toggleAudioProc
            command: ["wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle"]
        }
    }
}