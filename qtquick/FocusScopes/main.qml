import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

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


    RowLayout {
        anchors.fill: parent




        FocusScope {



            width: txt.width
            height: txt.height
            x: txt.x
            y: txt.y



            Layout.fillHeight: true
            Layout.fillWidth: true

            TextField {
                id: txt
                anchors.fill: parent


            }


            onFocusChanged: {
                console.log("1focus chaned " + activeFocus);
            }

            onActiveFocusChanged: {
                console.log("1afocus chaned " + activeFocus);
            }

        }

        TextField {

            Layout.fillHeight: true
            Layout.fillWidth: true
            KeyNavigation.tab: btn

            onFocusChanged: {
                console.log("2focus chaned " + activeFocus);
            }

            onActiveFocusChanged: {
                console.log("2afocus chaned " + activeFocus);
            }

        }

        Button {
            id: btn
            text: "press me"
            activeFocusOnPress: true
            activeFocusOnTab: true

            onFocusChanged: {
                console.log("3focus chaned " + activeFocus);
            }

            onActiveFocusChanged: {
                console.log("3afocus chaned " + activeFocus);
            }
        }





    }




}

