#ifndef PROGRAMSCONTROL_H
#define PROGRAMSCONTROL_H

#include <QObject>

#include <film-flow-core/controller/programscontroller.h>

class ProgramsControl : public QObject{
    Q_OBJECT
public slots:
    void doStart();
    void onSearch( const QString& dsQuery );
signals:
    void programsChanged( QList<QObject*> programs, const QString& dsTitleCategory );
    void showLoading();
    void messageError( const QString& title, const QString& description );
private:
    ProgramsController _programsController;
};

#endif // PROGRAMSCONTROL_H
