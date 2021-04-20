
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

private ["param","_tio"];

_tio = param [0];

if(isNil "_tio") exitwith {};
if(isNull _tio) exitWith {};
if(_tio isEqualTo player) exitWith {hint "No puedes hacerte eso a ti mismo";};

[] spawn {
	while {dialog} do {
		closeDialog 0;
		sleep 0.01;
	};
};

_nombre = name _tio;

_tio switchCamera "INTERNAL";
hint format["Estas en modo espectador %1 \n\n Pulsa F10 para salir.",_tio getVariable["realname",name _tio]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Has dejado de espectear';};false"];

["Admin Log",format [
"%1 - (%2) esta especteando ha %3",profileName,(getPlayerUID player),_nombre]] remoteexeccall ["ica_fnc_customlog",2];
