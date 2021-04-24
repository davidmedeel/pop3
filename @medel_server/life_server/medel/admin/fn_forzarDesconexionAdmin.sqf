
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

private ["_param", "_tio"];

_tio = param [0];

if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; 
    hint parsetext
    "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
    <br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if ((isNull _tio) OR (isNil {_tio})) exitWith {};

if (!isNil "particulaCabeza") then { // tengo las partículas de admin
	deleteVehicle particulaCabeza;
	particulaCabeza = nil;
};

["Kick",false,false] remoteexeccall ['BIS_fnc_endMission', _tio];
_nombre = name _tio; // definimos variables
hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Has forzado la desconexion de %1.</t>", _nombre];

["Admin Log",format ["%1 - (%2) ha forzado la desconexion a %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
