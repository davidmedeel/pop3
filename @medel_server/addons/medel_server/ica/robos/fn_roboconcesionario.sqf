
/*
Robo al concesionario por Icaruk
	["init"] spawn ica_fnc_roboConcesionario
	["entrego"] spawn ica_fnc_roboConcesionario
*/

_param = _this select 0;
_class = "pop_ferrari_enzo_rojo";

if (_param isEqualTo "init") exitWith { // sólo servidor

	fnc_concesionario = { // fnc para crear veh

		private "_veh";
		_pos = [8650.573, 6556.013, 0.191];
		_veh = _class createVehicle _pos;
		vehConcesionario = _veh; // futura referencia
		publicVariable "vehConcesionario";

		_veh setDir 286.818;
		_veh setVariable ["robable", true, true];
		_veh lock true;
		_veh setFuel 0.33;
	};

	sleep 60;
	call fnc_concesionario;

	while {true} do {
		if (isnull vehConcesionario) then {
			call fnc_concesionario;
		};

		sleep (60 * 30);
	};
};

if (_param isEqualTo "robo") exitWith {

	//if ({side _x == WEST} count playableUnits < 6) exitWith {hint "Tienen que estar al menos 6 policias conectados, si no no es divertido."};

	private "_veh";
	_veh = (nearestObjects [player, [_class], 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos"};
	if (isNil {_veh getVariable "robable"}) exitWith {};

	["menu", 0.92, "concesionario"] call ica_fnc_ganzua;
};

if (_param isEqualTo "entrego") exitWith {

	private "_veh";
	if ((player distance carshop1_1_1_2) > 3) exitWith {hint "¡Psssst, acércate + loko!"; };
	if ((count (nearestObjects [getPos carshop1_1_1_2, ["Man"], 4])) > 1) exitWith {
		hint "oye no quiero problemas, tieneh ke estar tú sólo para negociá conmigo.";
	};

	_veh = (nearestObjects [player, [_class], 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos o no hay  ningún vehículo"};

	if ((_veh getVariable "robable") == 1) then {
		deleteVehicle _veh;

		_din = 50001;
		hint format ["K wapo loko, los alerones estan to guapos. \n\nAkí tiens tu parte: %1€", _din];
		medel_din = medel_din + medel_dsin_din;
		["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
		vehConcesionario = nil;
		publicVariable "vehConcesionario";
	} else {
		hint "vaiaaa mierda de coche loco";
	};

};



