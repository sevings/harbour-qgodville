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

Row {
    visible: false
    property string lText
    property string rText
    //property string param
    Label {
        id: left
        //verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        text: lText
    }
    Label {
        id: right
        horizontalAlignment: Text.AlignRight
        //verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.parent.width - left.width
        wrapMode: Text.Wrap
        text: rText
    }
}
