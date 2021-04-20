
private["_val","_unit","_tax"];

_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > medel_atmdin) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > medel_atmdin) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

medel_atmdin = medel_atmdin - (_val + _tax);

[_val,profileName] remoteexeccall ["TON_fnc_clientWireTransfer",_unit];
[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[6] call SOCK_fnc_updatePartial;

	["Money Log",format [
	"%1 - (%2) ha transferido %3 en el banco a %7 (%6)  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_val,
	medel_atmdin,
	medel_din,
	mapgridposition player,
	name _unit
	]
	] remoteexeccall ["ica_fnc_customlog",2];
