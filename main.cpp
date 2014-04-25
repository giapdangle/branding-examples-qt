/**
 * Copyright (c) 2012-2014 Microsoft Mobile.
 */

#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include <QDeclarativeComponent>
#include <QDeclarativeEngine>
#include <QGraphicsScene>
#include <QGraphicsObject>

#include "qmlapplicationviewer.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());

    QDeclarativeComponent component(viewer->engine(), QUrl::fromLocalFile("qml/Branding/main.qml"));
    QGraphicsObject *object = qobject_cast<QGraphicsObject *>(component.create());

    QGraphicsScene scene;
    scene.addItem(object);

    viewer->setScene(&scene);

    viewer->showExpanded();

    return app->exec();
}
