

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

private ["_param", "_tio"];

_tio = param [0];

if(isNil "_tio") exitwith {};
if(isNull _tio) exitWith {};

{profileNamespace setVariable ["rutome", 0]} remoteExec ["bis_fnc_call",_tio];

_nombre = name _tio;

hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Has revivido a %1</t>", _nombre];

["Admin Log",format ["%1 - (%2) ha revivido a %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
