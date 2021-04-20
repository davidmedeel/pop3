
/*
por: Icaruk y Warblast
	["loop"] spawn ica_fnc_posicion; 	// init
	[true] spawn ica_fnc_posicion;	// guardo
	[false] spawn ica_fnc_posicion;	// cargo
*/

_param = _this select 0;

private ["_pos", "_posVieja", "_posNueva"];

if ((typeName _param) != "BOOL") then {
	if (_param isEqualTo "loop") exitWith {
		while {true} do {
			sleep (60 * 5);
			[true] spawn ica_fnc_posicion;
		};
	};
};

if (_param) then {
	if (isNil {profileNamespace getVariable "noiposci"}) exitWith {
		_pos = getPosATL player;
		if (vehicle player != player) then { // estas en veh y te pongo a ras
			_pos set [2, 0];
			profileNamespace setVariable ["noiposci", _pos];
		} else {
			profileNamespace setVariable ["noiposci", _pos];
		};
	};

	_posVieja = profileNamespace getVariable "noiposci";
	_posNueva = getPosATL player;

	if ((profilenamespace getvariable "rutome") == 0) then {
		if ((_posVieja distance _posNueva) > 10) then {
			if (vehicle player != player) then { // estas en veh y te pongo a ras
				_posNueva set [2, 0];
				profileNamespace setVariable ["noiposci", _posNueva];
			} else {
				profileNamespace setVariable ["noiposci", _posNueva];
			};
		};
	};
} else {
	_pos = profileNamespace getVariable "noiposci";
	if ((profileNamespace getVariable "rutome") > 0) exitWith {
		profileNamespace setVariable ["noiposci", nil]; // en nigromante hago cosas con esto
	};
	if ((_pos distance (getMarkerPos (["respawn_civilian", "esperaAutobus", "isla"] call ica_fnc_masCercano))) < 150) then {
		_pos = getMarkerPos "salidahospitalc";
		profileNamespace setVariable ["noiposci", _pos];
	};

	waitUntil {(!isNull player) AND (player == player)};
	sleep 2;

	player setPosATL _pos;
	0 spawn {
		player allowDamage false;
		sleep 3;
		player allowDamage true;
	};

	[false, false] spawn ica_fnc_vistaBonita;
	heNacido = true;

   _handle = [] spawn life_fnc_inicio;
    waitUntil {scriptDone _handle};
};
