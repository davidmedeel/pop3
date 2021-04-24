
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

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if ((isNull _tio) OR (isNil {_tio})) exitWith {};

_tio moveInAny (vehicle player);

_nombre = name _tio; // definimos variables
hint format ["Has movido a %1 a tu vehículo", _nombre];

["Admin Log",format ["%1 - (%2) ha teletransportado a %3 a su vehículo",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
