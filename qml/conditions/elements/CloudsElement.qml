import QtQuick 2.0

Item {
	id: group

	property real scaling: condition.scaling
	property string cloudType: "cloud"
	property bool isolated: false

	width: 480
	height: 480
	anchors.fill: parent

	RelativePosition {
		relativePositionX: 0.18
		relativePositionY: 0.42
		CloudBack {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		relativePositionX: 0.9
		relativePositionY: 0.42
		CloudBack {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		relativePositionX: 0.35
		relativePositionY: 0.5 + (group.cloudType == "tstorm" ? 0.1 : 0)
		CloudMid {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		visible: !group.isolated
		relativePositionX: 0.7
		relativePositionY: 0.55 + (group.cloudType == "tstorm" ? 0.2 : 0)
		CloudFront {
			cloudType: group.cloudType
		}
	}

	RelativePosition {
		visible: !group.isolated
		relativePositionX: 0.1
		relativePositionY: 0.58 + (group.cloudType == "tstorm" ? 0.2 : 0)
		CloudFront {
			cloudType: group.cloudType
		}
	}
}
