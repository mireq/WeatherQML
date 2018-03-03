import QtQuick 2.0
import "../components"
import "elements"

ForecastView {
	id: condition
	background: isDay ? 'day_heavyrain' : 'night_rain'

	ConditionCanvas {
		RainElement {}
		CloudsElement { cloudType: "tstorm" }
	}
}
