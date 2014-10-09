import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    id: mainWindow
    initialPage: Component { MainPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    property string coverText: 'QGodville'
    property real inv: 0
    property real hp: 0
    property real qp: 0
    property real gp: 0
    property string gold
    property bool showBars: false
    property bool expired: false
    property bool fight: false
    property int duration: 1000
}


