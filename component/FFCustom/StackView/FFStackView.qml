import QtQuick 2.15
import QtQuick.Controls 2.15

StackView {
    id: root
    anchors.fill: parent
    anchors.margins: 15

    property int duration: 200

    pushEnter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: root.duration
        }
    }
    pushExit: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: root.duration
        }
    }
    popEnter: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: root.duration
        }
    }
    popExit: Transition {
        PropertyAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: root.duration
        }
    }
}
