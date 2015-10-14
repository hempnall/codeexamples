#include <iostream>

using namespace std;


class Alt {
public:
    ~Alt() {
        cout << "alt destructor" << endl;
    }
};

class Base {

public:
    virtual ~Base() {

        cout << "base destructor" << endl;
    }

};

class Derived
    : public Base
{
public:
    virtual ~Derived() {
        Alt a;
        cout << "derived destructor" << endl;
    }

    void call_dest() {
        Base::~Base();
    }
};

int main()
{
    Derived d;
    d.call_dest();

    cout << "Hello World!" << endl;
    return 0;
}

