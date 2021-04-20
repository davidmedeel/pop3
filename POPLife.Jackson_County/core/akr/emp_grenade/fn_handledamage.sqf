/*
	File: fn_HandleDamage.sqf
	Author: Akryllax
	Desc: duuuuh
*/

private ["_unit", "_selectionName", "_damage", "_source", "_projectile", "_out"];

_unit 			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_selectionName 	= [_this, 1, "", [""]] call BIS_fnc_param;
_damage			= [_this, 2, -1, [-1]] call BIS_fnc_param;
_source			= [_this, 3, objNull, [objNull]] call BIS_fnc_param;
_projectile		= [_this, 4, "", [""]] call BIS_fnc_param;

_out = 0;

_string = format["Unit: %1\nSelection: %2\nDamage: %3\nSource: %4\nProjectile: %5", _unit, _selectionName, _damage, _source, _projectile];

hintSilent _string;
diag_log _string;

switch (_projectile) do {
	case "GrenadeHand": {
		_out = 0;
	};
	
	default {
		_out = _damage;
	};
};

_out