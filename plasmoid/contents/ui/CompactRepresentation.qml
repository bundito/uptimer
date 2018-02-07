import QtQuick 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQml.Models 2.2

Item {

	Label {
		id: compactLabel
		text: "forever"
	}

	PlasmaCore.DataSource {
		id: uptimeData
		engine: "executable"
		connectedSources: []
	  //connectedSources: ['/home/bundito/projects/xrx-output/plasmoid/contents/ui/parse-xrx-output.sh']
	  onNewData: {
	  	var output = data.stdout;
	  	compactLabel.text = output;
	  	uptimeData.connectedSources = [];
	  }
	}

	function update() {
		uptimeData.connectedSources = 'uptime';
	}

	Timer {
		id: timer
		interval: 1000
		running: true
		repeat: true
		onTriggered: updata()

	}


}