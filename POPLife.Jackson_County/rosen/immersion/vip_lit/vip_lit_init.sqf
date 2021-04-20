/*
	Author: voiper
	
	Description: Initialise map/flashlight/NVG features of LIT.
	
	Parameters: 
		0: Bool; whether to leave these scripts on after player dies; default false.
		1: Map Subtractions Array (leave empty to disable):
			0: Bool; whether to remove "Show player on map" button; default true.
			1: Bool; whether to remove and disable map textures; default true.
			2: Bool; whether to remove cursor grid ref; default true.
			3: Bool; whether to use alternative cursor type; default true.
		2: Map Additions Array (leave empty to disable): 
			0: Scalar: flashlight size to use (0 = normal, 1 = large); default 0.
			1: Bool: whether to enable NVG on map; default true.
			2: Bool: whether player starts with flashlight item; default true.
		3: NVG Array (leave empty to disable):
			0: Array (leave empty to disable):
				0: Scalar; max viewdistance of NVG; default 1000.
			1: Bool; whether to enable NVG grain; default true.
			2: Bool; whether to turn off NVG when using non-collimator optics; default true.
	
	Returns:
		None
*/

if (isDedicated) exitWith {};

//prevent accidental duplication
if (!isNil "vip_lit_var_cl_init") exitWith {diag_log "WARNING (vip_lit): Attempted to reinitialise."};
vip_lit_var_cl_init = true;

_respawn = [_this, 0, false, [true]] call bis_fnc_param;
_mapSubs = [_this, 1, [true, true, true, true], [[]]] call bis_fnc_param;
_mapAdds = [_this, 2, [0, true, true], [[]]] call bis_fnc_param;
_nvg = [_this, 3, [[1000], true, true], [[]]] call bis_fnc_param;

waitUntil {!isNull player};

[if (count _mapSubs > 0) then {_mapSubs} else {[false, false, false, false]}, if (count _mapAdds > 0) then {_mapAdds} else {[]}, if (count _nvg > 0) then {_nvg} else {[[], false, false]}] call vip_lit_fnc_cl_diary;
if (count _mapSubs > 0) then {_scriptMapSubs = [_respawn, _mapSubs] execVM "rosen\immersion\vip_lit\vip_lit_mapSubtractions.sqf"; waitUntil {scriptDone _scriptMapSubs}};
if (count _mapAdds > 0) then {_scriptMapAdds = [_respawn, _mapAdds] execVM "rosen\immersion\vip_lit\vip_lit_mapAdditions.sqf"; waitUntil {scriptDone _scriptMapAdds}};
if (count _nvg > 0) then {[_respawn, _nvg] call compile preProcessFileLineNumbers "rosen\immersion\vip_lit\vip_lit_NVG.sqf"};