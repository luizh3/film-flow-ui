import QtQuick 2.15
import QtQuick.Controls 2.15

import FFTheme 1.0

Item {

    property alias title: labelTitle
    property alias description: labelDescription

    Image {
        id: image
        source: "../../icons/theme/96x96/nao-encontrado.png" // Ajustar para usar QQuickImageProvider
        width: 96
        height: 96
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: FFMetrics.margin.medium
    }

    Label {
        id: labelTitle
        anchors.top: image.bottom
        font.pixelSize: FFFont.size.large
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: FFMetrics.margin.medium
        color: FFColor.white
    }

    Label {
        id: labelDescription
        anchors.top: labelTitle.bottom
        font.pixelSize: FFFont.size.small
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: FFMetrics.margin.medium
        color: FFColor.white
        wrapMode: Text.WordWrap
        width: parent.width
    }
}
