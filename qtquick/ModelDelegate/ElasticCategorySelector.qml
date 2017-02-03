import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml.Models 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import "ElasticSelector.js" as ELASTIC
import QtQuick.Dialogs 1.1


Item {
    id: root
    property string host;
    property string index: "scans"
    property string type: "categories"
    property bool persistNewCategories: true
    property int max_records: 1000



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
        ListElement {
            cat: "home"
        }
        ListElement {
            cat: "car"
        }
        ListElement {
            cat: "government"
        }
        ListElement {
            cat: "council"
        }
        ListElement {
            cat: "emily"
        }
        ListElement {
            cat: "employment"
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

                Text {
                    id: column
                    anchors { fill: parent; margins: 2 }
                    text:  subcat
                    font.pointSize: 20
                }
            }



        }
    }

    DelegateModel {

        id: visualModel
        model: ListModel {}
        delegate: dragDelegate

        groups:  [

            DelegateModelGroup {
                name: "selected"
                includeByDefault: false
            },
            DelegateModelGroup {
                id: createdDMG
                name: "created"
                includeByDefault: false
            },
            DelegateModelGroup {
                name: "currentcategory"
                includeByDefault: false
            }

        ]

        Component.onCompleted: {
            ELASTIC.fetch_data_into_model(model,visualModel,root.host,root.index,root.type,max_records);
        }

        function finished_loading(cat) {
            lv_categories.current_category = cat;
            ELASTIC.filter_selected_category(visualModel,cat);
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

        Flow {

            Layout.fillWidth: true
            spacing: 4
            clip: true



            Repeater {

                id: lv_categories
                property string current_category
                signal item_selected(int index);

                model: categories.count

                onCurrent_categoryChanged: {
                    ELASTIC.filter_selected_category(visualModel,current_category);
                }

                delegate: Rectangle {

                    color:  txt.text == lv_categories.current_category  ? "lightsteelblue" : "white"
                    width: txt.implicitWidth
                    height: txt.implicitHeight
                    id: the_text

                    Text {
                        id: txt
                        anchors.fill: parent
                        font.pointSize: 24
                        text: categories.get(index).cat
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            lv_categories.current_category = txt.text;
                        }
                    }
                }

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

                    var top_cat = lv_categories.current_category;
                    var obj = new Object();
                    obj.cat = top_cat;
                    obj.subcat = text_ed.text;

                    ELASTIC.insert_item( visualModel.items,  obj);
                    if (root.persistNewCategories) {
                        ELASTIC.save_object(root.host,root.index,root.type,obj);
                    }
                    ELASTIC.filter_selected_category(visualModel,top_cat);
                    text_ed.text="";

                }
            }

    }

    }



}
