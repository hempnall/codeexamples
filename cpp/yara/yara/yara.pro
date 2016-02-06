TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS = -L/Users/James/dev/src/yara/libyara -lyara
INCLUDEPATH += /Users/James/dev/src/yara/libyara/include

SOURCES += main.cpp

