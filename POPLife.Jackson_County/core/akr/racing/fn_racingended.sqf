/*
	File: fn_racingEnded.sqf
	Author: Akryllax
*/

[] spawn { //Clear stuff
	sleep 1;
	{ deleteVehicle _x; } forEach currentTrackOrbs;
	{ deleteVehicle _x } forEach currentTrackHelperOrbs;
	currentTrack = "";
	currentTrackOrbs = [];
	currentTrackHelperOrbs = [];
};

_this spawn {
	private["_raceID"];

	_trackID = [_this, 0, "",[""]] call BIS_fnc_param;
	_exited = [_this, 1, false, [false]] call BIS_fnc_param;
	
	
	inRace = false;
	player setVariable["inRace",inRace, true];
	
	if (_exited) exitWith {};

	player setVariable["raceFinished", true, true];
	
	_finishTime = time - raceStartTime;
	raceStartTime = 0;
	
	_raceConfig = [_trackID] call life_fnc_raceConf;
	
	_mode = _raceConfig select 0;
	_price = _raceConfig select 1;
	
	switch (_mode) do {
		case 0: {
			_firstCond = _raceConfig select 2;
			_secondCond = _raceConfig select 3;
			_thirdCond = _raceConfig select 4;
			
			_medalla = "";
			_premio = 0;
			
			if(_finishTime < (_firstCond select 1)) then {
				_medalla = "Oro";
				_premio = _firstCond select 0;
			} else {
				if(_finishTime < (_secondCond select 1)) then {
					_medalla = "Plata";
					_premio = _secondCond select 0;
				} else {
					if(_finishTime < (_thirdCond select 1)) then {
						_medalla = "Bronce";
						_premio = _thirdCond select 0;
					};
				};
			};
			
			if(count _medalla == 0) then {
				hint parseText "<t color='#FF0000' size='1.5'>HAS PERDIDO</t>";
			} else {
			
				_color = switch (_medalla) do {
					case "Oro": {"#E6D525"};
					case "Plata": {"#C9C9C9"};
					case "Bronce": {"#965D0C"};
				};
			
				hint parseText format["<t color='#00FF00' size='1.5'>HAS GANADO</t><br/><t color='%3' size='1.5'>%1</t><br/><t align='left'>Has ganado %2€</t>", _medalla, _premio, _color];
				medel_din = medel_din + _premio;
			};
		};
		
		case 1: {
			_firstCond = _raceConfig select 2;
			
			if(vehicle player != player) then {
				(vehicle player) setFuel 0;
			};
			
			if(_finishTime < (_firstCond select 1)) then {
				hint "Has finalizado correctamente la prueba Ya tienes el Permiso B";
				missionNamespace setVariable[("license_civ_driver"),true];
				_coche = vehicle player;
				_coche setFuel 0;
				player allowDamage false;
				[_coche, [0, 0, 1]] call ica_fnc_setVelocityRas;
				deletevehicle _coche;
				sleep 1;
				player setPos getMarkerPos "finCarnet";
				player allowDamage true;
			} else {
				hint parseText "<t color='#F00'>No has pasado la prueba</t>";
				_coche = vehicle player;
				_coche setFuel 0;
				player allowDamage false;
				[_coche, [0, 0, 1]] call ica_fnc_setVelocityRas;
				deletevehicle _coche;
				sleep 1;
				player setPos getMarkerPos "finCarnet";
				player allowDamage true;
			};
		};
		case 2: {
			_firstCond = _raceConfig select 2;
			
			if(vehicle player != player) then {
				(vehicle player) setFuel 0;
			};
			
			if(_finishTime < (_firstCond select 1)) then {
				hint "Has finalizado correctamente la prueba. Ya tienes el carnet de camion.";
				missionNamespace setVariable[("license_civ_truck"),true];
				_coche = vehicle player;
				_coche setFuel 0;
				player allowDamage false;
				[_coche, [0, 0, 1]] call ica_fnc_setVelocityRas;
				deletevehicle _coche;

				player setPos _posicion;
				player allowDamage true;
			} else {
				hint parseText "<t color='#F00'>No has pasado la prueba</t>";
				_coche = vehicle player;
				_coche setFuel 0;
				player allowDamage false;
				[_coche, [0, 0, 1]] call ica_fnc_setVelocityRas;
				deletevehicle _coche;

				player setPos _posicion;
				player allowDamage true;
			};
		};
	};
};
