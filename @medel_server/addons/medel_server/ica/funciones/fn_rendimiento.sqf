
/*
por: Icaruk
Compara el rendimiento de dos códigos.

Params:
	0: CODE - Primer código a comparar.
	1: CODE - Segundo código a comparar.
	2: SCALAR (opcional) - Ciclos. Default 5000.
	
	
	[
		{_asd = []; _asd pushBack 0},
		{_asd = []; _asd = _asd + [0]}
	] call ica_fnc_rendimiento;
	
*/



_code1 = param [0];
_code2 = param [1];
_ciclos = param [2, 5000];

_r1 = diag_codePerformance [_code1, 0, _ciclos];
_r2 = diag_codePerformance [_code2, 0, _ciclos];

_t1 = (_r1 select 0) * 1000;
_t2 = (_r2 select 0) * 1000;

_c1 = _r1 select 1;
_c2 = _r2 select 1;


_strC1 = if (_c1 < _ciclos) then {format ["(%1 ciclos)", _c1]} else {""};
_strC2 = if (_c2 < _ciclos) then {format ["(%1 ciclos)", _c2]} else {""};

_dif = _t1 - _t2;

hint parseText format [
	"<t size='1.5' color='#ff9900' shadow='1'>

	Test de rendimiento<br/>
	%1 ciclos<br/>
	--------------<br/><br/>

	<t size='1.2'>

	<t color='#ff0000'>
	Código 1:<br/>
	%2 ms<br/>
	%3<br/><br/>
	</t>

	<t color='#0dfc00'>
	Código 2:<br/>
	%4 ms<br/>
	%5<br/><br/>
	</t>

	Diferencia de 69 ms

	</t>",
	_ciclos, _t1, _strC1, _t2, _strC2, abs _dif
];
