/*

fn_calcularsancionconlimite.sqf
Por Apecengo

Dada una velocidad y un límite, calcula la sanción de puntos y de dinero.

PARAMS
	0 - Número: límite
	1 - Número: velocidad

Devuelve: Array [dinero, puntos]

Ejemplo [120, 138] call ape_fnc_calcularsancionconlimite

https://sede.dgt.gob.es/Galerias/tramites-y-multas/alguna-multa/consulta-de-sanciones-por-exceso-velocidad/cuadro_velocidad.pdf

*/

params ["_limit", "_speed"];

private["_base", "_result", "_return"];

_base = 100; // 100€ de base
_result = false;

if(_limit isEqualTo 30) then {
	_result = true;
	if(_speed > 30) then {_return = [_base * 1, 0]};
	if(_speed > 50) then {_return = [_base * 3, 2]};
	if(_speed > 60) then {_return = [_base * 4, 4]};
	if(_speed > 70) then {_return = [_base * 5, 6]};
	if(_speed > 80) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 40) then {
	_result = true;
	if(_speed > 40) then {_return = [_base * 1, 0]};
	if(_speed > 60) then {_return = [_base * 3, 2]};
	if(_speed > 70) then {_return = [_base * 4, 4]};
	if(_speed > 80) then {_return = [_base * 5, 6]};
	if(_speed > 90) then {_return = [_base * 6, 6]};
};


if(_limit isEqualTo 50) then {
	_result = true;
	if(_speed > 50) then {_return = [_base * 1, 0]};
	if(_speed > 70) then {_return = [_base * 3, 2]};
	if(_speed > 80) then {_return = [_base * 4, 4]};
	if(_speed > 90) then {_return = [_base * 5, 6]};
	if(_speed > 100) then {_return = [_base * 6, 6]};
};


if(_limit isEqualTo 60) then {
	_result = true;
	if(_speed > 60) then {_return = [_base * 1, 0]};
	if(_speed > 90) then {_return = [_base * 3, 2]};
	if(_speed > 110) then {_return = [_base * 4, 4]};
	if(_speed > 120) then {_return = [_base * 5, 6]};
	if(_speed > 130) then {_return = [_base * 6, 6]};
};


if(_limit isEqualTo 70) then {
	_result = true;
	if(_speed > 70) then {_return = [_base * 1, 0]};
	if(_speed > 100) then {_return = [_base * 3, 2]};
	if(_speed > 120) then {_return = [_base * 4, 4]};
	if(_speed > 130) then {_return = [_base * 5, 6]};
	if(_speed > 140) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 80) then {
	_result = true;
	if(_speed > 80) then {_return = [_base * 1, 0]};
	if(_speed > 110) then {_return = [_base * 3, 2]};
	if(_speed > 130) then {_return = [_base * 4, 4]};
	if(_speed > 140) then {_return = [_base * 5, 6]};
	if(_speed > 150) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 90) then {
	_result = true;
	if(_speed > 90) then {_return = [_base * 1, 0]};
	if(_speed > 120) then {_return = [_base * 3, 2]};
	if(_speed > 140) then {_return = [_base * 4, 4]};
	if(_speed > 150) then {_return = [_base * 5, 6]};
	if(_speed > 160) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 100) then {
	_result = true;
	if(_speed > 100) then {_return = [_base * 1, 0]};
	if(_speed > 140) then {_return = [_base * 3, 2]};
	if(_speed > 160) then {_return = [_base * 4, 4]};
	if(_speed > 170) then {_return = [_base * 5, 6]};
	if(_speed > 180) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 110) then {
	_result = true;
	if(_speed > 110) then {_return = [_base * 1, 0]};
	if(_speed > 140) then {_return = [_base * 3, 2]};
	if(_speed > 160) then {_return = [_base * 4, 4]};
	if(_speed > 170) then {_return = [_base * 5, 6]};
	if(_speed > 180) then {_return = [_base * 6, 6]};
};

if(_limit isEqualTo 120) then {
	_result = true;
	if(_speed > 120) then {_return = [_base * 1, 0]};
	if(_speed > 150) then {_return = [_base * 3, 2]};
	if(_speed > 170) then {_return = [_base * 4, 4]};
	if(_speed > 180) then {_return = [_base * 5, 6]};
	if(_speed > 190) then {_return = [_base * 6, 6]};
};

if(!_result) then { _return = [0,0]};

_return
