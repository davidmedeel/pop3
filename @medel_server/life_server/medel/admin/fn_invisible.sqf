
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

[player, true, true] call ica_fnc_ocultame;

["Admin Log",format ["%1 - (%2) ha activado / desactivado el modo invisible",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog", 2];
