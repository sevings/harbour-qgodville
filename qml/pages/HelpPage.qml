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
