/*
	File: fn_racingResponse.sqf
	Author: Akryllax
	Desc:
*/

private["_mode", "_trackID", "_args"];

_mode = [_this, 0, -1, [-1]] call BIS_fnc_param;
_trackID = [_this, 1, "",[""]] call BIS_fnc_param;
_args = [_this, 2, [], [[]]] call BIS_fnc_param;
switch (_mode) do {

	case 0: { //Create and join session
		[_trackID] call life_fnc_loadTrack;
		[_trackID, [_trackID] call life_fnc_loadVehicle] call life_fnc_startRace;
	};

	case 1: { //Join session
		[_trackID] call life_fnc_loadTrack;
		[_trackID, [_trackID] call life_fnc_loadVehicle] call life_fnc_startRace;
	};
	
	case 2: { //Can't join, already in race.
		hint "Ya estas en una carrera!";
	};
	
	case 3: { //Can't join, already started.
		hint "La carrera ya ha empezado, espera a que acabe.";
	};
	
	case 4: { //Finished
		_pay = [_args, 0, -1,[-1]] call BIS_fnc_param;
		_pos = [_args, 1, -1,[-1]] call BIS_fnc_param;
		
		_medalla = switch (_pos) do {
			case 0: { "Oro" };
			case 1: { "Plata" };
			case 2: { "Bronce" };
			default { "none" };
		};
		
		if(_medalla isEqualTo "none") then {
			hint parseText "<t color='#FF0000' size='1.5'>HAS PERDIDO</t>";
		} else {
			hint parseText format["<t color='#FF0000' size='1.5'>FINALIZADO</t><br/>Has obtenido una medalla de %1, y has ganado %2", _medalla, _pay];
		};
	};
	
	default { //Error escape.
		hint format["Error: _mode '%1'\n_trackID '%2'", _mode, _trackID];
	};

};