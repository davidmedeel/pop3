/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No has seleccionado a nadie!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Recientemente has robado el banco, con lo cual no podras dar dinero en estos instantes.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Has introducido un formato incorrecto.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Introduce una cantidad actual que quieras dar.";ctrlShow[2001,true];};
if(parseNumber(_amount) > medel_din) exitWith {hint "No dispones de esa cantidad!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "El jugador seleccionado esta fuera de su rango";};
hint format["Diste $%1$",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
medel_din = medel_din - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteexeccall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];