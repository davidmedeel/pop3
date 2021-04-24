
#include <macro.h>

private["_value"];

_value = parseNumber(ctrlText 2702);
_gFund = grpPlayer getVariable ["gang_bank",0];

if !(playerSide isEqualTo civilian) exitWith {hint "No tienes ningúna Mafia"};
if !(getPlayerUID player isEqualTo (group player getVariable "gang_owner"))  exitWith {hint "Necesitas ser el líder de la banda para retirar dinero";};
if(_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > _gFund) exitWith {hint "No hay tanto dinero en los fondos de la Mafia"};
if(_val < 100 && _gFund > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"};

__SUB__(_gFund,_value);
medel_din = medel_din + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format [localize "STR_ATM_sacarMafia",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest;
[6] call SOCK_fnc_updatePartial;
[1,grpPlayer] remoteexeccall ["TON_fnc_updateGang",2];

	["Money Log",format [
	"%1 - (%2) ha retirado %3 en el banco de la Mafia (%6)  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_value,
	medel_atmdin,
	medel_din,
	mapgridposition player
	]
	] remoteexeccall ["ica_fnc_customlog",2];
