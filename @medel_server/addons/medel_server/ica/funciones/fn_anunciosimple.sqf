/*
por: Icaruk
params:
	0 - STRING
	1 - STRING
	
	["asd", "qwe"] spawn ica_fnc_anuncioSimple;
*/

[8, (_this select 0), [1,0,0], 2, (_this select 1), [1,1,1], 1.4] spawn ica_fnc_anuncio;
