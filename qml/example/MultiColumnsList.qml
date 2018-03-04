import QtQuick 2.0

Item {
	id: root

	property int columnsCount: 2

	width: 480
	height: 480

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": true,
			"visibleItems": root.columnsCount
		}
	}

	/*
	ListView {
		id: backgroundList
		model: conditionModel
		anchors.fill: parent
		orientation: ListView.Horizontal
		interactive: false
		contentX: list.contentX
		cacheBuffer: 4
		delegate: ConditionBackgroundDelegate{
			width: Math.round(list.width / root.columnsCount)
		}
	}
	*/

	ListView {
		id: list
		model: conditionModel
		anchors.fill: parent
		delegate: ConditionDelegate {
			width: Math.round(list.width / root.columnsCount)
			clip: true
		}
		snapMode: ListView.SnapOneItem
		orientation: ListView.Horizontal
		highlightRangeMode: ListView.StrictlyEnforceRange
		highlightMoveDuration: 1000
		focus: true
	}
}
