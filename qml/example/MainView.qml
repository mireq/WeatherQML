import QtQuick 2.0

Item {
	id: root

	Component {
		id: weatherConditionDelegate
		Loader {
			id: weatherLoader

			width: ListView.view.width
			height: ListView.view.height
			source: "../conditions/" + model.weather + ".qml"
			state: "up"

			onStatusChanged: {
				if (status == Loader.Error) {
					source = "../conditions/Unknown.qml";
				}
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
	}
}
