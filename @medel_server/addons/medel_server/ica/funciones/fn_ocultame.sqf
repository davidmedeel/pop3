
/*
por: Icaruk
params:
	0 - OBJECT: a quién oculto
	1 - BOOL: si o no
	2 - BOOL (opcional): modo admin
	
		[obj, true] call ica_fnc_ocultame;
		[obj, true, true] call ica_fnc_ocultame;
*/

private ["_obj", "_bool", "_admin"];

_obj = _this select 0;
_bool = _this select 1;
_admin = _this select 2;

if (!isNil {_admin}) exitWith {
	[_obj, !(isObjectHidden player)] remoteexeccall ["ica_fnc_ocultame",2];
	if (isNil {oculto}) then {oculto = true}else{oculto = nil};
};

if (!isServer) then {
	[_obj, _bool] remoteexeccall ["ica_fnc_ocultame",2];
} else {
	_obj hideObjectGlobal _bool;
};

