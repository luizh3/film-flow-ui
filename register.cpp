#include "register.h"

#include <QQmlEngine>

#include "control/programscontrol.h"

void Register::type() {

    qInfo() << "Register::type";

    qmlRegisterType<ProgramsControl>( "ProgramsControl", 1, 0, "ProgramsControl" );

    qInfo() << "Register::type";
}
