
/*
por: Icaruk
	["almacen1", 5000] spawn ica_fnc_subeBajaBeneficios;
	["transportes", 5000] spawn ica_fnc_subeBajaBeneficios;
*/
private ["_can", "_var", "_varDem"];

_var = _this select 0;
_can = round (_this select 1);

_varDem = format ["ben%1", _var];
[player, [_varDem]] call ica_fnc_varToServer; waitUntil {recibido};

_varDem = format ["ben%1", _var];
missionNamespace setVariable [_varDem, (missionNamespace getVariable _varDem) + _can];
publicVariableServer _varDem;

