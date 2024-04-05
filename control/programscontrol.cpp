#include "programscontrol.h"

#include <QDebug>

#include <dto/converter/programdtoconverter.h>

#include <film-flow-core/utils/listconverter.h>
#include <film-flow-core/utils/synctask.h>

namespace {
constexpr const char* DS_TITLE_ON_THE_RISE = "Em Alta";
constexpr const char* DS_TITLE_SEARCH = "Resultados";
}

ProgramsControl::ProgramsControl() :
    _programsDto( {} ) {}

ProgramsControl::~ProgramsControl() {
    qDeleteAll( _programsDto );
}

void ProgramsControl::doStart() {

    qInfo() << "ProgramsControl::doStart";

    onSearchOnTheRise();

    qInfo() << "ProgramsControl::doStart";
}

void ProgramsControl::onSearchByName( const QString& dsQuery ) {

    qInfo() << "ProgramsControl::onSearchByName [DS_QUERY]" << dsQuery;

    onSearch([&](){
        return _programController.findByName( dsQuery );
    }, DS_TITLE_SEARCH );

    qInfo() << "ProgramsControl::onSearchByName";

}

void ProgramsControl::onSearchOnTheRise() {

    qInfo() << "ProgramsControl::onSearchOnTheRise";

    onSearch([&](){
        return _programController.findOnTheRise();
    }, DS_TITLE_ON_THE_RISE );

    qInfo() << "ProgramsControl::onSearchOnTheRise";

}

bool ProgramsControl::isProgramsValid( const QList<ProgramModel*>& programs ) {

    qInfo() << "ProgramsControl::isProgramsValid [PROGRAMS_COUNT]" << programs.count();

    if( programs.isEmpty() ) {
        emit messageError("Nenhum filme encontrado!","Não encontramos nenhum filme que corresponda à sua pesquisa. Por favor, tente novamente com termos diferentes.");
        return false;
    }

    qInfo() << "ProgramsControl::isProgramsValid [RETURN] true";

    return true;
}

void ProgramsControl::onSearch( std::function<QList<ProgramModel*>()> findCallback, const QString& title ) {

    qInfo() << "ProgramsControl::onSearch";

    emit showLoading();

    QList<ProgramModel*> programs = {};

    SyncTask::runSync( [&]() {
        programs = findCallback();
    });

    qDeleteAll( _programsDto );

    if( !isProgramsValid( programs ) ){
        return;
    }

    _programsDto = ProgramDtoConverter::toDtos( programs );

    qDeleteAll( programs );

    QList<QObject*> programsObject = ListConverter<ProgramDto,QObject>::toList( _programsDto );

    emit programsChanged( programsObject, title );

    qInfo() << "ProgramsControl::onSearch";

}
