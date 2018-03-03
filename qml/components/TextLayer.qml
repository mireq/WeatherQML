import QtQuick 2.0

Item {
	id: text

	property string cityName: model.name
	property real currentTemperature: model.currentTemperature
	property real minTemperature: model.minTemperature
	property real maxTemperature: model.maxTemperature
	property real scaling: Math.min(width / 400, height / 720)
	property color textColor: "white"

	width: 480
	height: 480


	Item {
		id: textLayer
		z: 1
		anchors.fill: parent
		anchors.margins: parent.height / 20

		Text {
			text: text.cityName
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
			elide: Text.ElideRight
			textFormat: Text.PlainText
			font.bold: true
			font.pixelSize: Math.max(text.scaling * 40, 10)
			color: text.textColor
			horizontalAlignment: Text.AlignHCenter
		}

		Text {
			id: currentTemperatureText
			text: text.currentTemperature + " °C"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: text.scaling * 60
			font.pixelSize: Math.max(text.scaling * 100, 16)
			color: text.textColor
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: -text.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Image {
				id: iconMin
				source: "../images/icon_min.png"
				width: iconMin.sourceSize.width * text.scaling
				height: iconMin.sourceSize.height * text.scaling
			}
			Text {
				text: text.minTemperature + " °C"
				font.pixelSize: Math.max(text.scaling * 30, 8)
				color: text.textColor
				anchors.left: iconMin.right
				anchors.leftMargin: text.scaling * 20
				anchors.verticalCenter: iconMin.verticalCenter
				opacity: .5
			}
		}

		Item {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.horizontalCenterOffset: text.scaling * 150
			anchors.bottom: parent.bottom
			width: childrenRect.width
			height: childrenRect.height
			Text {
				id: maxTemperatureText
				text: text.maxTemperature + " °C"
				font.pixelSize: Math.max(text.scaling * 30, 8)
				color: text.textColor
				anchors.left: parent.left
				anchors.verticalCenter: iconMax.verticalCenter
				opacity: .5
			}
			Image {
				id: iconMax
				source: "../images/icon_max.png"
				width: iconMax.sourceSize.width * text.scaling
				height: iconMax.sourceSize.height * text.scaling
				anchors.left: maxTemperatureText.right
				anchors.leftMargin: text.scaling * 20
			}
		}
	}
}
