import QtQuick 2.7

RelativePosition {
	id: flake

	property string variant: ""

	width: childrenRect.width
	height: childrenRect.height

	Image {
		id: image
		width: image.sourceSize.width * condition.scaling
		height: image.sourceSize.height * condition.scaling
		source: flake.variant ? "../../../images/snow_flake_" + variant + ".png" : "../../../images/snow_flake.png"
		smooth: true
		antialiasing: true
		mipmap: true
	}
}
