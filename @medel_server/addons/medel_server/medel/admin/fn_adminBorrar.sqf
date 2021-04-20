
#include "..\..\script_macros.hpp"

private ["_curTarget"];

_curTarget = cursorTarget;

_distancia = round(cameraOn distance _curTarget);

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (isNil {_curTarget}) exitWith {cutText[format["No hay nada para borrar"],"PLAIN DOWN"];};
//if(_curTarget isEqualTo "") exitWith {};

if (isNil "confirmoBorracion") then {
	confirmoBorracion = true;
	cutText[format["Borrar %1 a %2m ? Pulsa de nuevo para continuar", _curTarget,_distancia],"PLAIN DOWN"];
} else {
	["Admin Log",format ["%1 - (%2) ha borrado %3",profileName,(getPlayerUID player),_curTarget]] remoteexeccall ["ica_fnc_customlog",2];
	confirmoBorracion = nil;
	deleteVehicle _curTarget;
	cutText[format["Has borrado ---> %1", _curTarget],"PLAIN DOWN"];
};
