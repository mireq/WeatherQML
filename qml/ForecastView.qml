import QtQuick 2.0

Item {
	id: forecast

	property string cityName: model ? model.name : "City"
	property bool isDay: model ? !model.isNight : true
	property real currentTemperature: model ? model.currentTemperature : 0.0
	property real minTemperature: model ? model.minTemperature : -0.5
	property real maxTemperature: model?  model.maxTemperature : 0.5
	property real scaling: Math.min(width / 400, height / 720)
	property string background: isDay ? 'day_clear' : 'night_clear'
	property bool initialized: false

	width: 480
	height: 480
	state: parent.state
	//state: model ? "up" : "down"

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
			font.pixelSize: Math.max(scaling * 40, 10)
			color: "white"
			horizontalAlignment: Text.AlignHCenter
		}

		Text {
			id: currentTemperatureText
			text: currentTemperature + " °C"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: scaling * 60
			font.pixelSize: Math.max(scaling * 100, 16)
			color: "white"
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: -scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Image {
				id: iconMin
				source: "../images/icon_min.png"
				width: iconMin.sourceSize.width * scaling
				height: iconMin.sourceSize.height * scaling
			}
			Text {
				text: minTemperature + " °C"
				font.pixelSize: Math.max(scaling * 30, 8)
				color: "white"
				anchors.left: iconMin.right
				anchors.leftMargin: scaling * 20
				anchors.verticalCenter: iconMin.verticalCenter
				opacity: .5
			}
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Text {
				id: maxTemperatureText
				text: maxTemperature + " °C"
				font.pixelSize: Math.max(scaling * 30, 8)
				color: "white"
				anchors.left: parent.left
				anchors.verticalCenter: iconMax.verticalCenter
				opacity: .5
			}
			Image {
				id: iconMax
				source: "../images/icon_max.png"
				width: iconMax.sourceSize.width * scaling
				height: iconMax.sourceSize.height * scaling
				anchors.left: maxTemperatureText.right
				anchors.leftMargin: scaling * 20
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
}
