import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: id_root
    visible: true
    width: 640
    height: 480

    title: qsTr("Fuel HMI")

    Timer {
        id: id_timer
        repeat: true
        interval: 100
        running: true

        property int count: -255

        onTriggered: {
            if (count++ == 256) {
                count = -255
            }

            id_fuel.set_fuel_level(count)
        }
    }

    Fuel {
        id: id_fuel
        anchors.fill: parent
    }
}
