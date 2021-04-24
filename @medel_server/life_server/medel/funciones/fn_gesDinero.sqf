
/*
por: Medel

Params:
	0 - ANY 	// Referencia
	1 - SCALAR 	// Cantidad
	2 - SCALAR 	// Modo

Ejemplos:
	["añado", 1000, true] remoteexec ["ica_fnc_gesDinero", a quien]; // Le doy 1000€ en la cartera
	["añado", 1000, false] remoteexec ["ica_fnc_gesDinero", a quien]; // Le doy 1000€ en mano

	["quito", 1000, true] remoteexec ["ica_fnc_gesDinero", a quien]; // Le quito 1000€ en la cartera
	["quito", 1000, false] remoteexec ["ica_fnc_gesDinero", a quien]; // Le quito 1000€ del banco

	["añado", 1000, true] remoteexec ["ica_fnc_gesDinero", a quien]; // Le añado 1000€ de la cartera a X jugador
	["añado", 1000, false] remoteexec ["ica_fnc_gesDinero", a quien]; // Le añado 1000€ del banco a X jugador

	["quito", 1000, true] remoteexec ["ica_fnc_gesDinero", a quien]; // Le quito 1000€ de la cartera a X jugador
	["quito", 1000, false] remoteexec ["ica_fnc_gesDinero", a quien]; // Le quito 1000€ del banco a X jugador
*/

_param = param [0];

if (_param isEqualTo "añado") exitWith {
	_cantidad = param [1];
	_modo = param [2];

	if (_modo) then {
		medel_atmdin = medel_atmdin + _cantidad;
	} else {
		medel_din = medel_din + _cantidad;
	};
};

if (_param isEqualTo "quito") exitWith {
	_cantidad = param [1];
	_modo = param [2];

	if (_modo) then {
		medel_atmdin = medel_atmdin - _cantidad;
	} else {
		medel_din = medel_din - _cantidad;
	};
};
