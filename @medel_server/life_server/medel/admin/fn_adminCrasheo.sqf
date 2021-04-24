
#include "..\..\script_macros.hpp"

private ["_param", "_tio"];

if (FETCH_CONST(life_adminlevel) < 4) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

_tio = param [0];

_nombre = name _tio;

_confirmado = [format ["¿Estás seguro que quieres crashear el juego a <t color='%1'>%1?</t>", _nombre], "Sí", "No"] call ica_fnc_confirmacion;

if (_confirmado) then {
    {while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", _tio];
	["Admin Log",format [ "%1 - (%2) ha crasheado a %3", profileName, (getPlayerUID player), _nombre]] remoteexeccall ["ica_fnc_customlog",2];
} else {
	closeDialog 645967;
};
