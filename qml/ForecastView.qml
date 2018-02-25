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
