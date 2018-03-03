import QtQuick 2.0

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

	Item {
		anchors.fill: parent
		clip: true
		Image {
			id: image
			anchors.fill: parent
			anchors.leftMargin: -0.18 * parent.width
		}
	}

	Component {
		id: weatherConditionDelegate
		Item {
			property alias item: weatherLoader.item

			width: ListView.view.width
			height: ListView.view.height

			Loader {
				id: weatherLoader

				anchors.fill: parent

				onStatusChanged: {
					if (status == Loader.Error) {
						weatherLoader.setSource("../conditions/Unknown.qml", getConditionProperties());
					}
				}
			}

			Component.onCompleted: {
				weatherLoader.setSource("../conditions/" + model.weather + ".qml", getConditionProperties());
			}
		}
	}

	ListView {
		id: list
		model: conditionModel
		anchors.fill: parent
		delegate: weatherConditionDelegate
		snapMode: ListView.SnapOneItem
		orientation: ListView.Horizontal
		highlightRangeMode: ListView.StrictlyEnforceRange
		focus: true
		onCurrentItemChanged: {
			if (currentItem) {
				image.source = "../images/bg_" + currentItem.item.background + ".png"
			}
		}
	}
}
