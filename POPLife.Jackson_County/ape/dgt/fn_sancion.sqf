/*

fn_sancion.sqf
Por Apecengo

Sistema central para sancionar por cosas de tráfico.

PARAMS:
	0: Número positivo: dinero
	1: Número: puntos
	2: String: mensaje
	3: String: dónde
	3: Boolean: fuente del dinero -> true: banco

*/

// Parámetros, con valores por defecto.
params [["_fine", 0], ["_points", 0], ["_msg", "MOTIVO NO ESPECIFICADO. ERROR DE TRAMITACIÓN Nº 127.C"], ["_location", "REGIÓN DE LAKESIDE"],  ["_plate", -1], ["_source", true]];

private ["_text", "_currentPoints", "_pointsLeft"];

sleep (random 10);

// La notificación por hint se genera por partes
_text = "<t size='2'>DGT</t><br/><t size='1'>Notificación de sanción</t><t align='left'>";

_text = _text + format["<br/><br/><t size='1' underline='true'>1. LUGAR DE DENUNCIA</t><br/>%1", _location];

_text = _text + format["<br/><br/><t size='1' underline='true'>2. HECHO DENUNCIADO</t><br/>%1", _msg];

_text = _text + format["<br/><br/><t size='1' underline='true'>3. DATOS VEHÍCULO</t><br/>Matrícula: %1", _plate];

_text = _text + format["<br/><br/><t size='1' underline='true'>SANCIÓN</t>"];

// Puntos
if(_points > 0) then {
	_currentPoints = profileNamespace getVariable "puntosCarnet";

	if ((isNil {_currentPoints}) AND (license_civ_driver)) then {
		 _currentPoints = 15;
	};

	_pointsLeft = (_currentPoints - _points) max 0;
	profileNamespace setVariable ["puntosCarnet", _pointsLeft];
	[format ["-%1 puntos (radar)", _points]] call ica_fnc_infolog;
	if(_pointsLeft == 0) then {
		_text = _text + format["<br/>Puntos a detraer: %1 (Le quedan: 0)", _points, _pointsLeft];
		license_civ_driver = false; // Quitar carnet
	} else {
		_text = _text + format["<br/>Puntos a detraer: %1 (Le quedan: %2)", _points, _pointsLeft];
	};
};

if(_fine > 0) then {
	medel_atmdin = (medel_atmdin - _fine) max 0;
	[format ["-%1 € (Radar)", _fine]] call ica_fnc_infolog;
	_text = _text + format["<br/>Importe total multa: %1 € (PAGADO)", _fine];
};

_text = _text + "</t>";
hint parseText _text; // Lo enviamos
