import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

import FFTheme 1.0

Control {
    id: control
    padding: FFMetrics.spacings.small
    anchors.verticalCenter: parent.verticalCenter

    property alias textField: textField

    contentItem: TextField {
        id: textField
        selectByMouse: true
        font.pixelSize: FFFont.size.medium
        background: Rectangle {
            border.color: FFColor.transparent
        }
    }
}
