import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    id:main
    width: 100
    height: 62
    color:"#673AB7"
    signal signalValueChanged(real values);
    Rectangle{
        id:top
        height: 40
        width: parent.width
    }
    Rectangle{
        id:bottom
        height: 40
        width: parent.width
        anchors.bottom: parent.bottom
    }

    Slider {
        anchors.fill: parent
        anchors.margins: 40
        maximumValue:2.0
        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 200
                implicitHeight: 8
                color: "gray"
                radius: 8
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "lightgray"
                border.color: "gray"
                border.width: 2
                implicitWidth: 34
                implicitHeight: 34
                radius: implicitHeight/2
            }
        }
        onValueChanged: {
            console.log("0value changed....... "+value)
            top.color = Qt.lighter(main.color,value);
            bottom.color = Qt.darker(main.color,value);
            signalValueChanged(value);
            rootWindow.setColor(value)
        }
    }
}

