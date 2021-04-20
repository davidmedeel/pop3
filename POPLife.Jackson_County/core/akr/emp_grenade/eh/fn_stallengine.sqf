_vehicle = _this select 0;
_state = _this select 1;

_playedStall = _vehicle getVariable["lastPStall", 0];

_vehicle engineOn false;

if(_playedStall + 1 < time) then {
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sounds\Stall.ogg";
	playSound3D [_soundToPlay, _vehicle, false, getPos _vehicle, 20, 1, 50]; //Volume db+10, volume drops off to 0 at 50 meters from _sourceObject
	_vehicle setVariable["lastPStall", time, true];
};

[_vehicle] remoteexeccall ["life_fnc_shutdownCar", crew _vehicle];