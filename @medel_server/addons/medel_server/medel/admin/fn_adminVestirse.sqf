
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if (isnil "uniforme") then {
	_result = [format ["¿Seguro que quieres vestirte?"], "Vestirse de MoD","Aceptar","Cancelar"] call BIS_fnc_guiMessage;
	if (_result) then {
		uniforme = getunitloadout player;
		removeuniform player;
		removebackpack player;
		removeVest player;
		player forceAddUniform "U_I_Soldier_VR";
		player linkItem "EF_OPTIC_GGL";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player addVest "pop_chaleco_cmd_cmd_48";
		["Admin Log",format ["%1 - (%2) se ha vestido de admin",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	};
} else {
	removeuniform player;
	player setunitloadout uniforme;
	uniforme = nil;
	["Admin Log",format ["%1 - (%2) se ha desvestido de admin",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
};
