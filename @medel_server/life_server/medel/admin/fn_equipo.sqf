
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

private ["_param", "_tio", "_modo", "_arrTemp", "_arrFin", "_class", "_can", "_ammo", "_maxCount", "_muni"];

_tio = param [0];

if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; 
    hint parsetext
    "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
    <br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if ((isNull _tio) OR (isNil {_tio})) exitWith {};

removeGoggles _tio;
removeHeadgear _tio;
removeUniform _tio;
removeVest _tio;
removeBackpackGlobal _tio;

if (local _tio) then {	
	removeAllWeapons _tio;
} else {
	[_tio] remoteexec ["removeAllWeapons", _tio];
};

{_tio removeMagazine _x} foreach (magazines _tio);
{
if !(_x isEqualTo "ItemMap") then {
	_tio unassignItem _x;
	_tio removeItem _x;
};
} foreach (assignedItems _tio);

_nombre = name _tio; // definimos variables

hint format ["Has dejado en bolas a %1", _nombre];

["Admin Log",format ["%1 - (%2) ha dejado en bolas a %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
