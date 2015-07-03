import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 300
    height: 200
    border.width: 1
    border.color: "black"
    Flickable {
        id: flick
        width: parent.width-2; height: parent.height-2;
        anchors.centerIn: parent
        contentWidth: edit.paintedWidth
        contentHeight: edit.paintedHeight
        boundsBehavior: Flickable.StopAtBounds
        clip: true
        function ensureVisible(r)
        {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX+width <= r.x+r.width)
                contentX = r.x+r.width-width;
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY+height <= r.y+r.height)
                contentY = r.y+r.height-height;
        }

        TextEdit {
            id: edit
            width: flick.width
            height: flick.height
            focus: true
            font.family: "Helvetica"
            font.pointSize: 20
            color: "blue"
            wrapMode: TextEdit.Wrap
            selectByMouse: true
            onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
        }
        MouseArea{
            id:ma
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button == Qt.RightButton){
                    console.log("----------RightButton------");
                    contextMenu.popup();
                }else{
                    console.log("left----------button"+mouseX);
                    edit.cursorPosition =mouseX
                }
            }
            onPressAndHold: {
                console.log("hold 800ms");
                contextMenu.popup();
            }
            onPositionChanged: {
                console.log("--------onPositionChanged------")
            }
            onReleased: {
                console.log("--------onReleased------")
            }
        }
    }
    Menu {
        id: contextMenu
        MenuItem {
            text: qsTr('Delete')
            shortcut: "Ctrl+D"
            onTriggered:{}
        }
        MenuItem {
            text: qsTr('Add')
            shortcut: "Ctrl+A"
        }
        MenuItem {
            text: qsTr('Close')
            shortcut: "Ctrl+CC"
        }
        style: MenuStyle{
            id: styleRoot
            frame:Rectangle {
                color: "gray"
            }
            separator:Rectangle{
                height: 1
                color: "white"
            }
        }
    }

}

