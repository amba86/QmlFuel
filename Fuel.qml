import QtQuick 2.0

Item {
    id: id_group

    property int fuel_level

    Rectangle {
        id: id_fuel
        anchors.fill: parent
        anchors.centerIn: parent

        property int dial_count: 4

        /*
         * Draw bargraph and background as semicircle
         */

        Canvas {
            id: id_canvas
            anchors.fill: parent
            contextType: "2d"
            rotation: 180
            antialiasing: true

            property int line_width: id_fuel.width * 0.02
            property int half_line_width: line_width / 2
            property int radius: Math.max(id_fuel.width, id_fuel.height) / 2 - half_line_width

            onPaint: {
                var context = id_canvas.getContext("2d");
                context.fillStyle = "blue";
                context.strokeStyle = "red";
                context.lineWidth = line_width;

                context.beginPath();
                context.arc(id_fuel.width / 2, 0, radius, 0, Math.PI);
                context.fill();

                context.beginPath();
                context.arc(id_fuel.width / 2, 0, radius, 0, Math.PI * 0.33);
                context.stroke();

                context.strokeStyle = "orange";
                context.beginPath();
                context.arc(id_fuel.width / 2, 0, radius, Math.PI * 0.33, Math.PI * 0.66);
                context.stroke();

                context.strokeStyle = "green";
                context.beginPath();
                context.arc(id_fuel.width / 2, 0, radius, Math.PI * 0.66, Math.PI);
                context.stroke();
            }
        }

        /*
         * Draw dials
         */

        Repeater {
            model: id_fuel.dial_count

            Item {
                x: id_fuel.width / 2
                height: id_fuel.height / 2
                transformOrigin: Item.Bottom
                rotation: index * 60 + 270
                anchors.bottom: id_fuel.bottom
                anchors.bottomMargin: id_fuel.height * 0.01

                Rectangle {
                    height: id_fuel.height * 0.1
                    width: id_fuel.width * 0.02
                    color: "black"
                    antialiasing: true
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: index % 3 == 0 ? 0 : id_fuel.height * 0.01 // margin to bargraph
                }
            }
        }
    }
}
