
#include "..\..\script_macros.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]],
    ["_secContainer", objNull, [objNull]]
];

scopeName "main";

private _list = ["LandVehicle", "Ship", "Air"];

{
    if (isNull _x) then {false breakOut "main"};

    private _containerType = typeOf _x;

if (!isNil {_container getVariable "bloqueado"}) exitWith {
_container setVariable ["abierto",false,true];
[[name player], {If (isNil "arraybugjoyeria") then {arraybugjoyeria = []} else {arraybugjoyeria pushback (_this select 0)};}] remoteexec ["Bis_fnc_spawn",2];
	[] spawn {
		_time = 20;
		while {_time > 0} do {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		_time - 1;
		};
	};
	hint "Lo intentas, pero no se abre";
};

if (_containerType in ["C_Van_01_fuel_F","Volvo_Cisterna_1","pop_308_autoescuela_abril", "cnp_Iveco_UIP"]) then {
	hint "Este inventario está bloqueado.";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		sleep 1;
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if (((typeOf _container) == "POP_cajaDiamantes_obj") AND (isNil {puedoAbrir})) exitWith {
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[10, "Abriendo..."] spawn ica_fnc_barrita;
		sleep 10;
		titleText ["Ya puedes abrir la caja", "PLAIN", 0.1];
		["envio", player, 30, 60*20] call ica_fnc_bloqueoDinero;
		puedoAbrir = true;
		sleep 3;
		puedoAbrir = nil;
	};
};

    if (FETCH_CONFIG2(getNumber, "CfgVehicles", _containerType, "isBackpack") isEqualTo 1) exitWith {
		hint "No puedes abrir la mochila de los demás";
        true breakOut "main";
    };

    if (_containerType in ["pop_caja_armariop_box", "pop_caja_armariog_box"]) exitWith {
        private _house = nearestObject [player, "House"];
        if (!(_house in life_vehicles) && {_house getVariable ["locked",true]}) exitWith {
			hint "No puedes abrir este armario sin que el dueño lo haya abierto";
            true breakOut "main";
        };
    };

    if (KINDOF_ARRAY(_x, _list)) exitWith {
        if (!(_x in life_vehicles) && {locked _x isEqualTo 2}) exitWith {
			hint "No puedes abrir un vehículo que esté cerrado";
            true breakOut "main";
        };
    };

    if (_x isKindOf "CAManBase" && {!alive _x}) exitWith {
        hint "No puedes abrir la mochila de los cadáveres";
        true breakOut "main";
    };
} count [_container, _secContainer];
