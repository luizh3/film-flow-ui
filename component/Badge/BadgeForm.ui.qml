import QtQuick 2.15
import QtQuick.Controls 2.15

import FFTheme 1.0

Rectangle {
    radius: FFMetrics.radius.small
    width: label.width + (FFMetrics.margin.medium * 2)
    height: 30
    color: FFColor.orange

    property alias label: label

    Label {
        id: label
        font.pixelSize: FFFont.size.verySmall
        color: FFColor.white
        anchors.centerIn: parent
        font.bold: true
    }
}
