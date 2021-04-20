
/*
por: Icaruk

Función: devuelve el número de objetos con la classname X que tengo
Params:
	0: STRING - classname a buscar
	1: BOOL - false (default) para unidad, true para vehículo
	
	["ItemRadio"] call ica_fnc_tengo
	["ItemRadio", true] call ica_fnc_tengo // devuelve items veh actual

	returns: SCALAR
*/

private ["_item", "_veh", "_equipo", "_cargo", "_fin"];

_item = _this select 0;
_veh = param [1, false];

if !(_veh) then {
	_equipo = items player + weapons player + magazines player;
	_fin = {_item == _x} count _equipo;
} else {
	_cargo = itemCargo vehicle player + weaponCargo vehicle player + magazineCargo vehicle player;
	_fin = {_item == _x} count _cargo;
};

_fin
