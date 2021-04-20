
/*
por: Neoxan

	["cargo"] call ica_fnc_enterrador;   Para meter el ataud en el coche
	["entierro"] spawn ica_fnc_enterrador;   Para descargar el ataud y crear la tumba
	["meto"] call ica_fnc_enterrador;     Para cargar el cuerpo en el ataud
	
	Las acciones estan en el setupactions, ahí filtra que el enterrador tiene que ser un EMS
*/

_param = _this select 3;

if (_param isEqualTo "cargo") exitWith {
	private ["_ataud","_veh"];
	_ataud = nearestObject [player, "pop_ataud"];
	_veh = nearestObject [player, "Car"];
	if ((player distance _veh) > 5) exitwith {hint "No hay ningún vehículo cerca"};
	if ((typeof _veh) != "POP_corbillard_c_noir") exitwith {hint "No puedes cargar un ataud en ese vehículo"};
	if ((_veh animationPhase 'puerta') != 1) exitwith {hint "Abre las puertas para cargar el ataud"};
	if (_veh getvariable "muerto") exitwith {hint "Ya hay un ataud en el vehículo, de uno en uno"};
	_nombre = _ataud getvariable "nombre";
	if (!(isnil "_nombre")) then {
		_veh setvariable ["nombre",_nombre,true];
	};
	deletevehicle _ataud;
	_veh animate ["ataud2",1,true];
	_veh animate ["ataud",0];
	_veh animate ["ataud2",0];
	_veh setvariable ["muerto",true,true];
};

if (_param isEqualTo "entierro") exitWith {
	private ["_veh","_tumbas"];
	_veh = nearestObject [player, "Car"];
	if (player distance (getMarkerPos "cementerio") > 50) exitWith {"No puedes enterrar el cadaver aquí, ve a un cementerio"};
	if ((count (nearestObjects [(getPos _veh), ["Man"], 6])) > 1) exitWith {
		hint "Hay demasiada gente aquí cerca, necesitas espacio para enterrar el cadaver.";
	};
	if ((player distance _veh) > 5) exitwith {hint "No hay ningún vehículo cerca"};
	if ((typeof _veh) != "POP_corbillard_c_noir") exitwith {hint "Aparta los demás coches"};
	_muerto = _veh getvariable "muerto";
	if (!(_muerto)) exitwith {hint "No hay nadie a quien enterrar"};
	if (isNil "_muerto") exitwith {hint "No hay nadie a quien enterrar"};
	if ((_veh animationPhase 'puerta') != 1) exitwith {hint "Abre las puertas para descargar el ataud"};
	_veh setvariable ["muerto",false,true];
	_veh animate ["ataud2",1];
	sleep 2;
	_veh animate ["ataud2",0];
	_veh animate ["ataud",1];
	_tumbas = ["Land_Grave_memorial_F","Land_Grave_obelisk_F","Land_Grave_soldier_F","Land_Grave_V1_F","Land_Grave_V2_F","Land_Grave_V3_F"] call BIS_fnc_selectRandom;
	_tumba = _tumbas createvehicle position _veh;
	[_tumba , 60 * 10] call ica_fnc_borrame;
	
	if ((floor random 100) <= 30) then {
		[(["pop_ojos_item", "pop_corazon_item", "pop_estomago_item"] call BIS_fnc_selectRandom)] call ica_fnc_item; // PKE PENDIENTE
	};
	
	_nombre = _veh getvariable "nombre";
	if (!(isnil "_nombre"))then {
		_tumba setvariable ["matricula",_nombre,true];
	} else {
		_tumba setvariable ["matricula","Persona desconocida",true];
	};
	["exp",5] call ica_fnc_arrayexp;
	hint "El cadaver ha sido enterrado, descanse en paz";
};

if (_param isEqualTo "meto") exitWith {
	_muerto = cursortarget;
	_pos = getpos _muerto;
	_nombre = _muerto getvariable "name";
	if (!(_muerto iskindof "man") OR (alive _muerto)) exitwith {hint "Mira al cuerpo, presta atención"};
	if ((player distance _muerto) > 5) exitwith {hint "Acércate un poco más al cadaver"};
	if ((count (nearestObjects [_pos, ["Man"], 3])) > 2) exitWith {
		hint "Hay demasiada gente aquí cerca, necesitas espacio para el ataud.";
	};
	deletevehicle _muerto;
	_ataud = "pop_ataud" createvehicle _pos;
	if (!(isnil "_nombre")) then {
		_ataud setvariable ["nombre",_nombre,true];
	};
};
