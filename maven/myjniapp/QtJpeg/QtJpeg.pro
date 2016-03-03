#-------------------------------------------------
#
# Project created by QtCreator 2016-03-03T10:02:19
#
#-------------------------------------------------

TARGET = QtJpeg
TEMPLATE = lib

DEFINES += QTJPEG_LIBRARY

SOURCES += qtjpeg.cpp

INCLUDEPATH += /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers/ #/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/include/

HEADERS += qtjpeg.h\
        qtjpeg_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
