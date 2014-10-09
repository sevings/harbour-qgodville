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


