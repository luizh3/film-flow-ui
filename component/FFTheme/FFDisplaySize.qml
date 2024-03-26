pragma Singleton

import QtQuick 2.7

QtObject {
    readonly property QtObject input: QtObject {
        readonly property QtObject width: QtObject {
            readonly property int min: 400
        }
        readonly property QtObject height: QtObject {
            readonly property int max: 50
        }
    }

    readonly property QtObject screen: QtObject {
        readonly property QtObject width: QtObject {
            readonly property int min: 400
            readonly property int max: 1280
        }
        readonly property QtObject height: QtObject {
            readonly property int min: 480
            readonly property int max: 720
        }
    }
}
