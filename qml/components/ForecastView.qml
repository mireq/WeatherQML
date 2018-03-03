import QtQuick 2.0

Item {
	id: forecast

	property bool isDay: !model.isNight
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

	TextLayer {
		anchors.fill: parent;
		cityName: model.name
		currentTemperature: model.currentTemperature
		minTemperature: model.minTemperature
		maxTemperature: model.maxTemperature
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
