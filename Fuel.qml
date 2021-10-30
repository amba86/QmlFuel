import QtQuick 2.0

Item {
    id: id_root

    property int fuel_level

    function set_fuel_level(new_level) {
        var value = Math.max(0, new_level)
        var range = Math.abs(fuel_level - value) / 256.0

        if (range > 0.05) {
            fuel_level = value
        }
    }

    Rectangle {
        id: id_fuel
        anchors.fill: parent
        anchors.centerIn: parent

        property int dial_count: 4
        property int bottom_margin: height / 4

        /*
         * Draw bargraph and background as semicircle
         */
        Canvas {
            id: id_canvas
            anchors.fill: parent
            contextType: "2d"
            rotation: 180
            antialiasing: true
            anchors.bottomMargin: id_fuel.bottom_margin

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
        //        Repeater {
        //            model: id_fuel.dial_count

        //            Item {
        //                x: id_fuel.width / 2
        //                height: id_fuel.height / 2
        //                transformOrigin: Item.Bottom
        //                rotation: index * 60 + 270

        //                Rectangle {
        //                    height: id_fuel.height * 0.1
        //                    width: id_fuel.width * 0.02
        //                    color: "black"
        //                    antialiasing: true
        //                    anchors.bottom: parent.bottom
        //                    anchors.horizontalCenter: parent.horizontalCenter
        //                }
        //            }
        //        }

        /*
         * Draw hand
         */
        Hand {
            id: id_hand
            anchors.top: id_fuel.top
            anchors.bottom: id_fuel.bottom
            anchors.bottomMargin: id_fuel.bottom_margin - height / 2
            anchors.horizontalCenter: parent.horizontalCenter
            value: id_root.fuel_level
            angle_start: 270
            angle_lenght: 0.70588
        }

        /*
         * Draw hand's circle
         */
        Rectangle {
            id: id_hand_circle
            width: id_fuel.width * 0.1
            height: width
            radius: width / 2
            color: "yellow"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: id_fuel.bottom_margin - height / 2
            anchors.horizontalCenter: parent.horizontalCenter
        }

        /*
         * Draw text
         */
        Text {
            id: id_fuel_level_text
            text: ((id_root.fuel_level / 256 * 100) | 0) + " %"
            color: "black"
            font.pixelSize: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: id_fuel.bottom_margin - id_hand_circle.height - height / 2
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
