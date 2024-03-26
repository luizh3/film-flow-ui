import QtQuick 2.15

import FFTheme 1.0

SearchTextFieldForm {
    id: root
    height: FFDisplaySize.input.height.max

    signal search(var dsQuery)

    ffTextField.onConfirm: function (text) {
        root.search(text)
    }

    button.onClicked: function () {
        root.search(ffTextField.textField.text)
    }
}
