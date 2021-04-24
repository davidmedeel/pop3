
/*
Espiritismo serveriano por Icaruk.

Para comunicarte con el servidor del más allá:
	[player, ["var1", "var2"]] call ica_fnc_varToServer; waitUntil {recibido};
*/

private ["_yo", "_var"];

_yo = _this select 0; // player
_var = _this select 1; // ARRAY

recibido = false;

[[_yo, _var], "ica_fnc_varToClient", false, false, true] call bis_fnc_mp; // hago que el server ejecute varToClient para contestarme