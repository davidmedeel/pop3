
/*
Script de la misión Desolation creado por Icaruk
Función: Muestra un efecto de texto con los parametros recibidos
Se invoca con:
	["texto"] call ica_fnc_masuno;
*/

[_this select 0, _this select 1] spawn {
	_texto = _this select 0;
	_tipo = _this select 1;

	("icapa5" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	("icapa5" call BIS_fnc_rscLayer) cutRsc ["masuno","PLAIN"];

	disableSerialization;
	_ui = uiNameSpace getVariable "masuno";
	_masuno = _ui displayCtrl 4065;
	_masuno ctrlSetStructuredText parseText format ["<t size='1.8' align='center'>%1</t>", _texto];

	if (isNil {_tipo}) then {
		_parpadeos = 0;
		while {_parpadeos < 7} do {
			_masuno ctrlSetTextColor [0.2,1,0.2,1];
			sleep 0.2;
			_masuno ctrlSetTextColor [1,1,1,1];
			sleep 0.2;
			_parpadeos = _parpadeos + 1;
		};
	};

	_a = 100;
	while {true} do {
		if (_a <= 0) exitWith {};
		
		_masuno ctrlSetPosition [
			((ctrlPosition _masuno) select 0),
			((ctrlPosition _masuno) select 1) + 0.003,
			((ctrlPosition _masuno) select 2),
			((ctrlPosition _masuno) select 3)
		];
		_masuno ctrlCommit 0;
		
		sleep 0.001;
		
		_a = _a - 1;
	};
};
