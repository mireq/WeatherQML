import QtQuick 2.0

Item {
	id: fade

	property var items: []
	property Item current
	property int duration: 300

	width: 480
	height: 480

	Component {
		id: fader

		Item {
			id: container

			property int duration: fade.duration
			property alias animating: animation.running

			anchors.fill: parent
			opacity: 0

			function forceShow() {
				container.state = "";
				container.duration = 0;
				container.state = "visible";
				container.duration = Qt.binding(function() { return fade.duration });
			}

			states: [
				State {
					name: "visible"
					PropertyChanges { target: container; opacity: 1 }
				},
				State {
					name: "hidden"
					PropertyChanges { target: container; opacity: 0 }
				}
			]

			transitions: [
				Transition {
					id: animation
					NumberAnimation {
						properties: "opacity";
						easing.type: Easing.Bezier;
						duration: container.duration
					}
					onRunningChanged: {
						if (!running) {
							garbageCollect();
						}
					}
				}
			]
		}
	}

	function fade(component) {
		var faderComponent = fader.createObject(fade, {"state": fade.current ? "hidden" : "visible"});
		component.parent = faderComponent;
		fade.items.push(faderComponent);
		fade.current = faderComponent;
		component.opacity = 1;
		faderComponent.state = "visible";
	}

	function garbageCollect() {
		var item = fade.items[0];
		while (fade.items.length > 1 && item.state === "visible" && item.animating === false) {
			fade.items.shift();
			item.destroy();
			item = fade.items[0];
		}
	}
}
