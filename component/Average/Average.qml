import QtQuick 2.15
import QtQuick.Controls 2.15

import FFTheme 1.0

Rectangle {
    width: label.width + (FFMetrics.margin.medium * 2)
    height: 40
    radius: FFMetrics.radius.small
    color: FFColor.orange

    property string nrRating
    property string nrMaxRating: "10"

    Label {
        id: label
        font.pixelSize: FFFont.size.medium
        text: nrRating !== "" ? nrRating + "/" + nrMaxRating : "Filme sem nota!"
        font.bold: true
        anchors.centerIn: parent
        color: FFColor.white
    }
}
