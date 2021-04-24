
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if (isNil "vehGod") then {
	if (vehicle player isEqualTo player) exitWith {["decorado", "AVISO", "No estás en ningún vehículo"] spawn ica_fnc_hint;};
	["Admin Log",format ["%1 - (%2) ha activado la funcion God Mode Veh",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	vehicle player allowDamage false;
	vehGod = true;
	["decorado", "ADMIN", "God Mode Veh activado"] spawn ica_fnc_hint;
} else {
	if (vehicle player isEqualTo player) exitWith {["decorado", "AVISO", "No estás en ningún vehículo"] spawn ica_fnc_hint;};
	["Admin Log",format ["%1 - (%2) ha desactivado la funcion God Mode Veh",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	vehicle player allowDamage true;
	vehGod = nil;
	["decorado", "ADMIN", "God Mode Veh desactivado"] spawn ica_fnc_hint;
};
