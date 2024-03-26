import QtQuick 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.12

import FFTheme 1.0

import "../Badge"
import "../GenresList"
import "../Average"

Rectangle {
    id: root
    height: 200
    color: mouseArea.containsMouse ? FFColor.hoverGray : FFColor.strongGray
    radius: FFMetrics.radius.small

    property var model: undefined
    property alias mouseArea: mouseArea

    signal clicked

    RowLayout {
        anchors.fill: parent
        spacing: FFMetrics.spacings.large

        Image {
            id: image
            source: model
                    && model.dsImageUrl !== "" ? model.dsImageUrl : "/images/sem-foto.jpg"
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

            Layout.leftMargin: FFMetrics.margin.large
            Layout.topMargin: FFMetrics.margin.large
            Layout.bottomMargin: FFMetrics.margin.large
        }

        Rectangle {
            color: FFColor.transparent
            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.alignment: Qt.AlignVCenter

            Layout.rightMargin: FFMetrics.margin.large
            Layout.topMargin: FFMetrics.margin.large
            Layout.bottomMargin: FFMetrics.margin.large

            ColumnLayout {
                anchors.fill: parent

                Label {
                    text: model ? model.dsName : ""
                    font.pointSize: FFFont.size.medium
                    font.bold: true
                    color: FFColor.white
                    elide: Text.ElideRight
                    Layout.fillWidth: true
                }

                GenresList {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    genres: root.model ? root.model.genres : []
                    maxElements: 2
                }

                Average {
                    nrRating: model
                              && model.average ? model.average.nrRating : ""
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
