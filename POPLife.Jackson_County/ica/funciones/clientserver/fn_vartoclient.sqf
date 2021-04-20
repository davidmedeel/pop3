
/*
por: Icaruk

*/

private ["_el", "_var", "_arrayVars", "_nom", "_valor"];

_el = _this select 0;
_var = _this select 1;

_arrayVars = [];
{
	_nom = _x;
	_valor = missionNamespace getVariable _x;
	if (!isNil {_valor}) then {
		_arrayVars = _arrayVars + [_nom];
		_arrayVars = _arrayVars + [_valor];
	} else {
		diag_log format ["------ ERRORICA ------ Un cliente le ha pedido al servidor la variable %1 con valor %2", _nom, _valor];
	};
} forEach _var;

[_arrayVars, "ica_fnc_varUpdate", _el, false, true] call bis_fnc_mp; // hago que el cliente ejecute varUpdate con los valores que le envío

