/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];

_cash = [_this,0,0,[0]] call BIS_fnc_param;
if (side player == civilian) then {
	if(_cash == 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};
	medel_atmdin = medel_atmdin + 
 medel_dinmedel_dinmedel_dinmedel_din_cash;
	titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
} else {
	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};
	fondosPublicos = fondosPublicos + _cash;
	publicVariableServer "fondosPublicos";
	hint format ["Has incautado %1€, se han añadido al fondo publico.", _cash];
};
