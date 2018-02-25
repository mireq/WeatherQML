import QtQuick 2.0

Item {
	id: group

	property real scaling: condition.scaling
	property string sphereType: condition.isDay ? "sun" : "moon"

	width: 480
	height: 480
	anchors.fill: parent

	RelativePosition {
		relativePositionX: 0.5
		relativePositionY: group.sphereType == "sun" ? 0.6 : 0.5
		Hung {
			lineOffsetX: 0.5
			lineOffsetY: group.sphereType == "sun" ? 0.31 : 0.21
			hungName: "../../../images/" + group.sphereType + "_line.png"
			imageName:  "../../../images/" + group.sphereType + ".png"
		}
	}
}
