#ifndef QTJPEG_GLOBAL_H
#define QTJPEG_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(QTJPEG_LIBRARY)
#  define QTJPEGSHARED_EXPORT Q_DECL_EXPORT
#else
#  define QTJPEGSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // QTJPEG_GLOBAL_H
