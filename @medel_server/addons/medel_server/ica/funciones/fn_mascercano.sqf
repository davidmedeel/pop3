
/*
por: Icaruk
params:

	0: ARRAY / OBJECT - lista de objetos a medir distancia con player / obj de referencia
	1: ARRAY (opcional) - lista de objetos si se ha usado un obj de referencia
	
	["mrk1", "mrk2", "mrk3"] call ica_fnc_masCercano;
	[obj1, obj2, obj3] call ica_fnc_masCercano;
	[objRef ["mrk1", "mrk2"]] call ica_fnc_masCercano;
*/	

private "_fin";
_array = _this;
_quien = player;

if ((count _this) >= 2) then {
	if ((typeName (_this select 1)) == "ARRAY") then {
		_quien = _this select 0;
		_array = _this select 1;
	};
};

_distancias = [];
{_distancias pushBack (_quien distance ([_x] call ica_fnc_getPos))} forEach _array;
_cerca = _distancias call BIS_fnc_lowestNum;

_idx = 0;
while {_idx < (count _distancias)} do {
	if ((_quien distance ([_array select _idx] call ica_fnc_getPos)) == _cerca) exitWith {
		_fin = (_array select _idx);
	};

	_idx = _idx + 1;	
};
_fin
