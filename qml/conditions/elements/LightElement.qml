import QtQuick 2.0

Item {
	id: group

	property real scaling: condition.scaling
	property string sphereType: condition.isDay ? "sun" : "moon"
	property int delay: 1500

	width: 480
	height: 480
	anchors.fill: parent
	state: condition.state

	transitions: [
		Transition {
			to: "down"
			SequentialAnimation {
				PauseAnimation { duration: group.delay }
				NumberAnimation { properties: "y"; target: translate; easing.type: Easing.OutBack; duration: 700 }
			}
		},
		Transition {
			to: "up"
			NumberAnimation { properties: "y"; easing.type: Easing.Bezier; duration: 500 }
		}
	]

	states: [
		State {
			name: "up"
			PropertyChanges { target: translate; y: -group.height }
		},
		State {
			name: "down"
			PropertyChanges { target: translate; y: 0 }
		}
	]

	RelativePosition {
		relativePositionX: 0.5
		relativePositionY: group.sphereType == "sun" ? 0.6 : 0.5
		transform: Translate { id: translate }
		Hung {
			lineOffsetX: 0.5
			lineOffsetY: group.sphereType == "sun" ? 0.31 : 0.21
			hungName: "../../images/" + group.sphereType + "_line.png"
			imageName:  "../../images/" + group.sphereType + ".png"
		}
	}
}
