
/*
por: Icaruk

Se carga y guarda en fn_guardaCargaMed
	["init"] spawn ica_fnc_organos;
	["opero", "ojo"] spawn ica_fnc_organos;
	["opero", "cor"] spawn ica_fnc_organos;
	["opero", "est"] spawn ica_fnc_organos;
*/

_param = param [0];
_que = param [1];

if (_param isEqualTo "init") exitWith {
	if (isnil {orgini}) then {
		orgini = true;
		while {true} do {
			_var = player getVariable "organos";

			if !(_var select 0) then { // ojos
				0 spawn {
					cutText ["","BLACK OUT",5];
					sleep 5;
					cutText ["","BLACK IN",5];
				};
			};

			if !(_var select 1) then { // estómago
				player setFatigue 1;
			};

			// lo del estómago afecta a fn_comoBebo

			sleep 10;
		};
	};
};

if (_param isEqualTo "opero") exitWith {
if (!isNil {ocupado}) exitWith {};
	0 spawn {
	  ocupado = true;
	   sleep 16;
	  ocupado = nil;
	};

	_cercania = nearestObjects [getPos player, ["Man"], 4];
	if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca"};
	if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador"};

	private ["_pongo", "_fuera", "_idx", "_item"];
	if (side player == INDEPENDENT) then { // pongo o quito órgano?
		_pongo = true;
	} else {
	if !((["pop_bisturi_item"] call ica_fnc_tengo) >= 1) exitWith {hint "Necesitas un bisturí para operar a alguien"; _fuera = true};
		_pongo = false;
	};

	if (!isNil {_fuera}) exitWith {};

	_seleccion = param [1];
	if (isNil {_seleccion}) exitWith {hint "Error, seleccion nil"};
	switch (_seleccion) do { // elijo la parte a operar y el item necesario/que me darán
		case "ojo": {_idx = 0; _item = "pop_ojos_item"};
		case "cor": {_idx = 1; _item = "pop_corazon_item"};
		case "est": {_idx = 2; _item = "pop_estomago_item"}; // esto es estomago pero no hay objeto aun cambiar despues
	};

	if (_pongo) then {
		if (([_item] call ica_fnc_tengo) < 1) exitWith {hint "Necesitas el órgano de algún donante"; _fuera = true};
	} else {
		if !(((_cercania select 1) getVariable "organos") select _idx) exitWith {hint "Esa persona no tiene lo que le quieres quitar."; _fuera = true};
	};

	if (!isNil {_fuera}) exitWith {};

	[15, "Operando..."] call ica_fnc_barrita;
	sleep 15;

	_cercania = nearestObjects [getPos player, ["Man"], 4];
	if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca"};
	if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador"};

	_array = (_cercania select 1) getVariable "organos";
	_array set [_idx, _pongo];
	(_cercania select 1) setVariable ["organos", _array, true];

	if !(_pongo) then { // gano o pierdo item según lo que haya operado
		[_item] call ica_fnc_item;
		hint format ["Has extirpado un %1", [_item] call ica_fnc_classToname];
	} else {
		[_item, -1] call ica_fnc_item;
		hint format ["Has transplantado un %1", [_item] call ica_fnc_classToname];
	};
};
/*
switch (_que) do
{
	case "ojo":
	{
		_cercania = nearestObjects [getPos player, ["Man"], 4];
		if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca"};
		if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador"};

		if (side player == INDEPENDENT) then {
		if ((["pop_ojos_item"] call ica_fnc_tengo) < 1) exitWith {hint "Necesitas el órgano de algún donante";};

        _quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [0,true];
		_quien setVariable ["organos", _array, true];
		["pop_ojos_item",-1] call ica_fnc_item;

		} else {

		if !((["pop_bisturi_item"] call ica_fnc_tengo) >= 1) exitWith {
			hint "Necesitas un bisturí para operar a alguien";};

		_quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [0,false];
		_quien setVariable ["organos", _array, true];
		["pop_ojos_item",1] call ica_fnc_item;
		};
	};
	case "cor":
	{
		_cercania = nearestObjects [getPos player, ["Man"], 4];
		if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca"};
		if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador"};

		if (side player == INDEPENDENT) then {
		if ((["pop_corazon_item"] call ica_fnc_tengo) < 1) exitWith {hint "Necesitas el órgano de algún donante";};

        _quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [1,true];
		_quien setVariable ["organos", _array, true];
		["pop_corazon_item",-1] call ica_fnc_item;

		} else {

		if !((["pop_bisturi_item"] call ica_fnc_tengo) >= 1) exitWith {
			hint "Necesitas un bisturí para operar a alguien";};

		_quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [1,false];
		_quien setVariable ["organos", _array, true];
		["pop_corazon_item",1] call ica_fnc_item;
		};
	};
	case "est":
	{
		_cercania = nearestObjects [getPos player, ["Man"], 4];
		if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca"};
		if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador"};

		if (side player == INDEPENDENT) then {
		if ((["pop_estomago_item"] call ica_fnc_tengo) < 1) exitWith {hint "Necesitas el órgano de algún donante";};

        _quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [2,true];
		_quien setVariable ["organos", _array, true];
		["pop_estomago_item",-1] call ica_fnc_item;

		} else {

		if !((["pop_bisturi_item"] call ica_fnc_tengo) >= 1) exitWith {
			hint "Necesitas un bisturí para operar a alguien";};

		_quien = (_cercania select 1);
		_array = _quien getVariable "organos";
		_array set [2,false];
		_quien setVariable ["organos", _array, true];
		["pop_estomago_item",1] call ica_fnc_item;
		};
	};
	default
	{
		hint "Que haces aqui???¿?¿?";
	};
};