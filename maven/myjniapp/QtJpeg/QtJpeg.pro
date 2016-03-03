#-------------------------------------------------
#
# Project created by QtCreator 2016-03-03T10:02:19
#
#-------------------------------------------------

TARGET = QtJpeg
TEMPLATE = lib

DEFINES += QTJPEG_LIBRARY

SOURCES += qtjpeg.cpp



INCLUDEPATH += /usr/lib/jvm/java-7-openjdk-amd64/include/


HEADERS += qtjpeg.h\
        qtjpeg_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
