/*
        File: fn_licenseType.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Returns the short-var of the license name to a long var and display name.
*/
private ["_type", "_ret", "_var", "_mode"];
_type = [_this, 0, "", [""]] call BIS_fnc_param;
_mode = [_this, 1, -1, [0]] call BIS_fnc_param;
if (_type == "" OR _mode == -1) exitWith { []};

switch (_mode) do {
	case 0: {
		switch (_type) do {
			case "driver": {_var = "license_civ_driver"};	// Drivers License cost
			case "boat": {_var = "license_civ_boat"};	// Boating license cost
			case "pilot": {_var = "license_civ_air"};	// Pilot/air license cost
			case "gun": {_var = "license_civ_gun"};	// Firearm/gun license cost
			case "cair": {_var = "license_cop_air"};// Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"};	// Swat License cost
			case "cg": {_var = "license_cop_cg"};	// Coast guard license cost
			case "gang": {_var = "license_civ_gang"};	// Gang license cost
			case "rebel": {_var = "license_civ_rebel"};	// Rebel License
			case "truck": {_var = "license_civ_truck"};	// Truck License
			case "depan": {_var = "license_civ_depan"};
			case "mair": {_var = "license_med_air"};
			case "home": {_var = "license_civ_home"};
			case "taxita": {_var = "license_civ_taxita"};	// Licencia de taxita
			case "bus": {_var = "license_civ_bus"};	// Licencia de bus
			case "periodista": {_var = "license_civ_periodista"};	// Licencia de Periodista
			case "transporte": {_var = "license_civ_transporte"};	// Licencia de transporte
			case "donator": {_var = "license_civ_donator"};
			case "alcalde": {_var = "license_civ_alcalde"};// Alcalde
			case "terro": {_var = "license_civ_terro"};// Alcalde
				default {_var = ""};
			};
	};

	case 1: {
		switch (_type) do {
			case "license_civ_driver": {_var = "driver"};	// Drivers License cost
			case "license_civ_boat": {_var = "boat"};	// Boating license cost
			case "license_civ_air": {_var = "pilot"};	// Pilot/air license cost
			case "license_civ_gun": {_var = "gun"};	// Firearm/gun license cost
			case "license_cop_air": {_var = "cair"};// Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"};	// Swat License cost
			case "license_cop_cg": {_var = "cg"};	// Coast guard license cost
			case "license_civ_gang": {_var = "gang"};	// Gang license cost
			case "license_civ_rebel": {_var = "rebel"};	// Rebel License
			case "license_civ_truck": {_var = "truck"};	// Truck License
			case "license_med_air": {_var = "mair"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_taxita": {_var = "taxita"};
			case "license_civ_bus": {_var = "bus"};
			case "license_civ_periodista": {_var = "periodista"};
			case "license_civ_transporte": {_var = "transporte"};
			case "license_civ_donator": {_var = "donator"};
			case "license_civ_alcalde": {_var = "alcalde"};
			case "terro": {_var = "license_civ_terro"};
				default {_var = ""};
			};
	};
	};

_ret = [_var, (if (_var != "") then {( [_var] call life_fnc_varToStr)})];
	       _ret;