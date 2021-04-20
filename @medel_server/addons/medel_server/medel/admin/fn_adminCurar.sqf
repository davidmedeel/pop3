
/*
por: Medel
*/

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

_nombre = name _tio;

_tio setDamage 0;
{_tio setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
_tio setVariable ["sangrando", [0, 0, 0, 0], true];
_tio setVariable ["inconsciente", false, true];
_tio setVariable ["cegado", false, true];
_tio setVariable ["toxicidad", 0, true];
_tio setVariable ["dolor", false];
_tio setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
_tio setVariable ["organos", [true, true, true], true];
cutText[format["Has curado a %1", _nombre],"PLAIN"];

["Admin Log",format ["%1 - (%2) ha curado a %3",profileName,(getPlayerUID player), _nombre]] remoteexeccall ["ica_fnc_customlog",2];
