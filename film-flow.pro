QT += quick

CONFIG += c++17

VERSION_MAJOR = 1
VERSION_MINOR = 0

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        control/programscontrol.cpp \
        dto/converter/programdtoconverter.cpp \
        dto/programdto.cpp \
        main.cpp \
        register.cpp

RESOURCES += qml.qrc

QML_IMPORT_PATH = $$PWD/component
QML_DESIGNER_IMPORT_PATH =

include($$PWD/../film-flow-generic.pri)

LIBRARY_DEPENDENCIES = \
    CORE \
    HTTP-REQUEST

include($$PWD/../film-flow-dependencies.pri )

# TODO validar se da para remover
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    control/programscontrol.h \
    dto/converter/programdtoconverter.h \
    dto/programdto.h \
    register.h
