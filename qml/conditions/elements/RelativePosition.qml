import QtQuick 2.0

Item {
	property real relativePositionX: 0.0
	property real relativePositionY: 0.0

	width: 1
	height: childrenRect.height

	anchors.bottom: parent.top
	anchors.bottomMargin: -relativePositionY * parent.height
	anchors.left: parent.left
	anchors.leftMargin: relativePositionX * parent.width
}
