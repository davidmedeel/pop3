
private["_value"];

_value = parseNumber(ctrlText 2702);

if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > medel_din) exitWith {hint localize "STR_ATM_NotEnoughCash"};

medel_din = medel_din - _value;
medel_atmdin = medel_atmdin + 
 medel_dinmedel_din_value;



	["Money Log",format [
	"%1 - (%2) ha ingresado %3 en el banco (%6)  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_value,
	medel_atmdin,
	medel_din,
	mapgridposition player
	]
	] remoteexeccall ["ica_fnc_customlog",2];

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
