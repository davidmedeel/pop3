
/*
por: Icaruk
	0 spawn ica_fnc_initDroga;
*/

waitUntil {!isNil {camMet}};

// Vars
0 spawn {

	_tope = 200;
	_n = 20;
	while {true} do {
		if !(camMar <= 0) then {camMar = camMar - _n};
		if !(camHer <= 0) then {camHer = camHer - _n};
		if !(camCoc <= 0) then {camCoc = camCoc - _n};
		if !(camMet <= 0) then {camMet = camMet - _n};
		
		sleep (60 * 20);
	};
};

// Opio
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajaOpio1, cajaOpio2, cajaOpio3, cajaOpio4, cajaOpio5,
	cajaOpio6, cajaOpio7, cajaOpio8, cajaOpio9, cajaOpio10,
	cajaOpio11, cajaOpio12, cajaOpio13, cajaOpio14, cajaOpio15, cajaOpio16,cajaopio14_1,cajaopio14_2,cajaopio14_3];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_opio = {"pop_opio_b" == _x} count _contenidoCajas;
		
		if (_opio < 100) then {
			for "_x" from 0 to 30 do {
				(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_opio_b", 1];
			};
		};
		
		{_x animate ["door1", 0]} forEach [contenedores4, contenedores5, contenedores6,contenedores1_1,contenedores1_2,contenedores1_3];
		
		sleep (60 * 30);
	};
};


// Coca
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajacoca1, cajacoca2, cajacoca3,cajacoca2_1,cajacoca2_2,cajacoca2_3];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_coca = {"pop_coca_b" == _x} count _contenidoCajas;
		
		if (_coca < 80) then {
			for "_x" from 0 to 20 do {
				(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_coca_b", 1];
			};
		};
		// {_x setVariable ["cerrado", true, true]} forEach _cajas;
		{_x animate ["door1", 0]} forEach [contenedores1, contenedores2, contenedores3,contenedores1_1,contenedores1_2,contenedores1_3];
		
		sleep (60 * 30);
	};
};

// Efedrina
0 spawn {
	private ["_cajas", "_contenidoCajas"];
	_cajas = [cajaHospital];

	while {true} do {
		_contenidoCajas = [];
		{_contenidoCajas = _contenidoCajas + magazineCargo _x} forEach _cajas;
		_efe = {"pop_efedrina_b" == _x} count _contenidoCajas;
		
		if (_efe < 80) then {
			(_cajas call BIS_fnc_selectRandom) addItemCargoGlobal ["pop_efedrina_b", 20];
		};
		// {_x setVariable ["cerrado", true, true]} forEach _cajas;
		
		sleep (60 * 20);
	};
};


	