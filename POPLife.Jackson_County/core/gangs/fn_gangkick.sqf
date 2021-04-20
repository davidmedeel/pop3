#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer setVariable["gang_members",_members,true];

[_unit,grpPlayer] remoteexeccall ["TON_fnc_clientGangKick",_unit];
[4,grpPlayer] remoteexeccall ["TON_fnc_updateGang",2];
[] call life_fnc_gangMenu;