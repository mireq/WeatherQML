import QtQuick 2.0

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
