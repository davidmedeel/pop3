
/*
por: Medel
*/

_param = param[0];

if (_param isEqualTo "avispas") exitWith {
	_cosa = param[1];
	_precio = param[2];

	if (uniform player != "") exitWith { hint "Primero quitate el uniforme que llevas."; 0 spawn ica_fnc_cierraTodo; };
	player addUniform "medel_avispas_uniforme";
	hint parsetext format["<t color='#ffffff' size='2'>PoP Life</t><br/><br/><img shadown='false' size='6' image=''/><br/><br/>Has comprado %2 por %1€", _precio, [_cosa] call ica_fnc_classToName];
	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	[format ["+ 1 %1", [_cosa] call ica_fnc_classToName]] call ica_fnc_infolog;
	["Money Log",format [
	"%1 - (%2) ha comprado %6 por %3  - Dinero en banco : %4 - Dinero en mano %5 (Tienda mafia)",
	profileName,
	(getPlayerUID player),
	_precio,
	medel_atmdin,
	medel_din,
	_cosa
	]
	] remoteexeccall ["ica_fnc_customlog",2];
};
