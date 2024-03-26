import QtQuick 2.15
import QtQuick.Controls 2.0

FFButonForm {
    id: root

    Behavior on palette.button {
        ColorAnimation {
            duration: 150
        }
    }

    mouseArea.onClicked: root.clicked()
}
