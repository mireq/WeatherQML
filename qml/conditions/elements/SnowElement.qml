import QtQuick 2.0

FadeElement {
	id: group

	width: 480
	height: 480
	anchors.fill: parent

	SnowFlake { relativePositionY: 0.6; relativePositionX: 0.35}
	SnowFlake { variant: "01"; relativePositionY: 0.58; relativePositionX: 0.45 }
	SnowFlake { variant: "02"; relativePositionY: 0.65; relativePositionX: 0.75 }
	SnowFlake { variant: "03"; relativePositionY: 0.65; relativePositionX: 0.2 }
	SnowFlake { variant: "04"; relativePositionY: 0.7; relativePositionX: 0.27 }
	SnowFlake { variant: "05"; relativePositionY: 0.72; relativePositionX: 0.5 }
	SnowFlake { variant: "06"; relativePositionY: 0.7; relativePositionX: 0.9 }
	SnowFlake { variant: "07"; relativePositionY: 0.75; relativePositionX: 0.78 }
	SnowFlake { variant: "08"; relativePositionY: 0.78; relativePositionX: 0.15 }
	SnowFlake { variant: "09"; relativePositionY: 0.7; relativePositionX: 0.6 }
}
