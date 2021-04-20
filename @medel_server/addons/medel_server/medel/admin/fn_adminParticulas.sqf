
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if (isNil "modoAdmin") then {
	["Admin Log",format ["%1 - (%2) ha activado la funcion fuego",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	// LeavesFall, SmallFireBarrel
	player allowDamage false;
	modoAdmin = true;

	particulaCabeza = "#particlesource" createVehicle (getMarkerPos "");
	particulaCabeza setParticleClass "SmallFireBarrel";
	particulaCabeza setParticleFire [0,0,0];
	particulaCabeza attachto [player, [0,0,0.15], "head"];

} else {
	["Admin Log",format ["%1 - (%2) ha desactivado la funcion fuego",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	player allowDamage true;
	modoAdmin = nil;

	deleteVehicle particulaCabeza;
	particulaCabeza = nil;
};
