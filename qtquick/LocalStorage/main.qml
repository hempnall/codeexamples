import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.LocalStorage 2.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property var db


    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("QQmlExampleDB", "1.0", "The Example QML SQL!", 1000000);
        db.transaction(
            function(tx) {
                // Create the database if it doesn't already exist
                tx.executeSql('CREATE TABLE IF NOT EXISTS Greeting(name TEXT)');
            });
    }


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




    function findGreetings() {
        var db = LocalStorage.openDatabaseSync("QQmlExampleDB", "1.0", "The Example QML SQL!", 1000000);

        db.transaction(
            function(tx) {
                // Create the database if it doesn't already exist
                tx.executeSql('CREATE TABLE IF NOT EXISTS Greeting(salutation TEXT, salutee TEXT)');

                // Add (another) greeting row
                tx.executeSql('INSERT INTO Greeting VALUES(?, ?)', [ 'hello', 'world' ]);

                // Show all added greetings
                var rs = tx.executeSql('SELECT * FROM Greeting');

                var r = ""
                for(var i = 0; i < rs.rows.length; i++) {
                    r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
                }
                text = r
            }
        )
    }


    ColumnLayout {

        id: layt
        anchors.fill: parent




        RowLayout {
            anchors.top: layt.top
            Layout.fillWidth: true

            Label {
                text: "Enter name: "
            }
            TextInput {
                id: name
                Layout.fillWidth: true

            }
            Button {
                text: "Add"
                enabled: name.text.trim().length > 0
                onClicked: {

                    db.transaction(
                             function(tx) {

                                 // Add (another) greeting row
                                 tx.executeSql('INSERT INTO Greeting VALUES(?)', [ name.text ]);

                                 // Show all added greetings
                                 var rs = tx.executeSql('SELECT * FROM Greeting');

//                                 var r = ""
                                 for(var i = 0; i < rs.rows.length; i++) {
//                                     r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
                                     console.log(  rs.rows.item(i).name  );
                                 }
                                // text = r
                             }
                         )

                }
            }
        }

        TableView {
            Layout.fillHeight: true
            Layout.fillWidth: true


        }

    }
}

