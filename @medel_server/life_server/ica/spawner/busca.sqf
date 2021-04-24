
_param = _this select 0;

if (_param isEqualTo "componentes") exitWith {
	_caja = cursorTarget; 

	_n = 2 + floor(random 2);
	[_n, "Buscando..."] call ica_fnc_barrita;
	sleep _n;

	_can = 1;
	if (_can > ((_caja getVariable "componentes"))) exitWith {hint "Parece que no queda ningún componente electrónico útil"; };

	if ([true, "componenteselectricos", 1] call life_fnc_handleinv) then {
		_caja setVariable ["componentes", (_caja getVariable "componentes") - _can, true];
		hint format ["Has encontrado %1 componente(s) electrónico(s)", _can];
	} else {
		hint "No tienes espacio suficiente";
	};
};


