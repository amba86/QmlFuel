import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: id_root
    visible: true
    width: 600
    height: width

    title: qsTr("Fuel HMI")

    Item {
        id: id_fuel_area
        anchors.fill: parent

        Fuel {
            id: id_fuel
            anchors.fill: parent
        }
    }
}
