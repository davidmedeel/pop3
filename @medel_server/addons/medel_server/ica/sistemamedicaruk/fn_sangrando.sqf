
/*
por: Icaruk
	[player, "cabeza"] spawn ica_fnc_sangrando;
	[player, "loop"] spawn ica_fnc_sangrando;
	
El array de sangrado es [0, 0, 0, 0]:
	0 - SCALAR // de 0 a 2 cuánto sangra en la cabeza
	1 - SCALAR // o en el pecho
	2 - SCALAR // o en los brazos
	3 - SCALAR // o en las piernas

El sangrado total máximo es 8 (2+2+2+2)
*/

_victima = _this select 0;
_parte = _this select 1;

if (_parte isEqualTo "loop") exitWith { // lo he cargado desde initMed
	while {true} do {
		_sangrando = (_victima getVariable "sangrando");
		_sangradoTotal = (_sangrando select 0) + (_sangrando select 1) + (_sangrando select 2) + (_sangrando select 3);
		if (_sangradoTotal <= 0) exitWith {hint "Ya no estoy sangrando"};

		_victima setDamage (damage _victima + (_sangradoTotal / 100)); // 0.01 por stack de sangrado, max 0.8

		private "_txt";
		_txt = switch (true) do {
			case (_sangradoTotal >= 7): {"\pop_iconos\icons\medICA\sangrado4.paa"};
			case (_sangradoTotal >= 5): {"\pop_iconos\icons\medICA\sangrado3.paa"};
			case (_sangradoTotal >= 3): {"\pop_iconos\icons\medICA\sangrado2.paa"};
			case (_sangradoTotal >= 1): {"\pop_iconos\icons\medICA\sangrado1.paa"};
			case (_sangradoTotal >= 0): {""};
		};

		if (_txt != "") then {
			disableSerialization;
			("sangradoHUD" call BIS_fnc_rscLayer) cutRsc ["sangrado","PLAIN"];
			_efecto = (uiNamespace getVariable "sangrado") displayCtrl 7015;
			_efecto ctrlSetText _txt;
		};

		sleep 20; // con sangrado nivel 1 duras 32 minutos. Con sangrado nivel 8 duras 4 minutos
	};
};

_sangrando = (_victima getVariable "sangrando");
_sangradoTotal = (_sangrando select 0) + (_sangrando select 1) + (_sangrando select 2) + (_sangrando select 3);

private "_idx";
_idx = switch (_parte) do {
	case "cabeza": {0};
	case "pecho": {1};
	case "brazos": {2};
	case "piernas": {3};
};


if ((_sangrando select _idx) < 2) then { // aplico gravedad del sangrado, sin pasarme del límite
	_sangrando set [_idx, (_sangrando select _idx) + 1];
	_victima setVariable ["sangrando", _sangrando, true];
};

if (_sangradoTotal > 0) exitWith {}; // ya estoy sangrando, no entramos al loop


while {true} do {
	_sangrando = (_victima getVariable "sangrando");
	_sangradoTotal = (_sangrando select 0) + (_sangrando select 1) + (_sangrando select 2) + (_sangrando select 3);
	if (_sangradoTotal <= 0) exitWith {hint "Ya no estoy sangrando"};
	
	_victima setDamage (damage _victima + (_sangradoTotal / 100)); // 0.01 por stack de sangrado, max 0.8
	
	private "_txt";
	_txt = switch (true) do {
		case (_sangradoTotal >= 7): {"\pop_iconos\icons\medICA\sangrado4.paa"};
		case (_sangradoTotal >= 5): {"\pop_iconos\icons\medICA\sangrado3.paa"};
		case (_sangradoTotal >= 3): {"\pop_iconos\icons\medICA\sangrado2.paa"};
		case (_sangradoTotal >= 1): {"\pop_iconos\icons\medICA\sangrado1.paa"};
		case (_sangradoTotal >= 0): {""};
	};

	if (_txt != "") then {
		disableSerialization;
		("sangradoHUD" call BIS_fnc_rscLayer) cutRsc ["sangrado","PLAIN"];
		_efecto = (uiNamespace getVariable "sangrado") displayCtrl 7015;
		_efecto ctrlSetText _txt;
	};

	sleep 20; // con sangrado nivel 1 duras 32 minutos. Con sangrado nivel 8 duras 4 minutos
};

