import QtQuick 2.0

Item {
	id: root
	width: 480
	height: 480

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": true
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
	}
}
