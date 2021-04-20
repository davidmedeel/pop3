/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query = format["GetPlayerHouses:%1",_this];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

if(count _houses == 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestObject _pos;
	
	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} foreach _houses;