import QtQuick 2.0

Item {
	id: root

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": true
		}
	}

	Component {
		id: weatherConditionDelegate
		Item {
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
	}
}
