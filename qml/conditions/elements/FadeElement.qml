import QtQuick 2.0

Item {
	id: fade
	state: condition.state

	transitions: [
		Transition {
			to: "down"
			SequentialAnimation {
				PauseAnimation { duration: 500 }
				NumberAnimation { properties: "opacity"; target: fade; easing.type: Easing.Bezier; duration: 1000 }
			}
		},
		Transition {
			to: "up"
			NumberAnimation { properties: "opacity"; easing.type: Easing.Bezier; duration: 200 }
		}
	]

	states: [
		State {
			name: "up"
			PropertyChanges { target: fade; opacity: 0 }
		},
		State {
			name: "down"
			PropertyChanges { target: fade; opacity: 1 }
		}
	]
}
