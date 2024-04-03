#ifndef PROGRAMSCONTROL_H
#define PROGRAMSCONTROL_H

#include <functional>

#include <QObject>

#include <dto/programdto.h>

#include <film-flow-core/controller/programscontroller.h>

class ProgramsControl : public QObject {
    Q_OBJECT
public:
     ProgramsControl();
    ~ProgramsControl();
public slots:
    void doStart();
    void onSearchByName( const QString& dsQuery );
signals:
    void programsChanged( QList<QObject*> programs, const QString& dsTitleCategory );
    void showLoading();
    void messageError( const QString& title, const QString& description );
private:
    void onSearchOnTheRise();

    bool isProgramsValid( const QList<ProgramModel*>& programs );

    void onSearch( std::function<QList<ProgramModel*>()> findCallback, const QString& title );

    ProgramsController _programsController;
    QList<ProgramDto*> _programsDto;
};

#endif // PROGRAMSCONTROL_H
