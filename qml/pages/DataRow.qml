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
