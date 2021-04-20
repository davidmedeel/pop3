
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

private ["param","_tio"];

_tio = param [0];

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if (isNil "_tio") exitWith {};
if (isNull _tio) exitWith {};
if (_tio isEqualTo player) exitWith {hint "No puedes hacerte eso a ti mismo";};

[player] remoteexec ["life_fnc_freezePlayer", _tio];

["Admin Log",format ["%1 - (%2) ha congelado / descongelado a %3",profileName,(getPlayerUID player), _tio]] remoteexeccall ["ica_fnc_customlog",2];
