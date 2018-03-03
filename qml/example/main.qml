import QtQuick 2.9
import QtQuick.Window 2.2

Window {
	id: window
	visible: true
	width: 480
	height: 480
	title: qsTr("Weather")

	ConditionModel {
		id: conditionModel
	}
	MainView {
		id: mainView
		anchors.fill: parent
	}
}
