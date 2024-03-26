pragma Singleton

import QtQuick 2.7

QtObject {
    readonly property QtObject spacings: QtObject {
        readonly property int small: 2
        readonly property int medium: 10
        readonly property int large: 15
    }

    readonly property QtObject radius: QtObject {
        readonly property int small: 3
    }

    readonly property QtObject margin: QtObject {
        readonly property int medium: 10
        readonly property int large: 15
    }
}
