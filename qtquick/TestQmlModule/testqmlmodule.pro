TEMPLATE = lib
TARGET = TestQmlModule
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)


#######################
# This is the equivalent to the package path
# in Java
# module files will be indexed in a file called "qmldir"
# located at <root>/com/hempnall/testmodule
#
# on Mac OS X <root> is at:
# /Users/James/Qt/5.5/clang_64/qml/com/hempnall/testmodule/qmldir
# (it is necessary to go into the build folder for this project and make install it)
#######################
uri = com.hempnall.testmodule

# Input
SOURCES += \
    testqmlmodule_plugin.cpp \
    myitem.cpp

HEADERS += \
    testqmlmodule_plugin.h \
    myitem.h

DISTFILES = qmldir \
    RedRectangle.qml

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}


#############
# any extra files that need to be distributed go here
# (what is the point of DISTFILES???)
##################
qmldir.files = qmldir RedRectangle.qml

unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

