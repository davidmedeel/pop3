
/*
por: Icaruk

	[] call ica_fnc_expTolevel 		// me dará mi nivel actual
	123 call ica_fnc_expToLevel 	// me dará el nivel que tendría con esa experiencia
	"med" call ica_fnc_expToLevel 	// me dará el nivel de esa rama
	"%+" call ica_fnc_expToLevel		// me dará la exp total que tengo que acumular para subir de nivel, no la que me falta
	"%-" call ica_fnc_expToLevel		// me dará la exp total que tenía que acumular para subir al nivel anterior
	"next" call ica_fnc_expToLevel		// me da la exp que me falta para subir de nivel
	
	6065 para ser lvl 50
*/

private ["_lvl", "_fin", "_lvl", "_miExp", "_exp", "_idx"];

if ((typeName _this) == "ARRAY") then {_miExp = experiencia select 0};
if ((typeName _this) == "SCALAR") then {_miExp = _this};
if ((typeName _this) == "STRING") exitWith {
	if (_this == "%+") exitWith {
		_lvl = [] call ica_fnc_expToLevel;
		_exp = ((_lvl * 15 + 100)) + (_lvl ^ 2.2);
		_exp
	};
	if (_this == "%-") exitWith {
		_lvl = ([] call ica_fnc_expToLevel) - 1;
		_exp = ((_lvl * 15 + 100)) + (_lvl ^ 2.2);
		_exp
	};
	if (_this == "next") exitWith {
		_exp = (((("%+" call ica_fnc_expToLevel) - ("%-" call ica_fnc_expToLevel)) - (("%+" call ica_fnc_expToLevel) - (experiencia select 0))) / (("%+" call ica_fnc_expToLevel) - ("%-" call ica_fnc_expToLevel)));
		_exp
	};
	_idx = switch (_this) do {
		case "exp": {0};
		case "sp": {1};
		case "ene": {2};
		
		case "med": {3};
		case "con": {4};
		case "for": {5};
		case "min": {6};
		case "pes": {7};
		case "agr": {8};
		case "log": {9};
		case "art": {10};
		case "inf": {11};
		case "tir": {12};
		case "maf": {13};
	};
	_fin = experiencia select _idx;
	_fin
};

if (isNil {_miExp}) exitWith {};

_lvl = 1;
while {true} do {
	_exp = ((_lvl * 15 + 100)) + (_lvl ^ 2.2);
	if (_miExp <= _exp) exitWith {_lvl};
	
	_lvl = _lvl + 1;
};

if (_lvl > 70) then {_lvl = 70};
if ((typeName _this) == "ARRAY") then {_fin = _lvl};
if ((typeName _this) == "SCALAR") then {_fin = _lvl};
_fin
