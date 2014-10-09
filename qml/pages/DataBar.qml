/*
    Godville Viewer for SailfishOS
    Copyright ⓒ 2014 Vasily Khodakov <binque@ya.ru>.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

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
