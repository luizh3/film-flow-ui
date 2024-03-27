import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15

import FFTheme 1.0

import "../Badge"
import "../GenresList"
import "../Average"

Rectangle {
    id: root
    color: FFColor.strongGray

    property var model: null

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: FFMetrics.spacings.medium

        Image {
            source: model
                    && model.dsImageUrl !== "" ? model.dsImageUrl : "/images/sem-foto.jpg"
            Layout.fillWidth: true
            Layout.preferredHeight: 275
            Layout.alignment: Qt.AlignTop
        }

        Flickable {
            id: flickable
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentWidth: parent.width
            contentHeight: column.height
            clip: true

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AlwaysOn
            }

            Column {
                id: column
                width: parent.width
                spacing: FFMetrics.spacings.medium

                Label {
                    id: labelName
                    width: parent.width
                    font.bold: true
                    color: FFColor.white
                    wrapMode: Text.WordWrap
                    text: model ? model.dsName : ""
                    font.pixelSize: FFFont.size.large
                }

                Label {
                    id: labelSummary
                    width: parent.width - FFMetrics.margin.large
                    color: FFColor.white
                    wrapMode: Text.WordWrap
                    text: model
                          && model.dsSummary !== "" ? model.dsSummary : "Programa sem descrição."
                    font.pixelSize: FFFont.size.small
                }

                GenresList {
                    width: parent.width
                    genres: root.model ? root.model.genres : []
                    height: 50
                }

                Average {
                    nrRating: root.model
                              && root.model.average ? root.model.average.nrRating : ""
                }
            }
        }
    }
}
