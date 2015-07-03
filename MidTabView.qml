//import QtQuick 2.0
//import QtQuick.Controls.Styles 1.2

//import QtQuick.Controls 1.2

//TabView {
//    id: frame
//    anchors.fill: parent
//    anchors.margins: 24
//    Tab { title: "Tab 1" }
//    Tab { title: "Tab 2" }
//    Tab { title: "Tab 3" }
//    signal signalClickeClose(int index);
//    style: TabViewStyle {
//        frameOverlap: 1
//        tab: Rectangle {
//            color: styleData.selected ? "#198219" :"#313131"
//            border.color:  "#00ffffff"
//            implicitWidth: Math.max(text.width + 4, 80)
//            implicitHeight: 20
//            radius: 2
//            MouseArea{
//                id:am
//                anchors.fill: closeImg
//                hoverEnabled: true
//                onEntered: {
//                    console.log("----------------------")
//                    closeImg.source = "qrc:/image/backup_btnclose_h.png"
//                }
//                onExited: {
//                    closeImg.source = "qrc:/image/backup_btnclose_n.png";
//                }
//                onClicked: {
//                    closeImg.source = "qrc:/image/backup_btnclose_p.png";
//                    console.log("cur index "+styleData.index);
//                    frame.removeTab(styleData.index);
//                }
//            }
//            Text {
//                id: text
//                anchors.centerIn: parent
//                text: styleData.title
//                color: styleData.selected ? "white" : "black"
//            }
//            Image {
//                id: closeImg
//                source: "qrc:/image/backup_btnclose_n.png"
//                anchors.right: parent.right
//                anchors.rightMargin: 2
//                anchors.top: parent.top
//                anchors.topMargin: 2
//            }
//        }
//        tabsMovable:true
//        frame: Rectangle { color: "#198219" }
//        rightCorner:Image {
//            id: name
//            source: "qrc:/image/backup_btnclose_p.png"
//        }
//    }
//}



import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Item {
    width: 400
    height: 300
    TabView {
        id: tabView
        anchors.fill: parent
        anchors.margins: 10
        Tab { title: "多多指教" }
        Tab { title: "寒山-居士" }
        Tab {
            title: "滑动效果"
            MidRect{
                anchors.fill: parent
                onSignalValueChanged: {

                }
            }
        }
        style: TabViewStyle {
            property color frameColor: "#999"
            property color fillColor: "#eee"
            frameOverlap: 1
            frame: Rectangle {
                color: "#eee"
                border.color: frameColor
            }
            tab: Rectangle {
                color: styleData.selected ? fillColor : frameColor
                implicitWidth: Math.max(text.width + 24, 80)
                implicitHeight: 20
                Rectangle { height: 1 ; width: parent.width ; color: frameColor}
                Rectangle { height: parent.height ; width: 1; color: frameColor}
                Rectangle { x: parent.width -1; height: parent.height ; width: 1; color: frameColor}
                Text {
                    id: text
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 6
                    text: styleData.title
                    color: styleData.selected ? "black" : "white"
                }
                Rectangle {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 4
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: width/2
                    color: control.hovered ? "#eee": "#00ffffff"
                    border.color: control.hovered ?"gray":"#00ffffff"
                    Image { id:closeImg;anchors.centerIn: parent ; source: ""}
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            console.log("----------------------")
                            closeImg.source = "qrc:/image/backup_btnclose_h.png"
                        }
                        onExited: {
                            closeImg.source = "";
                        }
                        onClicked: {
                            closeImg.source = "qrc:/image/backup_btnclose_p.png";
                            tabView.removeTab(styleData.index);
                        }
                    }
                }
            }
        }
    }
}
