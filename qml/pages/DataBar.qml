import QtQuick 2.0
import Sailfish.Silica 1.0
//import "../HeroData.js" as Data

Rectangle {
    property color barColor
    //property string param
    property int value
    property int maxValue: 100
    property real percent: value / maxValue
    visible: false
    width: parent.width
    height: Theme.itemSizeExtraSmall/3
    color: 'transparent'
    border.width: 2
    border.color: Theme.secondaryColor
    Rectangle {
        height: parent.height - parent.border.width*2
        x: parent.x + parent.border.width
        anchors.verticalCenter: parent.verticalCenter
        width: (parent.width - parent.border.width*2) * (percent > 1 ? 1 : percent)
        color: barColor
        visible: parent.visible
        Behavior on width {
            NumberAnimation {
                duration: mainWindow.duration
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: mainWindow.duration
            }
        }
    }

}
