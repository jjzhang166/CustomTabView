TEMPLATE = app

QT += qml quick widgets core

SOURCES += main.cpp

RESOURCES += qml.qrc
CONFIG += console
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
