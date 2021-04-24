
/*
por: Icaruk
	0 spawn ica_fnc_initMineria;
*/

_minaLejana = [
	[1240.53,6703.39,233.194], [1227.65,6707.17,229.452], [1214.19,6712.96,228.549],
	[1206.62,6710.33,228.084], [1249.45,6714.81,233.966], [1235.29,6720.13,232.324]
];

_pos1 = [_minaLejana] call BIS_fnc_selectRandom;
_minaLejana = _minaLejana - [_pos1];
_pos2 = [_minaLejana] call BIS_fnc_selectRandom;


_minaCercana = [
	[5068.61,8779.92,283.34], [5054.89,8773.19,280.296], [5065.55,8751.65,278.705],
	[5075.96,8747,281.053], [5085.13,8756.13,281.605], [5083.36,8750.67,281.621]
];

_pos3 = [_minaCercana] call BIS_fnc_selectRandom;
_minaCercana = _minaCercana - [_pos3];
_pos4 = [_minaCercana] call BIS_fnc_selectRandom;

_pos = _pos1 + _pos2 + _pos3 + _pos4;

_idx = round random (count _pos);
menaCobre setPosASL (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaHierro setPosASL (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaOro setPosASL (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaPlatino setPosASL (_pos select _idx);
_pos = _pos - [_pos select _idx];
