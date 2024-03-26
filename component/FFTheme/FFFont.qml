pragma Singleton

import QtQuick 2.7

QtObject {
    readonly property QtObject size: QtObject {
        readonly property int verySmall: 12
        readonly property int small: 15
        readonly property int medium: 18
        readonly property int large: 21
    }
}
