#ifndef PROGRAMDTO_H
#define PROGRAMDTO_H

#include <QObject>

#include <model/program/programmodel.h>

class ProgramDto : public ProgramModel {
    Q_OBJECT
    Q_PROPERTY( QString dsName READ dsName CONSTANT )
    Q_PROPERTY( QString dsImageUrl READ dsImageUrl CONSTANT )
    Q_PROPERTY( QString dsSummary READ dsSummary CONSTANT )
    Q_PROPERTY( QStringList genres READ genres CONSTANT )
    Q_PROPERTY( QObject* average READ average CONSTANT )
};

#endif // PROGRAMDTO_H
