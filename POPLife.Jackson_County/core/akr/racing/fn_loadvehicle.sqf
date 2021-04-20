/*
	Whatever
*/

private["_raceID"];

_this spawn {
	_raceID = [_this, 0, "", [""]] call BIS_fnc_param;

	if(count _raceID == 0) exitWith {};

	_spawnPos = getMarkerPos (format["%1_spawn", _raceID]);

	if(count currentTrack == 0) exitWith { hint "Tack not loaded correctly"; };

	_temp = ((_spawnPos) vectorFromTo getMarkerPos (currentTrack select 0));
	_dir = (_temp select 0) atan2 (_temp select 1);

	_veh = if (_raceID == "race_03") then {"pop_Man_TGX_negro"} else {"pop_308_autoescuela_abril"};
	
	_car = _veh createVehicle _spawnPos;
	_car setDir _dir;
	_car setFuel 0;
	_car addEventHandler["GetOut", {
			_this spawn {
				sleep 1;
				deleteVehicle (_this select 0);
				["", true] call life_fnc_racingEnded;
			}
		}
	];
	
	_arr = "Sign_Arrow_Direction_F" createVehicleLocal (position _car);
	_arr attachTo [_car, [0,0,1.2]];

	["RaceArrow", "onEachFrame", {
		_car = _this select 0;
		_arr = _this select 1;
		_fromTo = ((position _car) vectorFromTo (position currentOrb));	
		_arr setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _car);
		if(isNull _car) then { deleteVehicle _arr};
	}, [_car, _arr]] call BIS_fnc_addStackedEventHandler;
	_arr spawn {
		waitUntil {!inRace || !(alive player) || player getVariable["raceFinished",false]};
		["RaceArrow", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		deleteVehicle _this;
	};
	
	player moveInDriver _car;
	
	endLoadingScreen;
	
	_car
};