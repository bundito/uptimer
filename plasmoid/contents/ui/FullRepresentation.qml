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

	  	const regex = /.*up\ (.*:..),\ .*/g;
	  	const str = output;
	  	var m;

	  	m = regex.exec(str);
	  	console.log()

	  	if (m != null) {

	  		compactLabel.text = m[1];
	  	 }   
		

	
	  	
	  	uptimeData.connectedSources = [];
	  }
	}

	function update() {
		uptimeData.connectedSources = 'uptime';
		timer.interval = 1000 * 5;
	}

	Timer {
		id: timer
		interval: 1000
		running: true
		repeat: true
		onTriggered: update()

	}
}