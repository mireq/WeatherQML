import QtQuick 2.0

FadeElement {
	id: group

	width: 480
	height: 480
	anchors.fill: parent

	Image {
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.topMargin: group.height * 0.4
		source: "../../../images/rain_01.png"
	}
}
