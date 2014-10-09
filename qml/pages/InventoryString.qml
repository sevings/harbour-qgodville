import Sailfish.Silica 1.0
import QtQuick 2.0

Label {
    wrapMode: Text.Wrap
    width: parent.width
    opacity: 0
    Behavior on opacity {
        NumberAnimation {
            duration: mainWindow.duration
        }
    }
}
