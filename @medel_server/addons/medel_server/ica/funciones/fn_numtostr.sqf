
/*
Author Karel Moricky
	[1234, 3] call ica_fnc_numToStr // "1.234"
	[1234, 99] call ica_fnc_numToStr // "1234"
*/

private ["_n","_espacio","_digitos","_digitosCan","_espacioBase", "_txt"];

_n = _this select 0;
_espacio = [_this, 1, 3] call BIS_fnc_param;

_digitos = _n call bis_fnc_numberDigits;
_digitosCan = count _digitos - 1;

_espacioBase = _digitosCan % _espacio;
_txt = "";
{
	_txt = _txt + str _x;
	if (((_foreachindex - _espacioBase) % (_espacio) == 0) && (_foreachindex != _digitosCan)) then {
		_txt = _txt + ".";
	};
} foreach _digitos;

_txt

