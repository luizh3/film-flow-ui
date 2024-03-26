#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "register.h"

int main(int argc, char *argv[]) {
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QIcon::setThemeName("theme");

    QGuiApplication app(argc, argv);
    app.setOrganizationName("Film Flow");
    app.setOrganizationDomain("film.flow.br");
    QCoreApplication::setApplicationName("Film Flow");

    Register::type();

    QQmlApplicationEngine engine;
    engine.addImportPath(":/component");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                      &app, [url](QObject *obj, const QUrl& objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
