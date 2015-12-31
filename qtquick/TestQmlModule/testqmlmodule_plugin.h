#ifndef TESTQMLMODULE_PLUGIN_H
#define TESTQMLMODULE_PLUGIN_H

#include <QQmlExtensionPlugin>

class TestQmlModulePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // TESTQMLMODULE_PLUGIN_H

