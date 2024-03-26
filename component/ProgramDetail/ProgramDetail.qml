import QtQuick 2.15
import QtQuick.Controls 2.0

ProgramDetailForm {
    id: root

    signal selected(var model)

    mouseArea.onClicked: function () {
        root.selected(root.model)
    }

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }
}
