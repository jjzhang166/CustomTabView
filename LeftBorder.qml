import QtQuick 2.0

Item {
    property int borderW: 20
    Image {
        id: lp
        source: "qrc:/image/shadow_left_top.png"
        width: borderW
        height: borderW
    }
    Column{
        id:lMids
        width: borderW
        height: parent.height-lp.height*2
        anchors.top: lp.bottom
        anchors.left: parent.left
        Repeater{
            model: lMids.height
            Image {
                id: lmid
                source: "qrc:/image/shadow_left.png"
                width: borderW
                height: 1
            }
        }
    }
    Image {
        id: lb
        source: "qrc:/image/shadow_left_bottom.png"
        width: borderW
        height: borderW
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }
}

