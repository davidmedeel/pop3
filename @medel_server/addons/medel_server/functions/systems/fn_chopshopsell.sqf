/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
private["_unit","_vehicle","_price","_cash"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;

//Error checks
if(isNull _vehicle OR isNull _unit) exitWith
{
	["life_action_inuse",false] remoteexeccall ["life_fnc_netSetVar",0];
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_unit = owner _unit;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;

	_query = format["SetAliveVehicleByPidPlate:0:%1:%2",_uid,_plate];
	waitUntil {!DB_Async_Active};
	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
["life_action_inUse",false] remoteexeccall ["life_fnc_netSetVar",_unit];

["medel_din",_cash] remoteexeccall ["life_fnc_netSetVar",_unit];

	["Money Log",format [
	"%1 - (%2) ha vendido un coche por %3 - Dinero en banco : %4 - Dinero en mano %5",
	 profileName,
	(getPlayerUID player),
	_cash,
	medel_atmdin,
	medel_din
	]
	] remoteexeccall ["ica_fnc_customlog",2];
	
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call life_fnc_numberText]] remoteexeccall ["life_fnc_broadcast",_unit];