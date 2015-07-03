import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.1
import QtQuick.LocalStorage 2.0
import Qt.labs.settings 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.Window
    DDuiShadowBg{
        id:bg
        width: parent.width
        height: parent.height
        Rectangle {
            id: main
            anchors.fill: parent
            anchors.margins: 10
            color: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
        }
    }
}
