
/*
por: Icaruk
	"string" call ica_fnc_strToArr;
*/

private ["_str", "_arr"];

_str = _this;
_arr = call compile format ["%1", _str];
_arr