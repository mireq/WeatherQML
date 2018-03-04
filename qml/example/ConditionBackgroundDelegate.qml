import QtQuick 2.0

Item {
	width: ListView.view.width
	height: ListView.view.height

	Image {
		id: background
		anchors.fill: parent
		anchors.leftMargin: -0.18 * parent.width
		source: "../images/bg_day_clear.png"
	}
}
