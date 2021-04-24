
/*
por: Icaruk
	[-1] call ica_fnc_negToPos; // 1
	[1] call ica_fnc_negToPos; // 1
*/

private "_num";

_num = _this select 0;

if (_num < 0) then {
	_num = _num * (-1);
};

_num
