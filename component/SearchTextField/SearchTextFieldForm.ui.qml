import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

import FFTheme 1.0

import "../FFTextField"

Rectangle {
    id: root
    border.width: 1
    border.color: root.enabled ? FFColor.orange : FFColor.secundary
    radius: FFMetrics.radius.small

    property alias ffTextField: ffTextField
    property alias button: button

    FFTextField {
        id: ffTextField
        width: parent.width - button.width
        enabled: root.enabled
    }

    Button {
        id: button
        width: 50
        anchors.left: ffTextField.right
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height
        enabled: root.enabled

        icon.name: FFIcon.name.search
        icon.color: FFColor.white

        background: Rectangle {
            color: root.enabled ? FFColor.orange : FFColor.secundary
            radius: FFMetrics.radius.small
        }
    }
}
