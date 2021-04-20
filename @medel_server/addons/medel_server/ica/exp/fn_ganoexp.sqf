
/*
por: Icaruk
Params: 
	0: SCALAR - cuánta experiencia se gana
	1: SIDE - (opcional) bando que gana la exp en un radio de 50m por defecto
	2: SCALAR - (opcional) radio en el que se gana la exp
	
	[10] call ica_fnc_ganoExp; // gano 10 exp
	[10, CIV, 100] call ica_fnc_ganoExp; // todos los CIV en un radio de 100m ganan 10 exp
	[10, WEST, 100] call ica_fnc_ganoExp; // todos los WEST en un radio de 100m ganan 10 exp	
*/

_n = round (_this select 0);
_side = _this select 1;
_radio = param [2, 100];

if (isNil {_side}) then {
	["exp", _n] call ica_fnc_arrayExp;
} else {
	_listaGente = [];
	{
		if (player distance _x < _radio) then {_listaGente pushBack _x};
	} foreach playableUnits;
		[["exp", _n]] remoteexeccall ["ica_fnc_arrayExp", _listaGente];
};
