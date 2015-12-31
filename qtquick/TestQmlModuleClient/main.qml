import QtQuick 2.5
import QtQuick.Controls 1.4
import com.hempnall.testmodule 1.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MyAdder {
        id: myItem
    }

    RedRectangle {
        anchors.fill: parent

    }

    Button {
        text: qsTr("Hello World")
        anchors.centerIn: parent
        onClicked: {
            console.log(myItem.add(3,4));
        }
    }
}

