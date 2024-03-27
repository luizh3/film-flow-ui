import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

import "../Badge"

import FFTheme 1.0

Item {
    id: root

    property var genres: []
    property int maxElements: 0

    Flow {
        id: gridLayout
        width: parent.width
        anchors.centerIn: parent
        visible: root.genres.length > 0
        spacing: 10

        Repeater {
            model: maxElements > 0 ? root.genres.slice(
                                         0, maxElements) : root.genres

            delegate: Badge {
                label.text: modelData
            }
        }
    }

    Label {
        anchors.verticalCenter: parent.verticalCenter
        visible: !gridLayout.visible
        text: "Filme sem Gêneros!"
        color: FFColor.white
        font.pixelSize: FFFont.size.medium
    }
}
