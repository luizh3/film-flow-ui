#ifndef PROGRAMDTOCONVERTER_H
#define PROGRAMDTOCONVERTER_H

#include <dto/programdto.h>

#include <film-flow-core/model/program/programmodel.h>

class ProgramDtoConverter {
public:
    static QList<ProgramDto*> toDtos( const QList<ProgramModel*>& programs );
    static ProgramDto* toDto( const ProgramModel* programModel );
};

#endif // PROGRAMDTOCONVERTER_H
