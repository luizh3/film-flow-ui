import QtQuick 2.15
import QtQuick.Controls 2.15

FFButonForm {
    id: root

    Behavior on palette.button {
        ColorAnimation {
            duration: 150
        }
    }

    mouseArea.onClicked: root.clicked()
}
