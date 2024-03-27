import QtQuick 2.15
import QtQuick.Controls 2.15

import FFTheme 1.0

Button {
    id: control
    font.pixelSize: FFFont.size.small
    font.bold: true
    palette.buttonText: FFColor.white

    property alias mouseArea: mouseArea

    background: Rectangle {
        color: mouseArea.containsMouse ? FFColor.orange : FFColor.hoverGray
        border.color: mouseArea.containsMouse ? FFColor.orange : FFColor.hoverGray
        border.width: 2
        radius: FFMetrics.radius.small
    }

    MouseArea {
        id: mouseArea
        anchors.fill: control
        hoverEnabled: true
    }
}
