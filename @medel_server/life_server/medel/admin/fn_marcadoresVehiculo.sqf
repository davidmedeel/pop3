
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

	adminVehicleMarkers = {
		while {markadVehicleMarker == 1} do {
			{
				_typename = gettext (configFile >> 'CfgVehicles' >> typeOf _x >> 'displayName');
				_xPos = getPos _x;
				
				_cm = ('adminVehicleMarkers' + (str _forEachIndex));
				_pos = getMarkerPos _cm;
				if((_pos select 0 != _xPos select 0) || (_pos select 1 != _xPos select 1))then
				{
					deleteMarkerLocal _cm;
					_vm = createMarkerLocal [_cm,_xPos];
					_vm setMarkerDirLocal (getDir _x);
					_vm setMarkerTypeLocal 'mil_start';
					_vm setMarkerColorLocal 'ColorBlue';
					_vm setMarkerTextLocal format['%1',_typename];
				};
				if(markadVehicleMarker == 0) exitWith{};
			} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);
			if(markadVehicleMarker == 0) exitWith {};
			uiSleep 1;
			if(markadVehicleMarker == 0) exitWith {};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
	};
if(isNil 'markadVehicleMarker') then {markadVehicleMarker = 0;};

if(markadVehicleMarker == 0) then {
	hint "Marcadores de Vehiculos activados";

    ["Admin Log",format ["%1 - (%2) ha activado la funcion Marcadores de Vehículo",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];

	markadVehicleMarker = 1;
	[] spawn adminVehicleMarkers;
} else {
	hint "Marcadores de Vehiculos desactivados";

    ["Admin Log",format ["%1 - (%2) ha desactivado la funcion Marcadores de Vehículo",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];

	markadVehicleMarker = 0;
	for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
};
