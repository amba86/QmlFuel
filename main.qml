import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: id_root
    visible: true
    maximumWidth: 800
    maximumHeight: 600
    minimumWidth: maximumWidth
    minimumHeight: maximumHeight

    title: qsTr("QmlFuel")

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

            id_fuel.set_fuel_level(count)
        }
    }

    Fuel {
        id: id_fuel
        anchors.fill: parent
    }
}
