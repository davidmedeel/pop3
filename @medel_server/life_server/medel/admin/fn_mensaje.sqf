
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

private ["_texto"];

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

_texto = parseText(ctrlText 1700);

//missionNamespace setVariable ["mensaje_global", _texto];

["envio", _texto] remoteExec ["ica_fnc_enviaMensaje", 0];

//[10, "Administración", [1,0,0], 1.5, _texto, [1,1,1], 1] remoteexec ["ica_fnc_customloganuncio", 0];

["Admin Log",format ["%1 - (%2) ha enviado el siguiente mensaje: %3.",profileName,(getPlayerUID player),_texto]] remoteexeccall ["ica_fnc_customlog",2];
