
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

_nombre = name _tio;

["Admin Log",format ["%1 - (%2) ha expulsado a %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];

hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>El jugador %1 será expulsado en 5 segundos.</t>", _nombre];

if (!isNil "particulaCabeza") then {
	deleteVehicle particulaCabeza;
	particulaCabeza = nil;
};

["elegante", "AVISO", "Un admin te ha expulsado.<br/>Serás expulsado del servidor en 5 segundos."] remoteexec ["ica_fnc_hint", _tio];

sleep 5;

["7a8fgaifq_G4yad", format ["#kick %1", getPlayerUID _tio]] remoteExec ["serverCommand", 2];

hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Jugador %1 expulsado.</t>", _nombre];
