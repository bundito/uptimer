import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.kquickcontrolsaddons 2.0

Item {

	id: main

//	Plasmoid.preferredRepresentation: isConstrained() ? Plasmoid.compactRepresentation : Plasmoid.fullRepresentation

	Plasmoid.compactRepresentation: CompactRepresentation {}
//	Plasmoid.fullRepresentation: FullRepresentation {}
   //Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

	function isConstrained() {
		return (plasmoid.formFactor == PlasmaCore.Types.Vertical || plasmoid.formFactor == PlasmaCore.Types.Horizontal);
	}

	property int interval;

} // end Item