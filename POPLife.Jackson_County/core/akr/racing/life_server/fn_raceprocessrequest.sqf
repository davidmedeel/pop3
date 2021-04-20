/*
	File: fn_raceProcessRequest.sqf
	Author: Akryllax
	Desc: Adds a track to the tracker.
*/

private["_trackID", "_racer"];

_trackID = [_this, 0, "",[""]] call BIS_fnc_param;
_racer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

diag_log "# 'raceProcessRequest' triggered";
diag_log format["# _trackID '%1'", _trackID];
diag_log format["# _racer '%1'", _racer];

_status = [_trackID] call life_fnc_raceCheckStatus;
diag_log format["# Checking status of %1: %2", _trackID, _status];

if(_status < 0) exitWith { hint "Error in raceTAdd" };

if(_status < 2 && !(player getVariable["inRace", false])) then {
	[_status, _trackID] remoteexeccall ["life_fnc_racingResponse", _racer];
} else {
	hint "Carrera no disponible";
};