
/*
por: Medel
*/

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "
0 spawn ica_fnc_talando;

_this spawn { 

	ClicksPerSecond = ClicksPerSecond + 1; clickingstarted = true; 

	if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;}; 
	
	uisleep 1; 
	ClicksPerSecond = ClicksPerSecond - 1; 
	if(ClicksPerSecond >= 17 && clickingstarted) then { 

		clickingstarted = false; 
	
	  	if((lastLogging + 17) < time) then { 

	    	lastLogging = time; 
	
	    	_msg = format ['%1 - (%2) esta usando macros o autoclick ---> %3  clicks', profileName, (getPlayerUID player), ClicksPerSecond];
	
	    	['Macros Log',_msg] remoteexeccall ['ica_fnc_customlog',2];

			[_msg] remoteexeccall ['systemchat', 0];
	
	    	endMission 'autoclick'; 
	
		};
	};

	if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;}; 
};"];
