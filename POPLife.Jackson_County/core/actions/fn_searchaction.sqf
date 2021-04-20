/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
[_veh, "PatDown"] remoteexeccall ["life_fnc_say3D",-2];
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[player] remoteexeccall ["life_fnc_searchClient",_unit];
life_action_inUse = true;