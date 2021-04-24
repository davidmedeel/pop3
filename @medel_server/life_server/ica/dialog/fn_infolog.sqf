
/*
Infolog por Icaruk
	["+ asd"] call ica_fnc_infolog;
	["- asd"] call ica_fnc_infolog;
	["* asd"] call ica_fnc_infolog;
	["EXP +1"] call ica_fnc_infolog;
*/

_param = _this select 0;
if (!isNil {_param}) then {
	arrayInfo pushBack _param;
	reverse arrayInfo;
	arrayinfo resize 10;
	reverse arrayInfo;
};

disableSerialization;
_ui = uiNamespace getVariable "HUDica";
_lista = _ui displayCtrl 6012;
_sombra = _ui displayCtrl 6013;

_arrayInfo = arrayInfo;

lbClear _lista;
lbClear _sombra;
for "_x" from 0 to 9 do {
	_lista lbAdd (_arrayInfo select _x);
	_sombra lbAdd (_arrayInfo select _x);
	
	if (["+", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [0, 0.7, 0, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};	
	if (["-", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [0.95, 0.05, 0.05, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};
	if (["*", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [0, 0.7, 1, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};
	if (["EXP", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [1, 0.01, 1, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};
	if ([",", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [0.9, 0.9, 0, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};
	if (["'", _arrayInfo select _x] call ica_fnc_inString) then {
		_lista lbSetColor [_x, [0.9, 0.6, 0, 0.9]];
		_sombra lbSetColor [_x, [0, 0, 0, 0.7]];
	};
	
	if (lbSize _lista >= 10) then {
		_lista lbSetColor [0, [(_lista lbColor 0) select 0, (_lista lbColor 0) select 1, (_lista lbColor 0) select 2, 0.2]];
		_lista lbSetColor [1, [(_lista lbColor 1) select 0, (_lista lbColor 1) select 1, (_lista lbColor 1) select 2, 0.4]];
		_lista lbSetColor [2, [(_lista lbColor 2) select 0, (_lista lbColor 2) select 1, (_lista lbColor 2) select 2, 0.6]];
		_sombra lbSetColor [0, [(_sombra lbColor 0) select 0, (_sombra lbColor 0) select 1, (_sombra lbColor 0) select 2, 0.2]];
		_sombra lbSetColor [1, [(_sombra lbColor 0) select 0, (_sombra lbColor 0) select 1, (_sombra lbColor 0) select 2, 0.4]];
		_sombra lbSetColor [2, [(_sombra lbColor 0) select 0, (_sombra lbColor 0) select 1, (_sombra lbColor 0) select 2, 0.6]];
	};
};



/*
arrayTxt = parseText arrayStr;
_txt ctrlSetStructuredText arrayTxt;
*/



