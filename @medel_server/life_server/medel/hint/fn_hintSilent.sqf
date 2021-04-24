
/*
por: Medel

Params:
	0 - SCALAR 	// Param
	1 - STRING 	// Titulo
	2 SCALAR 	// Texto

["normal", "Aviso", "Texto del Aviso"] call ica_fnc_hintSilent;
["normal", "Aviso", "Texto del Aviso"] remoteexec ["ica_fnc_hintSilent", a quien];
*/

private ["_titulo", "_texto", "_param"];

_param = param [0];

if (_param isEqualTo "simple") exitWith {

	_titulo = param [1];
	_texto = param [2];

	hintSilent parsetext format ["<br/><t color='#ffffff' size='2' shadow='1'shadowColor='#ffffff'>%1<br/></t> <br/><t color='#e7ad3e' size='2'></t> <t color='#FFFFFF' size='1.5'>%2</t>", _titulo, _texto];
};

if (_param isEqualTo "normal") exitWith {

	_titulo = param [1];
	_texto = param [2];

	hintSilent parsetext format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>%1<br/></t> <br/><t color='#e7ad3e' size='2'></t> <t color='#FFFFFF' size='1.5'>%2</t>", _titulo, _texto];
};

if (_param isEqualTo "decorado") exitWith {

	_titulo = param [1];
	_texto = param [2];

	hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>%1<br/><t color='#21618C'><t size='1.2'><t align='center'>%2</t>", _titulo, _texto];
};

if (_param isEqualTo "elegante") exitWith {

	_titulo = param [1];
	_texto = param [2];

	hintSilent parsetext format ["<br/><t color='#084aff' size='2' shadow='1'shadowColor='#b7bfd6'>~%1~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/>%2</t>", _titulo, _texto];
};
