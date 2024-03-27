import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

import FFTheme 1.0

import ProgramsControl 1.0

import "component/Loading"
import "component/SearchTextField"
import "component/ProgramList"
import "component/ProgramData"
import "component/FFCustom/button"
import "component/MessageError"
import "component/FFCustom/StackView"

Window {
    visible: true
    width: FFDisplaySize.screen.width.min
    height: FFDisplaySize.screen.height.max
    title: qsTr("Hello World")
    color: "#333"

    minimumWidth: FFDisplaySize.screen.width.min
    maximumWidth: FFDisplaySize.screen.width.max

    minimumHeight: FFDisplaySize.screen.height.min
    maximumHeight: FFDisplaySize.screen.height.max

    ProgramsControl {
        id: control

        onProgramsChanged: function (programs, titleCategory) {
            stack.currentItem.loader.sourceComponent = programListComponent
            stack.currentItem.loader.item.doStart(titleCategory, programs)
        }

        onShowLoading: function () {
            stack.currentItem.loader.sourceComponent = loadingComponent
        }

        onMessageError: function (title, description) {
            stack.currentItem.loader.sourceComponent = errorMessageComponent
            stack.currentItem.loader.item.doStart(title, description)
        }
    }

    FFStackView {
        id: stack
        initialItem: mainComponent
    }

    Component {
        id: mainComponent

        ColumnLayout {
            spacing: FFMetrics.spacings.medium

            property alias loader: pageLoader

            SearchTextField {
                Layout.fillWidth: true
                ffTextField.textField.placeholderText: "Pesquisar..."
                ffTextField.textField.enabled: !(pageLoader.item instanceof Loading)
                onSearch: function (dsQuery) {
                    control.onSearch(dsQuery)
                }
            }

            Loader {
                id: pageLoader
                Layout.fillWidth: true
                Layout.fillHeight: true
                sourceComponent: loadingComponent
            }
        }
    }

    Component {
        id: programListComponent
        ProgramList {
            id: programList
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            function doStart(titleCategory, programs) {
                programList.label.text = titleCategory
                programList.model = programs
            }

            onSelectedChanged: function (model) {
                stack.push(programDataComponent)
                stack.currentItem.model = model
            }
        }
    }

    Component {
        id: errorMessageComponent
        MessageError {
            id: messageError
            width: parent.width

            function doStart(title, description) {
                messageError.title.text = title
                messageError.description.text = description
            }
        }
    }

    Component {
        id: programDataComponent
        ColumnLayout {
            spacing: FFMetrics.spacings.medium

            property alias model: programData.model

            ProgramData {
                id: programData
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            FFButon {
                Layout.fillWidth: true
                Layout.maximumWidth: 400
                Layout.preferredHeight: 50
                icon.name: "seta-esquerda"
                icon.color: FFColor.white
                text: "Voltar"
                onClicked: {
                    stack.pop()
                }
            }
        }
    }

    Component {
        id: loadingComponent
        Loading {}
    }

    Component.onCompleted: {
        control.doStart()
    }
}
