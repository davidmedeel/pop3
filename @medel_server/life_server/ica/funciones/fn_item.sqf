
/*
por: Icaruk

Params:
	0: STRING - classname
	1: SCALAR (opcional) - cantidad positiva añadir, negativa quitar. Default 1.

Funciones:
	- Equipa o añade un objeto al jugador sin importar de qué tipo sea sin sobreescribir el actual.
	- Elimina un objeto del jugador sin importar si lo tiene equipado o en el inventario.
	- Devuelve el tipo de objeto: "PWea", "SWea", "HWea", "Mag", "Ite", "Uni", "Ves" o "Bac".

Se invoca con
	["classname"] call ica_fnc_item		// te da el objeto 1 vez y te devuelve true mientras te quepa
	["classname", cantidad] call ica_fnc_item		// te da el objeto X veces y te devuelve true mientras te quepa
	["classname", cantidad] call ica_fnc_item	// elimina el objeto X veces
	"classname" call ica_fnc_item 				// te devuelve el tipo de objeto
*/
/*

#define WeaponSlotPrimary        1        // primary weapons
#define WeaponSlotHandGun        2        // HandGun
#define WeaponSlotSecondary        4        // secondary weapons
#define WeaponSlotHandGunItem        16 // HandGun magazines
#define WeaponSlotItem                256        // items
#define WeaponSlotBinocular        4096        // binocular
#define WeaponHardMounted        65536
#define WeaponSlotInventory 131072 // inventory items
*/


private ["_modo", "_class", "_cantidad", "_queEs", "_creaItem"];

// elijo qué quiero hacer con la función
if ((typeName _this) == "ARRAY") then {
	_class = _this select 0;
	_cantidad = param [1, 1]; // si no hay cantidad pongo 1
	_modo = if (_cantidad > 0) then {true} else {false}; // positivo true, negativo false
	_cantidad = [_cantidad] call ica_fnc_negToPos;
};
if ((typeName _this) == "STRING") then {
	_class = _this;
	_modo = true; // para que no de error
	_cantidad = ""; // lo convierto en string para que en la lin90 me devuelva el tipo de objeto
};

if ((typeName _modo) != "BOOL") exitWith {}; // ¿qué haces?
if (isNil {_class}) exitWith {}; // no me has dado param

if (isClass (configFile >> "CfgWeapons" >> _class)) then {

	if ((getNumber (configFile >> "CfgWeapons" >> _class >> "type")) == 131072) then {
		_queEs = "Ite";
	};
	if ((getnumber (configFile >> "CfgWeapons" >> _class >> "type")) == 1) exitWith {
		_queEs = "PWea";
	};
	if ((getnumber (configFile >> "CfgWeapons" >> _class >> "type")) == 4) exitWith {
		_queEs = "SWea";
	};
	if ((getnumber (configFile >> "CfgWeapons" >> _class >> "type")) == 2) exitWith {
		_queEs = "HWea";
	};
	if ((getnumber (configFile >> "CfgWeapons" >> _class >> "iteminfo" >> "type")) == 701) exitWith {
		_queEs = "Ves";
	};
	if ((getnumber (configFile >> "CfgWeapons" >> _class >> "iteminfo" >> "type")) == 801) exitWith {
		_queEs = "Uni";
	};
	if (isNil {_que_es}) then {_queEs = "Ite"}; // por cojones es item
};

if (isClass (configFile >> "CfgMagazines" >> _class)) then { // si es cargador
	if (getNumber (configFile >> "CfgMagazines" >> _class >> "type") == 0) then {
		_queEs = "Mag";
	} else {
		_queEs = "Ite";
	};
};

if (isClass (configFile >> "CfgVehicles" >> _class)) then { // si es veh
	_queEs = getText (configFile >> "CfgVehicles" >> _class >> "vehicleClass");
	
	if (_queEs == "Backpacks") exitWith {_queEs = "Bac"};
	if (_queEs == "MenSniper") exitWith {_queEs = "Uni"};
	if ((getNumber (configFile >> "CfgVehicles" >> _class >> "maxspeed")) > 0) then {_queEs = "Veh"};
};

if ((typeName _cantidad) == "STRING") then {
	_queEs
} else {
	if (_modo) then { // true es añadir, false es quitar, obviamente.
		for "_x" from 1 to _cantidad do {
			switch (toLower _queEs) do {
				case "pwea": {
					if ((primaryWeapon player) == "") then { // si aún no tengo arma, me la equipo
						player addWeapon _class;
					} else {
						_creaItem = true; // si ya tengo arma, la pongo más tarde en la mochila. Y lo mismo con el resto
					};
				};
				case "swea": {
					if ((secondaryWeapon player) == "") then {
						player addWeapon _class;
					} else {
						_creaItem = true;
					};
				};
				case "hwea": {
					if ((handGunWeapon player) == "") then {
						player addWeapon _class;
					} else {
						_creaItem = true;
					};
				};
				case "mag": {
					player addMagazine _class;
				};
				case "ite": {
					_creaItem = true;
				};
				case "uni": {
					if ((uniform player) == "") then {
						player forceAddUniform _class;
					} else {
						_creaItem = true;
					};
				};
				case "ves": {
					if ((vest player) == "") then {
						player addVest _class;
					} else {
						_creaItem = true;
					};
				};
				case "bac": {
					player addBackpack _class;
				};
			};

			if !(isNil {_creaItem}) then { // si he dejado algo para más tarde, ahora es el momento
				if !(player canAdd _class) exitWith {false}; // no me cabe, devuelvo false
				player addItem _class;
				true // me cabe, devuelvo true
			};
		}; // for
	} else {
		for "_x" from 1 to _cantidad do {
			switch (toLower _queEs) do {
				case "pwea": {
					if ((primaryWeapon player) == "") then { // si no tengo el arma equipada, la borro del inventario
						_creaItem = true;
					} else {
						if ((primaryWeapon player) == _class) then {player removeWeapon _class}; // si la equipada coincide, la borro
					};
				};
				case "swea": {
					if ((secondaryWeapon player) == "") then { // lo mismo con el resto
						_creaItem = true;
					} else {
						if ((secondaryWeapon player) == _class) then {player removeWeapon _class};
					};
				};
				case "hwea": {
					if ((handGunWeapon player) == "") then {
						_creaItem = true;
					} else {
						if ((handGunWeapon player) == _class) then {player removeWeapon _class};
					};
				};
				case "mag": {
					player removeMagazine _class;
				};
				case "ite": {
					_creaItem = true;
				};
				case "uni": {
					if ((uniform player) == "") then {
						_creaItem = true;
					} else {
						if ((uniform player) == _class) then {removeUniform player};
					};
				};
				case "ves": {
					if ((vest player) == "") then {
						_creaItem = true;
					} else {
						if ((vest player) == _class) then {removeVest player};
					};
				};
				case "bac": {
					if ((backpack player) == _class) then {removeBackpack player};
				};
			};

			if !(isNil {_creaItem}) then { // si he dejado algo para más tarde, ahora es el momento
				player removeItem _class;
			};
		}; // for
	}; // else
};

