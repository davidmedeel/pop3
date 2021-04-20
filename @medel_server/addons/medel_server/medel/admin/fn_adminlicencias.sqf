
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

private	["_vehicle","_data"];

_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Motorcycle")|| !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle;};
	life_action_inUse = true;
	hint localize "STR_NOTF_Searching";
	life_action_inUse = false;
	if(player distance _vehicle > 150 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};
	_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "No owners, impound it<br/>";
	};
	hint parseText format[localize "STR_NOTF_SearchVeh",_owners];
};

["Admin Log",format ["%1 - (%2) ha utilizado la funcion licencias",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
