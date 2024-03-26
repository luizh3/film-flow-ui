#include "programdtoconverter.h"

QList<ProgramDto*> ProgramDtoConverter::toDtos( const QList<ProgramModel*>& programs ) {

    QList<ProgramDto*> programsDto = {};

    for( const ProgramModel* program : programs ){
        programsDto.append( ProgramDtoConverter::toDto( program ) );
    }

    return programsDto;

}

ProgramDto* ProgramDtoConverter::toDto( const ProgramModel* programModel ) {

    ProgramDto* programDto = new ProgramDto();
    programDto->setDsImageUrl( programModel->dsImageUrl() );
    programDto->setDsName( programModel->dsName() );
    programDto->setDsSummary( programModel->dsSummary() );
    programDto->setGenres( programModel->genres() );

    if( programModel->average() ){
        programDto->setAverage( new ProgramAverageModel( programModel->average()->nrRating() ) );
    }

    return programDto;
}
