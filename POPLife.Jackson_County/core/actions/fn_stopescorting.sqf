/*
	File: fn_stopEscorting.sqf

	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "Escorting")) exitWith {}; //He's not being Escorted.
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting",false,true];
player setVariable ["currentlyEscorting",nil];
player setVariable ["isEscorting",false];
