import QtQuick 2.15

import FFTheme 1.0

FFTextFieldForm {
    id: root
    implicitWidth: Math.max(FFDisplaySize.input.width.min, width)
    implicitHeight: FFDisplaySize.input.height.max

    signal confirm(var text)

    textField.onAccepted: function () {
        root.confirm(textField.text)
    }
}
