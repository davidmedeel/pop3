	
/*
por: Medel
*/

if (deServicio == 0) exitwith {};

_distancia = 5;

_veh = vehicle player;

if (local _veh) then {
	_dir = getdir _veh;
	if (surfaceIsWater position _veh) then {
		_pos = getPosASL _veh;
		_pos = [(_pos select 0) + _distancia * sin(_dir), (_pos select 1) + _distancia * cos(_dir),(_pos select 2)];
		_veh setPosASL _pos;
} else {
	_pos = getPosATL _veh;
	_pos = [(_pos select 0) + _distancia * sin(_dir), (_pos select 1) + _distancia * cos(_dir),(_pos select 2)];
	_veh setPosATL _pos;
	};
};
