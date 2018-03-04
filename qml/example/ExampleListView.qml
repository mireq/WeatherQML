import QtQuick 2.0

Item {
	id: select
	signal activated(string component)

	ListModel {
		id: model
		ListElement {
			name: "Simple Condition List"
			component: "SimpleWeatherList"
		}
		ListElement {
			name: "Conditions with fade background"
			component: "FadeBackground"
		}
		ListElement {
			name: "Multiple columns"
			component: "MultiColumnsList"
		}
	}

	Component {
		id: delegate

		Rectangle {
			width: ListView.view.width
			height: childrenRect.height
			color: "white"
			border.width: 1
			border.color: "#f0f0f0"

			Text {
				id: text
				anchors.left: parent.left
				anchors.top: parent.top
				anchors.right: parent.right
				anchors.margins: 16
				font.pixelSize: 20
				textFormat: Text.PlainText
				text: model.name
				elide: Text.ElideRight
				color: "#888"
			}

			MouseArea {
				width: parent.width
				height: text.height + (2*16)
				acceptedButtons: Qt.LeftButton
				onClicked: {
					select.activated(model.component);
				}
			}
		}
	}

	ListView {
		anchors.fill: parent
		model: model
		delegate: delegate
		spacing: -1
	}
}
