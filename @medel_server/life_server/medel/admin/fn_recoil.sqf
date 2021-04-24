
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 5) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if (isNil "noRecoil") then {
	["Admin Log",format ["%1 - (%2) ha activado la funcion No Recoil",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	player setUnitRecoilCoefficient 0;
	player setCustomAimCoef 0;
	noRecoil = true;
	hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Ahora no tienes recoil</t>";
} else {
	["Admin Log",format ["%1 - (%2) ha desactivado la funcion No Recoil",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	player setUnitRecoilCoefficient 1;
	noRecoil = nil;
	hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Ahora tienes recoil</t>";
};
