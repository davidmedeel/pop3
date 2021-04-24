
/*
Sirve para sacar posiciones de objetos o markers
Se invoca con:
	["mrk1"] call ica_fnc_getPos;
	[obj] call ica_fnc_getPos;
	[obj, 1] call ica_fnc_getPos; // getPosASL con altura
*/	

private ["_pos", "_modo"];
_ref = _this select 0;
_modo = _this select 1;

if (isNil {_ref}) exitWith {}; // ¿para qué me llamas?
if (isNil {_modo}) then {_modo = 0};

if ((typeName _ref) == "STRING") then {
	_pos = getMarkerPos _ref;
};
if ((typeName _ref) == "OBJECT") then {
	switch (_modo) do {
		case 0: {_pos = getPos _ref};
		case 1: {_pos = getPosASL _ref};
	};
};

_pos
