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

Page {
    SilicaFlickable {
        contentHeight: column.height + Theme.paddingLarge
        anchors.fill: parent
        Column {
            id: column
            width: parent.width - 2*Theme.paddingLarge
            x: Theme.paddingLarge
            spacing: Theme.paddingSmall
            PageHeader {
                id: header
                title: qsTr('Помощь') + translator.emptyString
            }
            Label {
                id: label
                width: parent.width
                wrapMode: Text.Wrap
                text: qsTr('В этом приложении Вы можете смотреть информацию о героях Годвилля. Просто введите свое имя бога и выберите сервер (русский язык — godville.net, английский язык — godvillegame.com). Вам не нужно знать пароль.\nИгроки англоязычного сервера могут видеть только основную информацию о героях, например, имена или уровни. Игроки русскоязычного сервера могут видеть постоянно обновляющуюся информацию: текущее здоровье, прогресс выполнения задания и другую. Для этого нужно установить флажок "Оперативные данные в API" в профиле.\nОбратите также внимание, что информация обновляется в течение примерно только одного часа после Вашего последнего входа на сайт.') + translator.emptyString
            }
        }
    }
}
