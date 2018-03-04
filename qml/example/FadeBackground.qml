import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../components"

Item {
	id: root
	width: 480
	height: 480

	function getConditionProperties() {
		return {
			"state": "up",
			"backgroundVisible": false
		}
	}

	states: [
		State {
			name: ""
			PropertyChanges { target: panelTransform; x: infoPanel.width }
			PropertyChanges { target: blur; x: -infoPanel.width }
		},
		State {
			name: "info"
			PropertyChanges { target: panelTransform; x: 0 }
			PropertyChanges { target: blur; x: 0 }
		}
	]

	transitions: [
		Transition {
			NumberAnimation { properties: "x"; easing.type: Easing.InOutCubic; duration: 400 }
		}
	]

	Item {
		anchors.fill: parent
		id: content
		CrossFade {
			id: fade
			anchors.fill: parent
			duration: 1000
		}

		Component {
			id: backgroundComponent
			Image {
				id: image
				anchors.fill: parent
				anchors.leftMargin: -0.18 * (parent ? parent.width : 1)
			}
		}

		ListView {
			id: list
			model: conditionModel
			anchors.fill: parent
			delegate: ConditionDelegate {}
			snapMode: ListView.SnapOneItem
			orientation: ListView.Horizontal
			highlightRangeMode: ListView.StrictlyEnforceRange
			highlightMoveDuration: 1000
			focus: true
			onCurrentItemChanged: {
				if (currentItem) {
					var source = "../images/bg_" + currentItem.item.background + ".png"
					var instance = backgroundComponent.createObject(fade, {"source": source, "opacity": 0});
					fade.fade(instance);
				}
			}
		}
	}

	Image {
		id: info
		source: "../images/info.png"
		fillMode: Image.PreserveAspectFit
		width: parent.width / 16
		height: parent.width / 16
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.margins: parent.height / 20
		MouseArea {
			id: infoButton
			anchors.fill: parent
			acceptedButtons: Qt.LeftButton
			onClicked: {
				root.state = 'info';
			}
		}
	}

	Item {
		id: infoPanel
		anchors.top: parent.top
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		width: Math.max(400, parent.width / 4)
		transform: Translate { id: panelTransform; x: infoPanel.width }
		ShaderEffectSource {
			id: blurSource
			width: parent.width
			height: parent.height
			sourceItem: content
			sourceRect: Qt.rect(content.width - infoPanel.width, 0, infoPanel.width, infoPanel.height)
		}

		Item {
			anchors.fill: parent
			clip: true
			FastBlur {
				id: blur
				x: -infoPanel.width
				y: 0
				width: parent.width
				height: parent.height
				source: blurSource
				radius: 32
			}
		}

		Rectangle {
			anchors.fill: parent
			anchors.margins: -1
			color: "#40000000"
			border.width: 1
			border.color: "#20ffffff"
		}

		Flickable {
			anchors.fill: parent
			anchors.margins: 1
			flickableDirection: Flickable.VerticalFlick

			Column {
				anchors.left: parent.left
				anchors.right: parent.right
				anchors.top: parent.top
				anchors.margins: 16
				spacing: 16

				Text {
					anchors.left: parent.left
					anchors.right: parent.right
					font.bold: true
					font.pointSize: 18
					color: "white"
					text: "About app"
					horizontalAlignment: Text.AlignHCenter

					Rectangle {
						anchors.left: parent.left
						anchors.right: parent.right
						anchors.top: parent.top
						anchors.bottom: parent.bottom
						anchors.margins: -16
						color: "#40000000"
						z: -1
					}
				}

				Rectangle {
					anchors.left: parent.left
					anchors.right: parent.right
					anchors.leftMargin: -16
					anchors.rightMargin: -16
					color: "#20ffffff"
					height: 1
				}

				InfoText {
					text: "Welcome to <i>Weather demo</i>. This application is port of <a href=\"https://github.com/Bluebugs/freebox-elixir\">freebox-elixir</a> to Qt 5."
				}

				InfoText {
					text: "This software is open source. Source code is distributed under MIT license. Images are from freebox-elixir project (distributed under GPL 2/3 license)."
				}
			}
		}
	}
}
