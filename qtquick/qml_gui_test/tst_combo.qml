import QtQuick 2.3
import QtTest 1.0
import QtQuick.Controls 1.4

Rectangle {
    id: rect
    color: "red"
    width: 200
    height: 100

    ComboBox {
        id: cmbbox
        objectName: "cmb"
        currentIndex: 0
        model: ListModel {
            id: cbItems
            ListElement { text: "Banana"; color: "Yellow" }
            ListElement { text: "Apple"; color: "Green" }
            ListElement { text: "Coconut"; color: "Brown" }
        }
        width: 200
        onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)

        TestCase {
            name: "combo test"
            when: windowShown


            function test_sample() {

                var x= findChild(rect,"cmb");
                cmbbox.focus = true;

                mouseClick(x);



//            console.log("before");

            console.log("after");
//            keyClick(Qt.Key_Down,Qt.NoModifier,30);
//            keyClick(Qt.Key_C,Qt.NoModifier,30);


        }

    }
    }
}

