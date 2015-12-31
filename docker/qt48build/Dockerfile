FROM centos:6.6
MAINTAINER jimmy
RUN yum install -y gcc gcc-c++ autoconf automake pkgconfig
RUN yum groupinstall -y X11
RUN yum install -y xorg-x11-server-devel
ADD qt-everywhere-opensource-src-4.8.2.tar.gz /  
WORKDIR /qt-everywhere-opensource-src-4.8.2
RUN ./configure -confirm-license  -opensource -no-webkit -no-script -no-scripttools -no-qt3support -nomake demos -nomake tools -nomake examples
RUN gmake
RUN gmake install
ADD expat-2.1.0.tar.gz /
WORKDIR  /expat-2.1.0
RUN ./configure
RUN make
RUN make install
#ADD freetype-2.4.0.tar.gz /
#WORKDIR /freetype-2.4.0
#RUN ./configure
#RUN make
#RUN make install
RUN yum install -y freetype-devel
ADD fontconfig-2.11.94.tar.gz /
WORKDIR /fontconfig-2.11.94
RUN ./configure
RUN make
RUN make install
ADD poppler-0.39.0.tar.xz /
WORKDIR /poppler-0.39.0
RUN yum install -y openjpeg-devel libjpeg-devel cmake
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig/
ENV POPPLER_QT4_CFLAGS "-I/usr/local/Trolltech/Qt-4.8.2/include"
ENV POPPLER_QT4_TEST_CFLAGS "-I/usr/local/Trolltech/Qt-4.8.2/include"
ENV POPPLER_QT4_LIBS "-L/usr/local/Trolltech/Qt-4.8.2/lib -lQtCore -lQtGui -lQtXml"
ENV POPPLER_QT4_TEST_LIBS "-L/usr/local/Trolltech/Qt-4.8.2/lib -lQtTest"
RUN ln -s /usr/local/Trolltech/Qt-4.8.2/bin/moc   /usr/bin/moc
ENV CMAKE_VERBOSE_MAKEFILE "ON"
RUN cmake -DCMAKE_VERBOSE_MAKEFILE=ON .
RUN ./configure --enable-poppler-qt4
#ADD build-poppler.sh /
#RUN chmod +x /build-poppler.sh
RUN make VERBOSE=1
RUN make install
ADD page.pdf /
RUN ln -s /usr/local/Trolltech/Qt-4.8.2/bin/qmake   /usr/bin/qmake
RUN mkdir /testqt
ADD main.cpp /testqt
ADD main.pro /testqt
WORKDIR /testqt
RUN qmake
RUN make
ADD poppler.conf /etc/ld.so.conf.d
RUN ldconfig
RUN ./main
