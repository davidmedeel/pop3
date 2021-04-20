
/*
por: Icaruk

	experiencia = [1234,12,1000,0,0,0,0,0,0,0,0,0,0,0]

	["exp", 10] call ica_fnc_arrayExp;
	["reset"] call ica_fnc_arrayExp;
	["resetgratis"] call ica_fnc_arrayExp; // sólo SP y niveles

	["sp",1] remoteexec ["ica_fnc_arrayEXP", a quien];
	["ene",100] remoteexec ["ica_fnc_arrayEXP", a quien];
	["exp",5] remoteexec ["ica_fnc_arrayEXP", a quien];

	if (name player isEqualTo "David Medel") exitWith { // Da 1 SP a David Medel
		["sp", 1] spawn ica_fnc_arrayExp;
	};

	if (name player isEqualTo "David Medel") exitWith { // Da 5 EXP a David Medel
		["exp", 5] spawn ica_fnc_arrayExp;
	};

	if (name player isEqualTo "David Medel") exitWith { // Da 100 de energia a David Medel
		["ene", 5] spawn ica_fnc_arrayExp;
	};
*/

_param = _this select 0;

if (_param isEqualTo "reset") exitWith {
	if (medel_din < 150000) exitWith {hint "Esto tiene un precio, 150.000€ en concreto."};
	medel_din = medel_din - 150000;
	["-150.000 €"] call ica_fnc_infolog;
	["Has olvidado todo lo que sabes..."] call ica_fnc_masuno;
	
	experiencia = [100, 1, (experiencia select 2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;
};

if (_param isEqualTo "resetgratis") exitWith {
	experiencia = [experiencia select 0, [] call ica_fnc_expTolevel, experiencia select 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;	
	["Todos tus SP han sido devueltos."] call ica_fnc_masuno;
};

if (_param isEqualTo "resetpuntos") exitWith {
	if (medel_din < 2000000) exitWith {hint "Esto tiene un precio, 2.000.000€ en concreto."};
	medel_din = medel_din - 2000000;
	["-2.000.000 €"] call ica_fnc_infolog;
	experiencia = [experiencia select 0, [] call ica_fnc_expTolevel, experiencia select 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;	
	["Todos tus SP han sido devueltos."] call ica_fnc_masuno;
};

_n = round (_this select 1);

private ["_idx"];
_idx = switch (_param) do {
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
	
	case "reset": {true};
	case "resetsp": {false};
};

_antNiv = [] call ica_fnc_expTolevel;
experiencia set [_idx, (experiencia select _idx) + _n];

if (_param == "exp") then {
	[format ["EXP +%1", _n]] call ica_fnc_infolog;
};

if (([] call ica_fnc_expTolevel) > _antNiv) then {
	_n = ([] call ica_fnc_expTolevel) - _antNiv;
	
	[format [", +%1 Nivel", _n]] call ica_fnc_infolog;
	[format ["¡Has alcanzado el nivel %1!", [] call ica_fnc_expTolevel]] call ica_fnc_masuno;
	["sp", _n] call ica_fnc_arrayExp;
};

if ((_param != "exp") AND (_param != "sp") AND (_param != "ene")) then { // sólo si aprendo habilidad guardo
	[22] call SOCK_fnc_updatePartial;
};
