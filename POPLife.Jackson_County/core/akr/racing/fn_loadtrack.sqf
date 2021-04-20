/*
	File: fn_loadTrack.sqf
	Author: Akryllax
	Desc: Whatever
*/

private["_trackID"];

_trackID = [_this, 0, "", [""]] call BIS_fnc_param;

if(count _trackID == 0) exitWith {};

_i = 1;
_mrkrName = format["%1_%2%3%4", _trackID, if(_i > 99) then [{""}, {"0"}], if(_i > 9) then [{""}, {"0"}], _i];

currentTrack = [];
currentTrackOrbs = [];
currentTrackHelperOrbs = [];

_oldName = "";

startLoadingScreen ["Cargando carrera..."];

while { !(getMarkerPos _mrkrName isEqualTo [0,0,0]) } do {

	progressLoadingScreen (_i / 128);
	
	[_oldName, _mrkrName] spawn {
		_oldName = _this select 0;
		_mrkrName = _this select 1;
		
		if(count _oldName == 0) exitWith {};
		
		_separation = 5;
		
		_vect = (getMarkerPos _oldName) vectorFromTo (getMarkerPos _mrkrName);
		_vect = _vect vectorMultiply _separation;
		_hlp = (getMarkerPos _oldName) vectorDistance (getMarkerPos _mrkrName);
		_base = getMarkerPos _oldName;
		while{_hlp > _separation} do {
			_base = _base vectorAdd _vect;
			_hOrb = "Sign_Sphere25cm_F" createVehicleLocal (_base);
			_hOrb setPos (getPos _hOrb vectorAdd [0,0,4]);
			_hlp = _hlp - (vectorMagnitude _vect);
			currentTrackHelperOrbs pushBack _hOrb;
		};
	};
	
	_locName = _mrkrName;
	currentTrack pushBack _locName;
	
	diag_log format["Added waypoint ""%1"" (%2): %3", _locName, _i, getMarkerPos _locName];
	
	_veh = "Sign_Sphere100cm_F" createVehicleLocal (getMarkerPos _locName);
	_veh enableSimulation false;
	_veh setPos ((getPos _veh) vectorAdd [0,0,4]);
	currentTrackOrbs pushBack _veh;
	
	_i = _i + 1;
	_oldName = _mrkrName;
	_mrkrName = format["%1_%2%3%4", _trackID, if(_i > 99) then [{""}, {"0"}], if(_i > 9) then [{""}, {"0"}], _i];
};

currentOrb = currentTrackOrbs select 0;