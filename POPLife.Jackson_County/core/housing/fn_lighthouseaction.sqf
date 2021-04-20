/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!((typeOf _house) in listaCasas)) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	[_house,true] remoteexeccall ["life_fnc_lightHouse",-2];
} else {
	[_house,false] remoteexeccall ["life_fnc_lightHouse",-2];
};