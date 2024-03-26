pragma Singleton

import QtQuick 2.7

QtObject {
    readonly property QtObject name: QtObject {
        readonly property string search: "search"
    }
}
