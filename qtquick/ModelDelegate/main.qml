import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml.Models 2.2
import QtQuick.Layouts 1.1

Window {
    visible: true

    width: 400;
    height: 400;

    ListModel {
        id: categories
        ListElement {
            cat: "health"
        }
        ListElement {
            cat: "finance"
        }
        ListElement {
            cat: "utilities"
        }
    }

    Component {

        id: dragDelegate

        MouseArea {

            id: dragArea

            property bool held: false

            anchors { left: parent.left; right: parent.right }
            height: content.height


            onClicked: dragArea.DelegateModel.inSelected = !dragArea.DelegateModel.inSelected

            Rectangle {

                id: content
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                width: dragArea.width; height: column.implicitHeight + 4

                border.width: 3
                border.color: "lightsteelblue"

                color: dragArea.DelegateModel.inSelected ? "lightsteelblue" : "white"
                Behavior on color { ColorAnimation { duration: 100 } }

                radius: 2



                states: State {
                    when: dragArea.held

                    ParentChange { target: content; parent: root }
                    AnchorChanges {
                        target: content
                        anchors { horizontalCenter: undefined; verticalCenter: undefined }
                    }
                }

                Column {

                    id: column
                    anchors { fill: parent; margins: 2 }

                    Text { text: 'cat: ' + cat }
                    Text { text: 'subcat: ' + subcat }
                }
            }



        }
    }

    DelegateModel {
        id: visualModel
        model: DataModel {}
        delegate: dragDelegate

        groups:  [
            DelegateModelGroup {
                name: "health"
            },
            DelegateModelGroup {
                name: "finance"
            },
            DelegateModelGroup {
                name: "utilities"
            }
            ,
            DelegateModelGroup { name: "selected" }
        ]

        filterOnGroup: "health"

        Component.onCompleted: {
            var rowCount = model.count;
            items.remove(0,rowCount);
            for( var i = 0;i < rowCount;i++ ) {
                var entry = model.get(i);
                items.insert(entry, entry.cat.toLowerCase());
            }

        }

    }

    ColumnLayout {

        anchors.fill: parent


        ListView {

            id: lv_categories
            model: categories

            Layout.fillWidth: true
            Layout.minimumHeight: 50
            Layout.preferredHeight: 50

            highlightFollowsCurrentItem: true

            highlight: Rectangle {

                height: 100
                color: "red"
            }

            delegate: Text {
                width: lv_categories.width
                id: del_txt
                text: cat


                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        lv_categories.currentIndex = index

                    }
                }
            }

            onCurrentItemChanged:  {
                var model_cat = categories.get(currentIndex).cat
                console.log(model_cat)
                visualModel.filterOnGroup = model_cat
            }


        }

        ListView {
            id: view

            Layout.fillHeight: true
            Layout.fillWidth: true

            model: visualModel

            spacing: 4
            cacheBuffer: 50
        }

    }
}
