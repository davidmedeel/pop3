
/*
Por: Killzone_Kid
	["a", "asd"] call ica_fnc_inString; // devuelve true
*/
private ["_buscando","_string","_digitos","_hay","_encontrado"];

_buscando = [_this, 0, "", [""]] call BIS_fnc_param;
_string = toArray ([_this, 1, "", [""]] call BIS_fnc_param);

_digitos = count toArray _buscando;
_hay = + _string;
_hay resize _digitos;

_encontrado = false;
for "_i" from _digitos to count _string do {
	if (toString _hay == _buscando) exitWith {_encontrado = true};
	_hay set [_digitos, _string select _i];
	_hay set [0, "x"];
	_hay = _hay - ["x"]
};
_encontrado
