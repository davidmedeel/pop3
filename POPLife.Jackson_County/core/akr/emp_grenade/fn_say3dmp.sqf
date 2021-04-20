/*
	File: fn_say3DMP.sqf
	Author: Akryllax
	Desc:
*/

private ["_name"];

_name = [_this, 0, "", [""]] call BIS_fnc_param;
_source = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

_source say3D _name;