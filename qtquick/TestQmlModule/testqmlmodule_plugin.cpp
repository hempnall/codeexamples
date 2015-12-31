#include "testqmlmodule_plugin.h"
#include "myitem.h"

#include <qqml.h>

void TestQmlModulePlugin::registerTypes(const char *uri)
{
    // @uri com.hempnall.testmodule
    qmlRegisterType<MyItem>(uri, 1, 0, "MyAdder");
}


