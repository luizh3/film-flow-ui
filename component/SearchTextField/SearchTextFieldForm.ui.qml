import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

import FFTheme 1.0

import "../FFTextField"

Rectangle {
    border.width: 1
    border.color: isEnabled ? FFColor.orange : FFColor.secundary
    radius: FFMetrics.radius.small

    readonly property bool isEnabled: ffTextField.textField.enabled

    property alias ffTextField: ffTextField
    property alias button: button

    FFTextField {
        id: ffTextField
        width: parent.width - button.width
    }

    Button {
        id: button
        width: 50
        anchors.left: ffTextField.right
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height

        icon.name: FFIcon.name.search
        icon.color: FFColor.white

        background: Rectangle {
            color: isEnabled ? FFColor.orange : FFColor.secundary
            radius: FFMetrics.radius.small
        }
    }
}
