/*

Control de velocidad
por: Apecengo

Recibe una llamada desde un trigger.

MAL, CAMBIAR
Parámetros:
	0: Número, límite de velocidad
	1: String, nombre público del radar
	2: Jugador, jugador que va en el vehículo

[limite, "Nombre del radar", jugador] call ape_fn_controlvelocidad;
[120, "Autopista Morrison-Lakeside PK.5", player] ape_fn_controlvelocidad

Condición trigger:
this && (local player) && (vehicle player in thisList)

Script en el trigger:
[120, "Nombre autopista", player] call ape_fnc_controlvelocidad

*/

params ["_limit", "_name", "_speed", "_player"];

private["_fineCalc", "_vehicle", "_speed", "_trigger", "_license", "_fine", "_percentage", "_plate", "_points", "_speeltime", "_text"];

_vehicle = vehicle _player;
_speed = speed _vehicle;
_speed = round _speed;

// Comprobar que se haya superado el límite de velocidad
if(_speed <= _limit) exitWith {};

// Comprobar que el jugador esté montado a un vehículo
if(_player == _vehicle) exitWith {};

// Comprobar que el jugador sea civil
if(side _player != civilian) exitWith {};

// Comprobar que el jugador sea el conductor
if(_player != driver _vehicle) exitWith {};

// Los radares tienen un margen de error...
// Si el límite es = o menor de 100, es el límite + 10
if(_limit <= 100) then {
	_trigger = _limit + 10;
} else {
	// Si el límite es +100, el margen es 110% del límite
	_trigger = round (limit * 1.10);
};

if(_speed < _trigger) exitWith {};

// Aquí estaría bien añadir un sleep random de x tiempo para que la gente tenga la incertidumbre de si le ha saltado o no...
// _tiempo = random 15;
// sleep _tiempo (...)
//sleep _sleeptime;

playSound "fotoradar";
cutText ["","WHITE OUT",0.5];
cutText ["","WHITE IN",0.5];	

// Ahora, la cantidad también depende de la velocidad a la que íbamos...
// Para simplificarlo, lo haré en base a una función con un máximo, pero siguiendo una fórmula

_fineCalc = [_limit, _speed] call ape_fnc_calcmulta;

_fine = _fineCalc select 0;

// Si encima no tiene el permiso de conducir, le sumamos un plus fijo
_license = license_civ_driver;

if(!_license) then {
	_fine = _fine + 500; // Cantidad a sumar si no tiene el carnet
};

//_points = _fineCalc select 1;
_points = 2;

_plate = _vehicle getVariable "matricula";

_text = format ["CIRCULAR A %1 KM/H, TENIENDO LIMITADA LA VELOCIDAD A %2 KM/H. CINEMOMETRO MULTAPOP QUE HA SIDO SOMETIDO AL CONTROL METEOROLÓGICO LEGALMENTE ESTABLECIDO.", _speed, _limit];

// Llamamos al sistema de sanciones
[_fine, _points, _text, _name, _plate, true] spawn ape_fnc_sancion;


// ... y ya estaría.
