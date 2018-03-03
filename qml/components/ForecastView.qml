import QtQuick 2.0

Item {
	id: forecast

	property string cityName: model.name
	property bool isDay: !model.isNight
	property real currentTemperature: model.currentTemperature
	property real minTemperature: model.minTemperature
	property real maxTemperature: model.maxTemperature
	property real scaling: Math.min(width / 400, height / 720)
	property string background: isDay ? 'day_clear' : 'night_clear'
	property bool initialized: false

	width: 480
	height: 480
	state: "down"

	states: [
		State {
			name: "up"
		},
		State {
			name: "down"
		}
	]

	Item {
		anchors.fill: parent
		clip: true

		Image {
			anchors.fill: parent
			anchors.leftMargin: -0.18 * parent.width
			source: "../images/bg_" + forecast.background + ".png"
		}
	}

	Item {
		id: textLayer
		z: 1
		anchors.fill: parent
		anchors.margins: parent.height / 20

		Text {
			text: forecast.cityName
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
			elide: Text.ElideRight
			textFormat: Text.PlainText
			font.bold: true
			font.pixelSize: Math.max(forecast.scaling * 40, 10)
			color: "white"
			horizontalAlignment: Text.AlignHCenter
		}

		Text {
			id: currentTemperatureText
			text: forecast.currentTemperature + " °C"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: forecast.scaling * 60
			font.pixelSize: Math.max(forecast.scaling * 100, 16)
			color: "white"
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: -forecast.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Image {
				id: iconMin
				source: "../images/icon_min.png"
				width: iconMin.sourceSize.width * forecast.scaling
				height: iconMin.sourceSize.height * forecast.scaling
			}
			Text {
				text: forecast.minTemperature + " °C"
				font.pixelSize: Math.max(forecast.scaling * 30, 8)
				color: "white"
				anchors.left: iconMin.right
				anchors.leftMargin: forecast.scaling * 20
				anchors.verticalCenter: iconMin.verticalCenter
				opacity: .5
			}
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: forecast.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Text {
				id: maxTemperatureText
				text: forecast.maxTemperature + " °C"
				font.pixelSize: Math.max(forecast.scaling * 30, 8)
				color: "white"
				anchors.left: parent.left
				anchors.verticalCenter: iconMax.verticalCenter
				opacity: .5
			}
			Image {
				id: iconMax
				source: "../images/icon_max.png"
				width: iconMax.sourceSize.width * forecast.scaling
				height: iconMax.sourceSize.height * forecast.scaling
				anchors.left: maxTemperatureText.right
				anchors.leftMargin: forecast.scaling * 20
			}
		}
	}

	Binding {
		target: forecast
		property: 'state'
		value: model.index === list.currentIndex ? "down" : "up"
		when: forecast.initialized
	}

	Timer {
		interval: 1
		repeat: false
		running: true
		onTriggered: {
			forecast.initialized = true;
		}
	}
	/*
	property string cityName: model.name
	property bool isDay: !model.isNight
	property real currentTemperature: model.currentTemperature
	property real minTemperature: model.minTemperature
	property real maxTemperature: model.maxTemperature
	property real forecast.scaling: Math.min(width / 400, height / 720)
	property string background: isDay ? 'day_clear' : 'night_clear'
	property bool initialized: false

	width: 480
	height: 480
	state: parent.state

	states: [
		State {
			name: "up"
		},
		State {
			name: "down"
		}
	]

	Item {
		anchors.fill: parent
		clip: true

		Image {
			anchors.fill: parent
			anchors.leftMargin: -0.18 * parent.width
			source: "../images/bg_" + background + ".png"
		}
	}

	Item {
		id: textLayer
		z: 1
		anchors.fill: parent
		anchors.margins: parent.height / 20
		Text {
			text: cityName
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
			elide: Text.ElideRight
			textFormat: Text.PlainText
			font.bold: true
			font.pixelSize: Math.max(forecast.scaling * 40, 10)
			color: "white"
			horizontalAlignment: Text.AlignHCenter
		}

		Text {
			id: currentTemperatureText
			text: currentTemperature + " °C"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: forecast.scaling * 60
			font.pixelSize: Math.max(forecast.scaling * 100, 16)
			color: "white"
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: -forecast.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Image {
				id: iconMin
				source: "../images/icon_min.png"
				width: iconMin.sourceSize.width * forecast.scaling
				height: iconMin.sourceSize.height * forecast.scaling
			}
			Text {
				text: minTemperature + " °C"
				font.pixelSize: Math.max(forecast.scaling * 30, 8)
				color: "white"
				anchors.left: iconMin.right
				anchors.leftMargin: forecast.scaling * 20
				anchors.verticalCenter: iconMin.verticalCenter
				opacity: .5
			}
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: forecast.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Text {
				id: maxTemperatureText
				text: maxTemperature + " °C"
				font.pixelSize: Math.max(forecast.scaling * 30, 8)
				color: "white"
				anchors.left: parent.left
				anchors.verticalCenter: iconMax.verticalCenter
				opacity: .5
			}
			Image {
				id: iconMax
				source: "../images/icon_max.png"
				width: iconMax.sourceSize.width * forecast.scaling
				height: iconMax.sourceSize.height * forecast.scaling
				anchors.left: maxTemperatureText.right
				anchors.leftMargin: forecast.scaling * 20
			}
		}
	}

	Binding {
		target: forecast
		property: 'state'
		value: model.index === list.currentIndex ? "down" : "up"
		when: forecast.initialized
	}

	Timer {
		interval: 1
		repeat: false
		running: true
		onTriggered: {
			forecast.initialized = true;
		}
	}
	*/
}
