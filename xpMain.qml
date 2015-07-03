import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.1

ApplicationWindow {
    id:rootWindow
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.Window
    property color myColor: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
    property color myTxtColor: Qt.rgba(Math.random(),Math.random(),Math.random(),1.0)
    property int borWidth: 20
    MouseArea{
        property variant clickPos: "1,1"
        anchors.fill: parent
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            rootWindow.x += delta.x;
            rootWindow.y += delta.y;
        }
    }

    Rectangle{
        id:mid
        anchors.fill: parent
        anchors.margins: borWidth
        color: myColor
        Text {
            id: name
//            text: qsTr("선미(善美)-Korea")
            text:"表弟是禽兽(Shit)"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28
            font.family: "comic sans ms"
            color: myTxtColor
        }
        MidTabView{
            id:midA
            anchors.top: name.bottom
            anchors.bottom: parent.bottom
            width: parent.width
        }
    }
    function setColor(values){
        mid.color = Qt.lighter(myColor,values);
        name.color = Qt.darker(myTxtColor,values);
    }

    LeftBorder{
        id:leftB
        width: borWidth
        height: parent.height
        borderW:borWidth
    }
    RightBorder{
        id:rightB
        width: borWidth
        height: parent.height
        anchors.right: parent.right
    }
    TopBorder{
        id:topB
        width: parent.width-leftB.width*2
        height: borWidth
        anchors.left: leftB.right
        anchors.top: parent.top
    }
    BottomBorder{
        id:btmB
        width: parent.width-leftB.width*2
        anchors.left: leftB.right
        height: borWidth
        anchors.bottom:  parent.bottom
    }
    Component.onCompleted: {
//        var f64a = new Float64Array(8);
//        f64a[0] = 10;
//        f64a[1] = 20;
//        f64a[2] = f64a[0] + f64a[1];
//        console.log(JSON.stringify(f64a))

//        function f(){ console.log(this.x); };

//        var a = {x:'a'};
//        a.m = f;

//        var b = {x:'b'};
//        b.m = f;

//        a.m() // a
//        b.m() // b

//        var o = {
//            v: 'hello',
//            p: [ 'a1', 'a2' ],
//            f: function f() {
//                var that = this;
//                this.p.forEach(function (item) {
//                    console.log(that.v+' '+item);
//                });
//            }
//        }

//        o.f();

//        //构造函数每一个对象都有一个对应的原型对象，被称为prototype对象。
//        //定义在原型对象上的所有属性和方法，都能被派生对象继承。这就是JavaScript继承机制的基本设计
//        function Animal (name) {
//          this.name = name;
//        }

//        Animal.prototype.color = "white";

//        var cat1 = new Animal('大毛');
//        var cat2 = new Animal('二毛');

//        Animal.prototype.walk = function () {
//           console.log(this.name + ' is walking.by prototype');
//        };
//        Animal.walk = function(){
//            console.log(this.name + ' is walking.');
//        }

//        console.log(cat1.color) // 'white'
//        Animal.prototype.color = "red";
//       (cat1.walk());
//        console.log(cat2.color) // 'white'
    }
}
