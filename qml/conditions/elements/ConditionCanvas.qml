import QtQuick 2.0

Item {
	height: Math.min(condition.height, 720*condition.scaling)
	width: Math.min(condition.width, condition.height * 1.25)
	anchors.horizontalCenter: parent.horizontalCenter
}
