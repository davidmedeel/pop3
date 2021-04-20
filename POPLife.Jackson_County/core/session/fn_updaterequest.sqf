/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_civPosition"];
_packet = [getPlayerUID player,(profileName),playerSide,medel_din,medel_atmdin];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"op"}; };
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
_packet pushBack experiencia;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

_packet remoteexec ["DB_fnc_updateRequest",2];
