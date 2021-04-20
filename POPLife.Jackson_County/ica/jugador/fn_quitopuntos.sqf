/*
por: Icaruk
	["quito"] call ica_fnc_puntosCarnet
	["meQuitan", 10] call ica_fnc_puntosCarnet
*/
if (isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if (isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_num = parseNumber (ctrlText 2652);
if ((_num <= 0) or (_num > 15)) exitWith {hint "Has escrito un número erroneo de puntos... Qué haces?"};
["mequitan", _num,player] remoteexeccall ["ica_fnc_puntosCarnet",life_ticket_unit];
closeDialog 0;
//hint format ["Le has quitado %1 puntos a %2",_num,name life_ticket_unit]
