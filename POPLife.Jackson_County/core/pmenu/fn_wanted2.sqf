private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hintSilent "Niemand wurde ausgewaehlt!";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

[1,format["The police is searching for %1",name _unit,_amount,getPlayerUID _unit]] remoteexeccall ["life_fnc_broadcast",west];

[getPlayerUID _unit,name _unit,_amount] remoteexeccall ["life_fnc_wantedAdd",2];