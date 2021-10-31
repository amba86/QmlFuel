import QtQuick 2.0

Item {
    id: id_root

    property int value: 0
    property int angle_start: 0
    property double angle_lenght: 0.0

    Rectangle {
        y: id_root.height * 0.05
        width: id_root.height * 0.02
        height: id_root.height * 0.45
        color: "#118AB2"
        antialiasing: true
        anchors.horizontalCenter: id_root.horizontalCenter
    }

    rotation: value * angle_lenght + angle_start

    Behavior on rotation {
        SmoothedAnimation { velocity: 50 }
    }
}
