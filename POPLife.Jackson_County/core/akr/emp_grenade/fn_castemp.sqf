/*
	File: fn_castEMP.sqf
	Author: Akryllax
	Desc: Server-side EMP casting.
*/

private["_objects"];

_position = [_this, 0, [], []] call BIS_fnc_param;

if((count _position) == 0) exitWith {};

_objects = _position nearObjects 50;

_vehicles = [];
_men = [];
_players = [];

//Event Handlers
_vehEH = [];
{
	if(_x isKindOf "Man") then {
		_men pushBack _x;
		if(isPlayer _x) then {
			_players pushBack _x;
		};
	};
	if(_x isKindOf "AllVehicles") then {
		_vehicles pushBack _x;
		_crew = crew _x;
		if((count _crew) > 0) then {
			{
				if(isPlayer _x) then {
					_players pushBack _x;
				};
			} forEach (_crew);
		};
	};
} forEach (_objects);


//////////////////////////////// VEHICLES /////////////////////////////
AKR_stallEngine = {
	_vehicle = _this select 0;
	_state = _this select 1;
	
	_playedStall = _vehicle getVariable["lastPStall", 0];
	
	if(_state) then {
		_vehicle engineOn false;
		
		if(_playedStall + 1 < time) then {
			_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			_soundToPlay = _soundPath + "sounds\Stall.ogg";
			playSound3D [_soundToPlay, _vehicle, false, getPos _vehicle, 20, 1, 50]; //Volume db+10, volume drops off to 0 at 50 meters from _sourceObject
			_vehicle setVariable["lastPStall", time, true];
		};
	};
};

{
	if(isEngineOn _x) then {
		_x engineOn false;
	};

	_index = _x addEventHandler["Engine", life_fnc_stallEngine];
	_vehEH pushBack [_x, _index];
} forEach (_vehicles);

_vehEH spawn {
	sleep 60;
	{
		_veh = _x select 0;
		_ind = _x select 1;
		
		_veh removeEventHandler["Engine", _ind];
	} forEach (_this);
};
//////////////////////////////// VEHICLES /////////////////////////////
//////////////////////////////// PLAYERS  /////////////////////////////
{
	[] remoteexeccall ["life_fnc_recieveEMP", _x];
} forEach (_players);
//////////////////////////////// PLAYERS  /////////////////////////////