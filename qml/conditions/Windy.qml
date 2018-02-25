import QtQuick 2.0
import ".."
import "elements"

ForecastView {
	id: condition

	HazeElement { anchors.bottom: canvas.bottom; anchors.top: canvas.top }

	ConditionCanvas {
		id: canvas
		LightElement {}
		CloudsElement { isolated: true }
	}
}
