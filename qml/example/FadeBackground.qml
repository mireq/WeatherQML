import QtQuick 2.0
import "../components"

Item {
	id: root
	width: 480
	height: 480

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": false
		}
	}

	CrossFade {
		id: fade
		anchors.fill: parent
		duration: 1000
	}

	Component {
		id: backgroundComponent
		Image {
			id: image
			anchors.fill: parent
			anchors.leftMargin: -0.18 * (parent ? parent.width : 1)
		}
	}

	ListView {
		id: list
		model: conditionModel
		anchors.fill: parent
		delegate: ConditionDelegate {}
		snapMode: ListView.SnapOneItem
		orientation: ListView.Horizontal
		highlightRangeMode: ListView.StrictlyEnforceRange
		highlightMoveDuration: 1000
		focus: true
		onCurrentItemChanged: {
			if (currentItem) {
				var source = "../images/bg_" + currentItem.item.background + ".png"
				var instance = backgroundComponent.createObject(fade, {"source": source, "opacity": 0});
				fade.fade(instance);
			}
		}
	}

	Image {
		id: info
		source: "../images/info.png"
		fillMode: Image.PreserveAspectFit
		width: parent.width / 10
		height: parent.width / 10
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.margins: parent.height / 20
		MouseArea {
			id: infoButton
			anchors.fill: parent
			acceptedButtons: Qt.LeftButton
			onClicked: {
			}
		}
	}
}
