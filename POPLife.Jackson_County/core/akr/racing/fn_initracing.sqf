/*
	File: fn_initRacing.sqf
	Author: Akryllax
	Desc: Loads tracks to array and sets up some stuff.
*/

// [raceID, false]
racing_tracks = [];

/*
	[
		[
			raceID,
			status,
			[
				racers
			]
		]
	]
	
 */
racing_current = [];
racing_lastCP = 0;

if(isServer) then {
	racing_statuses = ["none", "waiting", "racing", "finished"];
	
	_i = 1;
	_marker = format["race_%1%2_001", if(_i > 9) then [{""}, {"0"}], _i];

	while {!(getMarkerPos _marker isEqualTo [0,0,0])} do {
		_name = format["race_%1%2", if(_i > 9) then [{""}, {"0"}], _i];
		racing_tracks pushBack [_name, false];
		diag_log format["Adding %1 to racing_current", _name];
		racing_current pushBack [_name, 0, []];
		
		_i = _i + 1;
		_marker = format["race_%1%2_001", if(_i > 9) then [{""}, {"0"}], _i];
	};

	publicVariable "racing_tracks";
	publicVariable "racing_current";
} else {
	currentTrack = [];
	currentTrackOrbs = [];
	currentTrackHelperOrbs = [];
};