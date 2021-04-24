
/*
por: Icaruk
	[player] spawn ica_fnc_toxicidad;
*/

private ["_tox", "_n", "_victima"];

_victima = _this select 0;

if (!isNil "intox") exitWith {}; // ya estoy en el loop
intox = true;

sleep 1;

while {true} do {
	hint "Toxicidad";
	_tox = _victima getVariable "toxicidad";
	if (_tox <= 0) exitWith {hint "No me duele nada"; intox = nil}; // ya no estoy en loop
	if (_tox >= 100) exitWith {_victima setDamage 1; _victima setVariable ["toxicidad", 0, true]; intox = nil};
	
	_n = if (_tox < 10) then {_tox} else {10};
	_victima setVariable ["toxicidad", _tox - _n, true];
	
	sleep 25;
};