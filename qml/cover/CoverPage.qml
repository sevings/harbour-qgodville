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

CoverBackground {
    Label {
        id: label
        anchors.top: parent.top
        anchors.margins: Theme.paddingLarge
        anchors.horizontalCenter: parent.horizontalCenter
        text: mainWindow.coverText
        wrapMode: Text.Wrap
    }
    Grid {
        columns: 2
        spacing: Theme.paddingMedium
        anchors.centerIn: parent
        visible: mainWindow.showBars
        ProgressCircle {
            value: mainWindow.inv
            Label {
                text: 'INV'
                anchors.centerIn: parent
            }
        }
        ProgressCircle {
            value: mainWindow.hp
            Label {
                text: 'HP'
                anchors.centerIn: parent
            }
        }
        ProgressCircle {
            value: mainWindow.qp
            Label {
                text: 'QP'
                anchors.centerIn: parent
            }
        }
        ProgressCircle {
            value: mainWindow.gp
            Label {
                text: 'GP'
                anchors.centerIn: parent
            }
        }
    }
    Label {
        anchors.centerIn: parent
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: mainWindow.gold
        visible: !mainWindow.showBars
        font.pixelSize: Theme.fontSizeExtraLarge
        width: parent.width
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.margins: Theme.paddingLarge
        anchors.horizontalCenter: parent.horizontalCenter
        text: mainWindow.expired ? qsTr('Данные устарели!') : (mainWindow.fight ? qsTr('Битва началась!') : '') + translator.emptyString
        wrapMode: Text.Wrap
        color: Theme.highlightColor
        font.pixelSize: Theme.fontSizeExtraSmall
        width: parent.width - Theme.paddingLarge * 2
    }
}


