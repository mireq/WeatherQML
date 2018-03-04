import QtQuick 2.0

Item {
	id: root
	width: 480
	height: 480

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": true,
			"visibleItems": 2
		}
	}

	ListView {
		id: list
		model: conditionModel
		anchors.fill: parent
		delegate: ConditionDelegate {
			width: Math.round(list.width / 2)
		}
		snapMode: ListView.SnapOneItem
		orientation: ListView.Horizontal
		highlightRangeMode: ListView.StrictlyEnforceRange
		highlightMoveDuration: 1000
		focus: true
	}
}
