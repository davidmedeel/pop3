#include <macro.h>
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something with vehicle purchasing.
*/
private ["_mode", "_spawnPoints", "_className", "_basePrice", "_colorIndex", "_spawnPoint", "_vehicle", "_frais", "_prixcb", "_gangbank", "_cash", "_secure"];
_mode = _this select 0;
if ((lbCurSel 2302) == -1) exitWith {hint "No ha seleccionado ningun vehiculo!"};
_className   = lbData [2302, (lbCurSel 2302)];
_vIndex	     = lbValue [2302, (lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice   = (_vehicleList select _vIndex) select 1;
if (_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue [2304, (lbCurSel 2304)];
// Series of checks (YAY!)
if (_basePrice < 0) exitWith {};// Bad price entry
if (!( [_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint "no tiene el permiso requerido!"};
_frais	  = _basePrice * 0.05;	// 5% de frais bancaire
_prixcb	  = _basePrice + _frais;
_cash	  = 0;
_secure	  = 0;
_gangbank = (grpPlayer getVariable "gang_bank");
if (isNil "_gangbank") then {_gangbank = 0;
	};
if ((life_inv_cb == 0) && (putakumeak_din < _basePrice)) exitWith {hint "no tiene suficiente dinero en efectivo y no tiene tarjeta de credito !"};
_spawnPoints = life_veh_shop select 1;
_spawnPoint  = "";
if ((life_veh_shop select 0) == "med_air_hs") then {
		if (count(nearestObjects [(getMarkerPos _spawnPoints), ["Air"], 35]) == 0) exitWith {_spawnPoint = _spawnPoints};
	} else {
		// Check if there is multiple spawn points and find a suitable spawnpoint.
		if (typeName _spawnPoints == typeName []) then {
				// Find an available spawn point.
				{if (count(nearestObjects [(getMarkerPos _x), ["Car", "Ship", "Air"], 5]) == 0) exitWith {_spawnPoint = _x};
				} foreach _spawnPoints;
			} else {
				if (count(nearestObjects [(getMarkerPos _spawnPoints), ["Car", "Ship", "Air"], 5]) == 0) exitWith {_spawnPoint = _spawnPoints};
			};
	};
if (_spawnPoint == "") exitWith {hint "Actualmente hay un vehiculo que bloquea el garaje !"};
if ((_gangbank >= _prixcb) && (life_inv_cb > 0)) then {
		_action = [format ["DINERO DE LA MAFIA : <t color='#8cff9b'>%1$</t><br/>CUENTA BANCARIA : <t color='#8cff9b'>%5$</t><br/>EFECTIVO : <t color='#8cff9b'>%2$</t><br/><br/>Efectivo : <t color='#8cff9b'>%3$</t><br/>Tarjeta : <t color='#8cff9b'>%4$</t>",
				   [(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				   [putakumeak_din] call life_fnc_numberText,
				   [_basePrice] call life_fnc_numberText,
				   [_prixcb] call life_fnc_numberText,
				   [askomaite_atmdin] call life_fnc_numberText
			   ],
			   "Comprar con el dinero de la Mafia?",
			   "Si",
			   "Mi dinero"
		] call BIS_fnc_guiMessage;
		if (_action) then {
				_owner = (grpPlayer getVariable "gang_owner");
				[0, format ["El vehiculo %1 fue comprado por %3 por el Precio %2$ Con el dinero de la Mafia", getText(configFile >> "CfgVehicles" >> _className >> "displayName"), [_prixcb] call life_fnc_numberText, name player]] remoteexeccall ["life_fnc_broadcast", _owner];
				_funds = grpPlayer getVariable "gang_bank";
				_funds = _funds - _prixcb;
				grpPlayer setVariable ["gang_bank", _funds, true];
				[1, grpPlayer] remoteexeccall ["TON_fnc_updateGang",2];
				_secure = 1;
			} else {
				_action = [format ["CUENTA BANCARIA : <t color='#8cff9b'>%1$</t><br/>EFECTIVO : <t color='#8cff9b'>%2$</t><br/><br/>Efectivo : <t color='#8cff9b'>%3$</t><br/>Tarjeta : <t color='#8cff9b'>%4$</t>",
						   [askomaite_atmdin] call life_fnc_numberText,
						   [putakumeak_din] call life_fnc_numberText,
						   [_baseprice] call life_fnc_numberText,
						   [_prixcb] call life_fnc_numberText
					   ],
					   "Eliga la forma de pago",
					   "Tajeta",
					   "Efectivo"
				]   call BIS_fnc_guiMessage;
				if (_action) then {
						if (_prixcb > askomaite_atmdin) exitWith {hint "no tiene suficiente dinero en su cuenta !"};
						askomaite_atmdin = askomaite_atmdin - _prixcb;
						_secure	     = 1;
					} else {
						if (_basePrice > putakumeak_din) exitWith {hint "no tiene suficiente dinero en efectivo !"};
						if (putakumeak_din >= _basePrice) then {
								putakumeak_din = putakumeak_din - _basePrice;
								_cash	  = 1;
								_secure	  = 1;
							};
					};
			};
	} else {
		if ((life_inv_cb == 0)) then {
				putakumeak_din = putakumeak_din - _basePrice;
				_cash	  = 1;
				_secure	  = 1;
			} else {
				_action = [format ["CUENTA BANCARIA : <t color='#8cff9b'>%1$</t><br/>EFECTIVO : <t color='#8cff9b'>%2$</t><br/><br/>Efectivo : <t color='#8cff9b'>%3$</t><br/>Tarjeta : <t color='#8cff9b'>%4$</t>",
						   [askomaite_atmdin] call life_fnc_numberText,
						   [putakumeak_din] call life_fnc_numberText,
						   [_basePrice] call life_fnc_numberText,
						   [_prixcb] call life_fnc_numberText
					   ],
					   "Elija su método de pago",
					   "Tajeta",
					   "Efectivo"
				] call BIS_fnc_guiMessage;
				if (_action) then {
						if (_prixcb > askomaite_atmdin) exitWith {hint "no tiene suficiente dinero en su cuenta!"};
						askomaite_atmdin = askomaite_atmdin - _prixcb;
						_secure	     = 1;
					} else {
						if (_basePrice > putakumeak_din) exitWith {hint "no tiene suficiente dinero en efectivo!"};
						if (putakumeak_din >= _basePrice) then {
								putakumeak_din = putakumeak_din - _basePrice;
								_cash	  = 1;
								_secure	  = 1;
							};
					};
			};
	};
if (_secure == 1) then {

		if (_cash == 1) then {
				hint parseText format ["compro un %1 por <t color='#8cff9b'>%2$</t>", getText(configFile >> "CfgVehicles" >> _className >> "displayName"), [_basePrice] call life_fnc_numberText];
			} else {
				hint parseText format ["compro un %1 por <t color='#8cff9b'>%2$ + %3$</t> de comisiones bancarias", getText(configFile >> "CfgVehicles" >> _className >> "displayName"), [_basePrice] call life_fnc_numberText, [_frais] call life_fnc_numberText];
			};

		// hint format["Vous avez acheté un %1 pour %2$",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
		// Spawn the vehicle and prep it.
		if ((life_veh_shop select 0) == "med_air_hs") then {	// PENDIENTE
				_vehicle = createVehicle [_className, [0, 0, 999], [], 0, "NONE"];
				waitUntil {!isNil "_vehicle"};	// Wait?
				_vehicle allowDamage false;
				_hs = nearestObjects [getMarkerPos _spawnPoint, ["Land_Hospital_side2_F"], 50] select 0;
				_vehicle setPosATL (_hs modelToWorld [-0.4, -4, 14]);
				_vehicle lock 2;
				[_vehicle, _colorIndex] remoteexeccall ["life_fnc_colorVehicle",-2];
				[_vehicle] call life_fnc_clearVehicleAmmo;
				_vehicle setVariable ["vehicle_info_owners", [ [getPlayerUID player, profileName]], true];
				_vehicle disableTIEquipment true;	// No Thermals.. They're cheap but addictive.
			} else {
				_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
				waitUntil {!isNil "_vehicle"};	// Wait?
				_vehicle allowDamage false;	// Temp disable damage handling..
				_vehicle lock 2;
				_vehicle setVectorUp (surfaceNormal(getMarkerPos _spawnPoint));
				_vehicle setDir (markerDir _spawnPoint);
				_vehicle setPos (getMarkerPos _spawnPoint);
				[_vehicle, _colorIndex] remoteexeccall ["life_fnc_colorVehicle",-2];
				[_vehicle] call life_fnc_clearVehicleAmmo;
				_vehicle setVariable ["vehicle_info_owners", [ [getPlayerUID player, profileName]], true];
				_vehicle disableTIEquipment true;	// No Thermals.. They're cheap but addictive.
			};

		// Side Specific actions.
		switch (playerSide) do {
			case west: {
				[_vehicle, "cop_offroad", true] spawn life_fnc_vehicleAnimate;
				if (_className == "IVORY_PRIUS") then {
						[_vehicle, "cop_prius", true] spawn life_fnc_vehicleAnimate;
					};
				if (_className == "IVORY_REV") then {
						[_vehicle, "cop_rev", true] spawn life_fnc_vehicleAnimate;
					};
				if (_className == "B_APC_Wheeled_01_cannon_F") then {
						[_vehicle, "cop_apc", true] spawn life_fnc_vehicleAnimate;
					};
			};

			case civilian: {
				if ((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
						[_vehicle, "civ_littlebird", true] spawn life_fnc_vehicleAnimate;
					};
				if (_className == "IVORY_PRIUS" && _colorIndex == 11) then {
						[_vehicle, "taxi_prius", true] spawn life_fnc_vehicleAnimate;
					};
				if (_className == "IVORY_PRIUS" && (_colorIndex == 7 OR _colorIndex == 8 OR _colorIndex == 9 OR _colorIndex == 10)) then {
						[_vehicle, "sports_prius", true] spawn life_fnc_vehicleAnimate;
					};
			};

			case independent: {
				[_vehicle, "med_offroad", true] spawn life_fnc_vehicleAnimate;
				if (_className == "IVORY_PRIUS") then {
						[_vehicle, "med_prius", true] spawn life_fnc_vehicleAnimate;
					};
			};
			};

		_vehicle allowDamage true;

		// life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
		life_vehicles pushBack _vehicle;
		[getPlayerUID player, playerSide, _vehicle, 1] remoteexeccall ["TON_fnc_keyManagement",2];
		if (_mode) then {
				if (!(_className in ["B_G_Offroad_01_armed_F", "B_MRAP_01_hmg_F"])) then {
						[(getPlayerUID player), playerSide, _vehicle, _colorIndex] remoteexeccall ["TON_fnc_vehicleCreate",2];
					};
			};

		// [] call SOCK_fnc_updateRequest;// Pour ancienne version d'altis.
		[0] call SOCK_fnc_updatePartial;// Version 3.1.4.8

		closeDialog 0;	// Exit the menu.
		true;
	} else {
		hint "no tiene suficiente dinero en efectivo !";
		false;
	};