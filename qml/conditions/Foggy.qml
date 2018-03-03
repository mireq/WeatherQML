import QtQuick 2.0
import "../components"
import "elements"

ForecastView {
	id: condition
	background: isDay ? 'day_rain' : 'night_rain'

	FoggyElement { anchors.bottom: canvas.bottom; anchors.top: canvas.top }

	ConditionCanvas {
		id: canvas
		LightElement { delay: 300 }
	}
}
