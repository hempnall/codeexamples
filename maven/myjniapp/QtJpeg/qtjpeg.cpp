#include "qtjpeg.h"
#include <QImage>
#include <QByteArray>
#include <QBuffer>
#include <iostream>


QByteArray asQByteArray(JNIEnv* env,jbyteArray array) {
    int len = env->GetArrayLength (array);
    char* buf = new  char[len];
    env->GetByteArrayRegion (array, 0, len, reinterpret_cast<jbyte*>(buf));
    return QByteArray::fromRawData(buf,len);
}

jbyteArray JNICALL Java_com_mycompany_app_QtJpeg_transformJpeg
  (JNIEnv *env, jclass obj1, jbyteArray obj2)
{
    QByteArray imgData = asQByteArray(env,obj2);

    QImage img;
    bool res = img.loadFromData(imgData,"JPG");
    if (!res) {
        std::cout << "load image failed\n";
    }

    QByteArray outputByteArray;
    QBuffer buffer(&outputByteArray);
    buffer.open(QIODevice::WriteOnly);
    img.save(&buffer, "JPG");
    buffer.close();

    jbyteArray result=env->NewByteArray( outputByteArray.size());
    env->SetByteArrayRegion( result, 0, outputByteArray.size(), (const jbyte*) outputByteArray.data());


    return result;

}


