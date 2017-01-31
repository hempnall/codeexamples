import QtQuick 2.5
import QtQuick.Window 2.2
import QtQml.Models 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Window {
    visible: true

    width: 400;
    height: 400;


    ElasticCategorySelector {
        anchors.fill: parent
        host: "http://diskstation:9200"
        index: "scans"
        type: "categories"
    }


}
