import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0

import FFTheme 1.0

import "../ProgramDetail"

// ScrollView {

//     property alias model: listView.model
ColumnLayout {
    id: root
    anchors.fill: parent

    property alias model: listView.model
    property alias listView: listView
    property alias label: label

    signal selectedChanged(var model)

    Label {
        id: label
        text: "Em Alta"
        Layout.fillWidth: true
        font.pointSize: FFFont.size.large
        color: FFColor.white
        font.bold: true
    }

    ListView {
        id: listView
        clip: true
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: FFMetrics.spacings.medium

        delegate: ProgramDetail {
            id: programDetail
            model: modelData
            width: listView.width

            Connections {
                target: programDetail
                function onSelected() {
                    root.selectedChanged(model)
                }
            }
        }
    }
} // }
