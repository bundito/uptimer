import QtQuick 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQml.Models 2.2


Item {
	id: rect
	height: parent.height
	//color: theme.backgroundColor
	Layout.minimumWidth: theme.defaultFont.pixelSize * 7


	
	
	Label {
		//Layout.minimumHeight: parent.height
		id: fullLabel
		text: ""
		verticalAlignment: Text.AlignVCenter
		//anchors.horizontalCenter: rect.horizontalCenter
        color: theme.textColor
        height: rect.height
        anchors.fill: parent
       
		}


	PlasmaCore.DataSource {
		id: uptimeData
		engine: "executable"
		connectedSources: []
	  //connectedSources: ['/home/bundito/projects/xrx-output/plasmoid/contents/ui/parse-xrx-output.sh']
	  onNewData: {

	  	var ucArrow = "\u2191 ";

	  	var output = data.stdout;
	  	var regex;

	  	var regex = /.*up\ (.*:..),\ .*/g;
	  	var daysHoursMins;
		daysHoursMins = regex.exec(output);

		//console.log(daysHoursMins);

		if (daysHoursMins != null) {
			fullLabel.text = ucArrow + daysHoursMins[1];
		}	

		  	var regex = /.*up(.*min)/g;
		  	var daysHoursMins;
			daysHoursMins = regex.exec(output);

			//console.log(daysHoursMins);

			if (daysHoursMins != null) {
				fullLabel.text = ucArrow + daysHoursMins[1];
			}	

		var regex = /.*up\ (.. min),\ .*/g;
		var minsOnly;
		minsOnly = regex.exec(output);

	  
	  		
	  	if (minsOnly != null) {
	  		fullLabel.text = ucArrow + minsOnly[1];
	  	}
	  		// maybe up less than an hour
	  	
	  		
	  
	  	
	  	uptimeData.connectedSources = [];
	  }
	}

	function update() {
		uptimeData.connectedSources = 'uptime';
		timer.interval = 500;
	}

	Timer {
		id: timer
		interval: 500
		running: true
		repeat: true
		onTriggered: update()

	}
}