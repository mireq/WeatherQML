import QtQuick 2.0

Item {
	id: hmm
	property string wow: model.name

	Text{
		text: hmm.wow
	}
}
