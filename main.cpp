#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    if(QSysInfo::windowsVersion() == QSysInfo::WV_XP){
        qDebug()<<" current system type is XP";
        engine.load(QUrl(QStringLiteral("qrc:/xpMain.qml")));
    }else{
        engine.load(QUrl(QStringLiteral("./xpMain.qml")));
    }
    return app.exec();
}
