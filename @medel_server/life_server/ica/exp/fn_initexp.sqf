
/*
por: Icaruk
	0 spawn ica_fnc_initExp;
*/

if (typeName experiencia == "STRING") then {experiencia = call compile format ["%1", experiencia]};

_nivel = [] call ica_fnc_expToLevel;

_SPgastados = 0;
_ramas = ["med", "con", "for", "min", "pes", "agr", "log", "art", "inf", "tir", "maf"];
_maxLvl = [7, 6, 7, 7, 4, 3, 4, 9, 6, 7, 8];

_idx = 0;
while {_idx < (count _ramas)} do {
	// saco mi nivel de la rama
	_nivelhab = (_ramas select _idx) call ica_fnc_expToLevel;
	
	// saco cuántos SP me han costado esos niveles
	for "_x" from 1 to _nivelhab do {
		_hab = format ["%1%2", _ramas select _idx, _x];
		_SPgastados = _SPgastados + (["sp", _hab] call ica_fnc_costeSP);
	};

	// doy la vuelta
	_idx = _idx + 1;
};

if ((experiencia select 0) <= 100) then { // soy nivel 0
	experiencia set [0, 100]; // me pongo nivel 1
	experiencia set [1, 1]; // y pongo 1 SP
};

if (_nivel >= _SPgastados) then { // todo bien
	_SP = _nivel - _SPgastados;
	experiencia set [1, _SP]; // pongo los SP
} else { // algo va mal, hacemos reset de SP
	["resetgratis"] call ica_fnc_arrayExp;
};

0 spawn {
	while {true} do {
		sleep (60 * 2); // 5/min 10/2min 300/h 900/3h
		
		_e = (experiencia select 2);
		if (_e < 1000) then {
			["ene", 50] call ica_fnc_arrayExp;
			if (_e > 1000) then {experiencia set [2, 1000]};
		};
	};
};

if (side player isEqualTo west) then {
	miTurnoPoli = 0;
	
	0 spawn {
		while {true} do {
			if (({side _x == CIVILIAN} count (nearestObjects [player, ["Man"], 10])) >= 1) then {["exp", 2] call ica_fnc_arrayExp};
			
			if ((player distance ([campolicia2, campolicia3, campolicia4] call ica_fnc_masCercano)) < 4) then {
				["exp", 1] call ica_fnc_arrayExp;
			};
			if (vehicle player != player && speed player > 0) then {
				["exp", 3] call ica_fnc_arrayExp;
			};
			miTurnoPoli = miTurnoPoli + 1;
			
			sleep 240;
		};
	};
};

if (side player isEqualTo independent) then {
	miTurnoEMS = 0;
	
	0 spawn {
		while {true} do {
			if (({side _x == CIVILIAN} count (nearestObjects [player, ["Man"], 10])) >= 1) then {["exp", 2] call ica_fnc_arrayExp};
			
			if ((player distance ([medic_spawn_4, medic_spawn_2, salidaHospitalC] call ica_fnc_masCercano)) < 4) then {
				["exp", 3] call ica_fnc_arrayExp;
			};
			if (vehicle player != player && speed player > 0) then {
				["exp", 5] call ica_fnc_arrayExp;
			};
			miTurnoEMS = miTurnoEMS + 1;
			
			sleep 240;
		};
	};
};
