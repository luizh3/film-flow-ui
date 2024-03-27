QT += quick

CONFIG += c++17

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        control/programscontrol.cpp \
        dto/converter/programdtoconverter.cpp \
        main.cpp \
        register.cpp

HEADERS += \
    control/programscontrol.h \
    dto/converter/programdtoconverter.h \
    dto/programdto.h \
    register.h

RESOURCES += qml.qrc

QML_IMPORT_PATH = $$PWD/component
QML_DESIGNER_IMPORT_PATH =

LIBRARY_DEPENDENCIES = \
    CORE \
    HTTP-REQUEST

CONFIG( debug, debug|release ) {
    DESTDIR = build/debug
}

CONFIG( release, debug|release ) {
    DESTDIR = build/release
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.u

unix {
    target.path = /usr/bin
    INSTALLS += target
}

# TODO validar se da para remover
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

include($$PWD/film-flow-ui-dependencies.pri )
