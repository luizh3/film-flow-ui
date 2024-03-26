import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

import FFTheme 1.0

Control {
    id: control
    padding: FFMetrics.spacings.small
    anchors.verticalCenter: parent.verticalCenter

    property alias textField: textField

    contentItem: TextField {
        id: textField
        font.pixelSize: FFFont.size.medium
        placeholderText: qsTr("Enter description")
        background: Rectangle {
            border.color: "transparent"
        }
    }
}
