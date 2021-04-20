/*
	File: fn_showBadge.sqf
	Author: Akryllax
*/

private["_player", "_badgeNumber"];

_player = player;
_badgeNumber = getPlayerUID player;

_substring = {
	_string = [_this, 0, "", [""]] call BIS_fnc_param;
	_start = [_this, 1, -1, [-1]] call BIS_fnc_param;
	_end = [_this, 2, -1,[-1]] call BIS_fnc_param;
	
	_stringAr = toArray _string;
	_outAr = [];
	
	for "_i" from _start to _end do {
		_outAr pushBack (_stringAr select _i);
	};
	
	toString _outAr
};

if(showing_documentation) exitWith {};

hint "Has enseñado tu DNI";

showing_documentation = true;

{
	if(isPlayer _x && (player distance _x) < 5) then {
		if( _x != _player) then {
			[_player, ([_badgeNumber, (count _badgeNumber) - 7, (count _badgeNumber) - 1] call _substring)] remoteexeccall ["life_fnc_seeDNI", _x];
		};
	};
} forEach ((position _player) nearObjects["Man", 10]);

[] spawn {
	sleep 10;
	showing_documentation = false;
};