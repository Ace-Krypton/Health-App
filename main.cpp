#include <QQmlContext>
#include <QApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>

#include "usermanager.hpp"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    UserManager *userManager = new UserManager();
    engine.rootContext()->setContextProperty("userManager", userManager);

    const QUrl url(u"qrc:/HealthAppDEMO/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
