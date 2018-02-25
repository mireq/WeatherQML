import QtQuick 2.0
import ".."
import "elements"

ForecastView {
	id: condition
	background: isDay ? 'day_rain' : 'night_rain'

	ConditionCanvas {
		RainElement {}
		CloudsElement { cloudType: "rain" }
	}
}
