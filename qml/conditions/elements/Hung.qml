import QtQuick 2.7

Item {
	id: item1
	property string hungName: "../../images/cloud_cloud_1_line.png"
	property string imageName:  "../../images/cloud_cloud_1.png"
	property real lineOffsetX: 0.443
	property real lineOffsetY: 0.057

	width: childrenRect.width
	height: childrenRect.height
	anchors.horizontalCenter: parent.horizontalCenter

	Image {
		id: hung
		width: hung.sourceSize.width * condition.scaling
		height: hung.sourceSize.height * condition.scaling
		source: hungName
		anchors.left: image.left
		anchors.leftMargin: image.width * lineOffsetX
		smooth: true
		antialiasing: true
		mipmap: true
	}

	Image {
		id: image
		width: image.sourceSize.width * condition.scaling
		height: image.sourceSize.height * condition.scaling
		source: imageName
		anchors.top: hung.bottom
		anchors.topMargin: -(image.height * lineOffsetY)
		smooth: true
		antialiasing: true
		mipmap: true
	}
}
