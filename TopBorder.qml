import QtQuick 2.0

Item {
    property int borderW: 20
    Row{
        id:topMid
        width: parent.width
        height:borderW
        anchors.top: parent.top
        anchors.left: parent.left
        Repeater{
            model: topMid.width
            Image {
                id: lmid
                source: "qrc:/image/shadow_top.png"
                width: 1
                height: borderW
            }
        }
    }
}

