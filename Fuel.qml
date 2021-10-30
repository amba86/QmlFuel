import QtQuick 2.0

Item {
    id: id_group

    property int fuel_evel

    Rectangle {
        id: id_fuel

        property int dial_count: 3

        anchors.centerIn: parent

        width: id_group.width
        height: id_group.height
//        radius: width / 2
//        color: "black"
//        border.color: "yellow"
//        border.width: 2
    }

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
}
