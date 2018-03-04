import QtQuick 2.0
import QtQuick.Window 2.2

Window {
	id: window
	visible: true
	width: 480
	height: 480
	title: qsTr("Weather")

	ConditionModel {
		id: conditionModel
	}

	Item {
		id: view
		anchors.fill: parent
		transform: Translate { id: transform }

		states: [
			State {
				name: "list"
				PropertyChanges { target: transform; x: 0 }
				PropertyChanges { target: listView; focus: true }
				PropertyChanges { target: back; opacity: 0 }
				PropertyChanges { target: backButton; enabled: false }
			},
			State {
				name: "detail"
				PropertyChanges { target: transform; x: -view.width }
				PropertyChanges { target: detailLoader; focus: true }
				PropertyChanges { target: back; opacity: 1 }
				PropertyChanges { target: backButton; enabled: true }
			}
		]

		transitions: [
			Transition {
				NumberAnimation { properties: "x"; easing.type: Easing.InOutCubic; duration: 400 }
				NumberAnimation { properties: "opacity"; easing.type: Easing.InOutCubic; duration: 300 }
			}
		]

		ExampleListView {
			id: listView
			anchors.fill: parent
			focus: true

			Keys.onEscapePressed: {
				window.close();
			}

			onActivated: {
				view.state = "detail";
				detailLoader.source = component + ".qml";
			}
		}

		Item {
			transform: Translate { x: view.width }
			anchors.fill: parent
			clip: true
			Loader {
				id: detailLoader
				anchors.fill: parent
				Keys.onEscapePressed: {
					view.state = "list";
				}
			}
		}

		Component {
			id: component
			Rectangle {
				anchors.fill: parent
				transform: Translate { x: parent.width }
			}
		}
	}

	Image {
		id: back
		source: "../images/back.png"
		fillMode: Image.PreserveAspectFit
		width: parent.width / 16
		height: parent.width / 16
		anchors.left: parent.left
		anchors.top: parent.top
		anchors.margins: parent.height / 20
		opacity: 0
		MouseArea {
			id: backButton
			anchors.fill: parent
			acceptedButtons: Qt.LeftButton
			enabled: false
			onClicked: {
				view.state = "list";
			}
		}
	}
}
