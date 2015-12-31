#ifndef MYITEM_H
#define MYITEM_H

#include <QQuickItem>

class MyItem : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(MyItem)

public:
    MyItem(QQuickItem *parent = 0);
    Q_INVOKABLE int add(int x,int y);

    ~MyItem();
};

#endif // MYITEM_H

