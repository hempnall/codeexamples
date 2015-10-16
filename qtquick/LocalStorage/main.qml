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
        updateListView();
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




    function updateListView() {

        db.transaction(
             function(tx) {
                // Show all added greetings
                var rs = tx.executeSql('SELECT * FROM Greeting');
                names.clear()
                   for(var i = 0; i < rs.rows.length; i++) {
                       names.append( { 'name':rs.rows.item(i).name } )
                       console.log(  rs.rows.item(i).name  );
                   }
                 });
    }


    Component {
        id: nameDelegate
        Row {
            spacing: 10
            Text { text: name }

        }
    }

    ColumnLayout {

        id: layt
        anchors.fill: parent



        ListModel {
            id: names



        }


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


                             }
                         );

                    updateListView();

                }
            }
        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: names
            delegate: nameDelegate
        }

    }
}

