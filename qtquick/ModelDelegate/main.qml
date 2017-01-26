import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml.Models 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import "SendObjectToElasticSearch.js" as ELASTICSEARCH

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

        anchors {
            fill: parent
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
            bottomMargin: 5
        }

        ListView {

            id: lv_categories
            model: categories

            Layout.fillWidth: true
            Layout.minimumHeight: 50
            Layout.preferredHeight: 50
            spacing: 4

            highlightFollowsCurrentItem: true

            highlight: Rectangle {
               // anchors.fill: parent
                color: "lightsteelblue"

            }

            orientation: Qt.LeftToRight


            delegate:
                Text {
                    width: the_text.implicitWidth
                    height: the_text.implicitHeight
                    id: the_text

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

        RowLayout {

            Layout.maximumHeight:   50
            Layout.fillWidth: true

            Rectangle {

                id: rct
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "lightsteelblue"

                TextEdit {
                    id: text_ed
                    anchors {
                        margins: 5
                        fill: parent
                    }

                }
            }

            Button {
                Layout.fillHeight:  true
                text: "+"
                onClicked: {
                    var top_cat = categories.get( lv_categories.currentIndex).cat;

                    var obj = new Object();
                    obj.category = top_cat;
                    obj.sub_cat = text_ed.text;
                    console.log( JSON.stringify(obj));

                    ELASTICSEARCH.save_category(obj);

                }
            }

        }



    }
}
