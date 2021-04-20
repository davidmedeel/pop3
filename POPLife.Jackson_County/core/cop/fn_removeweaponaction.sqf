/*
	File: fn_removeWeaponAction.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Desc:
	Search for weapons
*/

private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Busqueda de Armas";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Trop loin, ne peut fouiller cette personne."};
[player] remoteexeccall ["life_fnc_removeWeapons",_unit];
life_action_inUse = false;