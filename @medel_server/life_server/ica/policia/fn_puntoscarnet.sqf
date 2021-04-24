
/*
por: Icaruk
	["quito"] call ica_fnc_puntosCarnet
	["meQuitan", 10] call ica_fnc_puntosCarnet
*/

_param = param [0];

if (_param isEqualTo "quito") exitWith {
	if (isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
	if (isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
	_num = parseNumber (ctrlText 2652);
	if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
	if ((_num <= 0) or (_num > 15)) exitWith {hint "Has escrito un número erroneo de puntos... ¿qué haces?"};

	["mequitan", _num] remoteexeccall ["ica_fnc_puntosCarnet",life_ticket_unit];
	closeDialog 0;
	hint format ["Le has quitado %1 puntos a %2",_num,name life_ticket_unit]
};

if (_param isEqualTo "mequitan") exitWith {
	_can = param [1];
	_puntos = profileNamespace getVariable "puntosCarnet";

	if ((isNil {_puntos}) AND (license_civ_driver OR license_civ_transporte)) then {
		profileNamespace setVariable ["puntosCarnet", 15];
		_puntos = profileNamespace getVariable "puntosCarnet";
	};
	profileNamespace setVariable ["puntosCarnet", _puntos - _can];
	hint format ["Has perdido %1 puntos del carnet, te quedan %2", _can, profileNamespace getVariable "puntosCarnet"];
	if (_puntos - _can <= 0) then {
		[format ["Le has quitado a %2 %1 puntos, no le queda ningun punto en el carnet!!!.\nSus licencias de vehiculos fueron removidas.", _can, name player, profileNamespace getVariable "puntosCarnet"], "hint", _this select 2, false, false] call BIS_fnc_MP;
	}else{
		[format ["Le has quitado a %2 %1 puntos, le quedan %3 puntos en el carnet", _can, name player, profileNamespace getVariable "puntosCarnet"], "hint", _this select 2, false, false] call BIS_fnc_MP;
};
	if ((profileNamespace getVariable "puntosCarnet") <= 0) then {
		hint "Como has perdido todos los puntos del carnet, todas tus licencías de vehículos han sido eliminadas.";
		license_civ_driver = false;
		license_civ_transporte = false;
		license_civ_boat = false;
		license_civ_air = false;
		profileNamespace setVariable ["puntosCarnet", 0];
	};
};
