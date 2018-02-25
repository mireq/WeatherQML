import QtQuick 2.9
import QtQuick.Window 2.2

Window {
	id: window
	visible: true
	width: 480
	height: 480
	title: qsTr("Weather")

	property real scaling: Math.min(width / 960, height / 960)
	property real baseSize: scaling * 960


	ConditionModel {
		id: conditionModel
	}
	MainView {
		id: mainView
		anchors.fill: parent
	}
}
