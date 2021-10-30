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
        interval: 200
        running: true

        property int count: -255
        property bool ascending: true

        onTriggered: {
            if (ascending) {
                if (count++ == 256) {
                    count = 255
                    ascending = false
                }
            } else {
                if (count-- == -256) {
                    count = -255
                    ascending = true
                }
            }

//            count = Math.floor(Math.random() * (256 + 255) ) - 255

            id_fuel.set_fuel_level(count)
        }
    }

    Fuel {
        id: id_fuel
        anchors.fill: parent
    }
}
