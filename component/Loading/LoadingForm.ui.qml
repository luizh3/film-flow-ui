import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

import FFTheme 1.0

Item {
    property alias canvas: canvas

    ColumnLayout {
        anchors.fill: parent

        Canvas {
            id: canvas
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height
            antialiasing: true
        }
    }
}
