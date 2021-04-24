
/*
por: Medel
	
Params:
	0: ANY	 	- Referencia.
	1: STRING	- Qué comparar: "nombre" o "uid".

Ejemplos:	
	["Medel", "nombre"] call ica_fnc_online;
	["76561198844937661", "uid"] call ica_fnc_online;

Devuelve:
	OBJ - Objeto si existe, objNull si no existe.
*/

private _ref = param [0];
private _var = param [1];

private _tio = objNull;

_fnc_getRef = switch (_var) do {
	case "nombre": {{name _x}};
	case "uid": {{getPlayerUID _x}};
};

{
if (_ref isEqualTo (call _fnc_getRef)) exitWith {_tio = _x};
} forEach allPlayers;

_tio
