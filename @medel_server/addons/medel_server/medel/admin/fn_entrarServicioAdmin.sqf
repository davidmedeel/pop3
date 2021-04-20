
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

_ui = uiNamespace getVariable "life_admin_menu";
_botonEntrarServicio = _ui displayCtrl 5908;

entrarServicioMedel = {
	while {deServicio == 1} do {
        while {true} do {
            sleep 300;
            medel_din = medel_din + medel_dsin2000;
			["+ 2.000 €"] spawn ica_fnc_infolog;
            ["exp", 5] spawn ica_fnc_arrayEXP;
       	};
		if(deServicio == 0) exitWith {};
		uiSleep 1;
		if(deServicio == 0) exitWith {};
	};
};

if(isNil 'deServicio') then {deServicio = 0;};

if (deServicio == 0) then {
	if !(playerSide isEqualTo civilian) exitWith {hint "¿Qúe haces moderando sin ser Civil? ¿Eres tonto?";};

	//[0, format ["Administrador %1 ha entrado de servicio", name player]] remoteexec ["life_fnc_broadcast", 0];

	//_boton ctrlSetText "Salir de Servicio";

	["simple", "INFORMACIÓN", "Has entrado de Servicio.<br/><br/>Al entrar de servicio se te habilitan las siguientes funciones:<br/><br/>TP: ALT + CLICK IZQ<br/>TP 5 METROS: SHIFT + 7<br/>SALTO: SHIFT + 6<br/>BORRAR: SPR"] spawn ica_fnc_hintSilent;

	onMapSingleClick "if (_alt) then {vehicle player setPos _pos}";

	["Admin Log",format ["%1 - (%2) ha entrado de servicio",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];

	deServicio = 1;
	[] spawn entrarServicioMedel;
} else {
	["<t size='0.8' shadow='1' color='#ff0000'>Has salido de Servicio</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

	if (!isNil "particulaCabeza") then { // tengo las partículas de admin
		deleteVehicle particulaCabeza;
		particulaCabeza = nil;
	};

	["FinServicio",false,false] call BIS_fnc_endMission;

	onMapSingleClick "";

	["Admin Log",format ["%1 - (%2) ha salido de servicio",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];

	deServicio = 0;
};
