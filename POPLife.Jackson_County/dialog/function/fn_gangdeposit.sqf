
#include <macro.h>

private["_value"];

_value = parseNumber(ctrlText 2702);

if !(playerSide isEqualTo civilian) exitWith {hint "No tienes ningúna Mafia"};
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > medel_atmdin) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};

__SUB__(medel_atmdin,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[1,grpPlayer] remoteexeccall ["TON_fnc_updateGang",2];

	["Money Log",format [
	"%1 - (%2) ha ingresado %3 en el banco de la Mafia (%6)  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_value,
	medel_atmdin,
	medel_din,
	mapgridposition player
	]
	] remoteexeccall ["ica_fnc_customlog",2];
