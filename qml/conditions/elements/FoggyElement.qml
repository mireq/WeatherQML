import QtQuick 2.0

FadeElement {
	id: group

	width: 480
	height: 480
	anchors.fill: parent
	clip: true

	Image {
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.top: parent.top
		anchors.bottom: parent.bottom
		anchors.leftMargin: -0.2 * group.width
		source: "../../images/fog.png"
	}
}
