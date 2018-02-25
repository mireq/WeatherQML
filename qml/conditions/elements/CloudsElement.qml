import QtQuick 2.0

Item {
	id: group

	property real scaling: condition.scaling
	property string cloudType: "cloud"
	property bool isolated: false

	width: 480
	height: 480
	anchors.fill: parent
	state: condition.state

	transitions: [
		Transition {
			to: "down"
			SequentialAnimation {
				PauseAnimation { duration: 500 }
				NumberAnimation { properties: "y"; target: translateCloud5; easing.type: Easing.OutBack; duration: 500 }
			}
			SequentialAnimation {
				PauseAnimation { duration: 600 }
				NumberAnimation { properties: "y"; target: translateCloud4; easing.type: Easing.OutBack; duration: 400 }
			}
			SequentialAnimation {
				PauseAnimation { duration: 750 }
				NumberAnimation { properties: "y"; target: translateCloud3; easing.type: Easing.OutBack; duration: 600 }
			}
			SequentialAnimation {
				PauseAnimation { duration: 1000 }
				NumberAnimation { properties: "y"; target: translateCloud2; easing.type: Easing.OutBack; duration: 400 }
			}
			SequentialAnimation {
				PauseAnimation { duration: 1000 }
				NumberAnimation { properties: "y"; target: translateCloud1; easing.type: Easing.OutBack; duration: 300 }
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
			PropertyChanges { target: translateCloud1; y: -group.height }
			PropertyChanges { target: translateCloud2; y: -group.height }
			PropertyChanges { target: translateCloud3; y: -group.height }
			PropertyChanges { target: translateCloud4; y: -group.height }
			PropertyChanges { target: translateCloud5; y: -group.height }
		},
		State {
			name: "down"
			PropertyChanges { target: translateCloud1; y: 0 }
			PropertyChanges { target: translateCloud2; y: 0 }
			PropertyChanges { target: translateCloud3; y: 0 }
			PropertyChanges { target: translateCloud4; y: 0 }
			PropertyChanges { target: translateCloud5; y: 0 }
		}
	]

	RelativePosition {
		relativePositionX: 0.18
		relativePositionY: 0.42
		transform: Translate { id: translateCloud1 }
		CloudBack {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		relativePositionX: 0.9
		relativePositionY: 0.42
		transform: Translate { id: translateCloud2 }
		CloudBack {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		relativePositionX: 0.35
		relativePositionY: 0.5 + (group.cloudType == "tstorm" ? 0.1 : 0)
		transform: Translate { id: translateCloud3 }
		CloudMid {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		visible: !group.isolated
		relativePositionX: 0.7
		relativePositionY: 0.55 + (group.cloudType == "tstorm" ? 0.2 : 0)
		transform: Translate { id: translateCloud4 }
		CloudFront {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		visible: !group.isolated
		relativePositionX: 0.1
		relativePositionY: 0.58 + (group.cloudType == "tstorm" ? 0.2 : 0)
		transform: Translate { id: translateCloud5 }
		CloudFront {
			cloudType: group.cloudType
		}
	}
}
