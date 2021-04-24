
#include "..\..\script_macros.hpp"

private ["_curTarget","_vehicle","_nearVehicles"];

_curTarget = cursorTarget;
_vehicle = cursorTarget;

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if(!isNull _curTarget) then {

	if(!(_vehicle in life_vehicles)) then
	{
		life_vehicles set[count life_vehicles,_vehicle];
	};


} else {

	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship","Truck"],10];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {};

				if(!(_x in life_vehicles)) then
					{
					life_vehicles set[count life_vehicles,_x];
					};

		} foreach _nearVehicles;
	};
};

cutText[format["Has sacado las llaves de ---> %1",_vehicle],"PLAIN DOWN"];

["Admin Log",format ["%1 - (%2) ha utilizado la función llaves",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
