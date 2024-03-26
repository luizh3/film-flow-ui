import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

import FFTheme 1.0

import "../FFTextField"

Rectangle {
    border.color: FFColor.orange
    border.width: 1
    radius: FFMetrics.radius.small

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
            color: FFColor.orange
            radius: FFMetrics.radius.small
        }
    }
}
