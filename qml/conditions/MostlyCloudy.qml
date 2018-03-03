import QtQuick 2.0
import "../components"
import "elements"

ForecastView {
	id: condition

	ConditionCanvas {
		LightElement {}
		CloudsElement {}
	}
}
