
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

_date = date;  

_date set [3, 10]; 

[_date, {setDate _this}] remoteExec ["call", 2];

["Admin Log",format [ "%1 - (%2) ha hecho de dia", profileName, (getPlayerUID player)] ] remoteexeccall ["ica_fnc_customlog",2]; 
