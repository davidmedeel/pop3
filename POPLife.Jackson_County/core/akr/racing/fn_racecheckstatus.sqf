/*
	File: fn_raceCheckStatus.sqf
	Author: Akryllax
	Desc: Checks array status.
*/

private["_trackID"];

_trackID = [_this,0,"",[""]] call BIS_fnc_param;

if(count _trackID == 0) exitWith { -1};

_size = count racing_current;
_found = -1;

diag_log "###########################################";
diag_log format["# Checking racing status of '%1' #", _trackID];


for "_i" from 0 to (_size - 1) do {
	
	_temp = racing_current select _i;
	diag_log format["# Checking _temp='%1'", _temp];
	if(_trackID in _temp) then {
		_found = _temp select 1;
	};
};

diag_log "# End of check							#";
diag_log "###########################################";

_found