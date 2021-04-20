/*
	File: fn_raceTracker.sqf
	Author: Akryllax
	Desc:
*/

_this spawn {

	private["_trackID", "_racer"];

	_trackID = [_this, 0, "", [""]] call BIS_fnc_param;
	_racer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	
	_startTime = time;
	
	waitUntil {! _racer getVariable["inRace", false]};
	_finished = player getVariable["raceFinished", false];
	
	_raceTime = time - _startTime;

	_conf = [_trackID] call life_fnc_raceConf;
	
	if(_finished) then {
		
	};
	
};