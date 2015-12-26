TEMPLATE = app

QT += gui

SOURCES += main.cpp 


INCLUDEPATH += /usr/local/include/poppler/qt4
#INCLUDEPATH += /opt/local/include

LIBS += -L/usr/local/lib -lpoppler-qt4 




