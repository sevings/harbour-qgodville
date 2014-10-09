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

import QtQuick.LocalStorage 2.0
import QtQuick 2.0
import Sailfish.Silica 1.0
import "../settings.js" as Settings


Dialog {
    canAccept: godname.text.length > 0
    acceptDestinationAction: PageStackAction.Pop
    Component.onCompleted: {
        Settings.initialize();
        var gn = Settings.getSetting('godname');
        if (gn.length === 0)
            gn = 'Godville'
        godname.text = gn;
        var server = Settings.getSetting('server');
        column.ruServer = server === 'godville.net'
        if (server !== 'godville.net')
            translator.selectLanguage("en");
        else
            translator.selectLanguage("ru");
    }

    onAccepted: {
        Settings.setSetting('godname', godname.text);
        var server = column.ruServer ? 'godville.net' : 'godvillegame.com'
        Settings.setSetting('server', server);
    }

    Column {
        id: column
        property bool ruServer
        width: parent.width - 2*Theme.paddingLarge
        x: Theme.paddingLarge
        spacing: Theme.paddingMedium
        DialogHeader {}
        Label {
            x: Theme.paddingLarge
            text: qsTr("Царство рандома") + translator.emptyString
            horizontalAlignment: Text.AlignRight
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
            wrapMode: Text.Wrap
            width: parent.width - Theme.paddingLarge*2
        }
        TextField {
            id: godname
            anchors { left: parent.left; right: parent.right }
            focus: true
            label: qsTr('Имя бога') + translator.emptyString
            text: 'Godville'
            EnterKey.enabled: text.length > 0
            EnterKey.iconSource: "image://theme/icon-m-enter-close"
            EnterKey.onClicked: focus = false
        }
        TextSwitch {
            text: 'godville.net'
            description: 'Русский сервер'
            //enabled: !column.ruServer
            checked: column.ruServer
            automaticCheck: false
            onClicked: column.ruServer = !column.ruServer
        }
        TextSwitch {
            text: 'godvillegame.com'
            description: 'English server'
            //enabled: column.ruServer
            checked: !column.ruServer
            automaticCheck: false
            onClicked: column.ruServer = !column.ruServer
        }
    }

    Label {
        text: qsTr('ⓒ Василий Ходаков, 2014') + translator.emptyString
        y: (isPortrait ? Screen.height : Screen.width) - Theme.paddingLarge - Theme.fontSizeExtraSmall
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.margins: Theme.paddingLarge
        wrapMode: Text.Wrap
        font.pixelSize: Theme.fontSizeExtraSmall
        color: Theme.secondaryColor
    }
}


