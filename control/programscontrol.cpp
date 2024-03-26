#include "programscontrol.h"

#include <dto/converter/programdtoconverter.h>

#include <film-flow-core/utils/listconverter.h>
#include <film-flow-core/utils/synctask.h>

namespace {
constexpr const char* DS_TITLE_ON_THE_RISE = "Em Alta";
constexpr const char* DS_TITLE_SEARCH = "Resultados";
}

void ProgramsControl::doStart() {

    QList<ProgramModel*> programsModel = {};

    emit showLoading();

    SyncTask::runSync( [&]() {
        programsModel = _programsController.findOnTheRise();
    });

    QList<QObject*> programsDto = ListConverter<ProgramDto,QObject>::toList( ProgramDtoConverter::toDtos( programsModel ) );

    qDeleteAll( programsModel );

    emit programsChanged( programsDto, DS_TITLE_ON_THE_RISE );

}

void ProgramsControl::onSearch( const QString& dsQuery ) {

    emit showLoading();

    QList<ProgramModel*> programsModel = {};

    SyncTask::runSync( [&]() {
        programsModel = _programsController.findByName( dsQuery );
    });

    QList<QObject*> programsDto = ListConverter<ProgramDto,QObject>::toList( ProgramDtoConverter::toDtos( programsModel ) );

    qDeleteAll( programsModel );

    if( programsModel.isEmpty() ) {
        emit messageError("Nenhum filme encontrado!","Não encontramos nenhum filme que corresponda à sua pesquisa. Por favor, tente novamente com termos diferentes.");
        return;
    }

    emit programsChanged( programsDto, DS_TITLE_SEARCH );

}
