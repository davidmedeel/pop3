
/*
por: Icaruk
Params:
	0: OBJECT - al que se le mete el EH
	1: STRING - tipo de EH
	2: STRING - codigo en string que se compilará después
	3: BOOL - true global, false local
	
	[veh, "getIn", "hint 'ASD'", true] call ica_fnc_addEH;
*/

_obj = _this select 0;
_eh = _this select 1;
_code = _this select 2;
_modo = _this select 3;

if (isNil {_obj}) exitWith {};
if (isNull _obj) exitWith {};

if (_modo) exitWith {
	[_obj, _eh, _code, false] remoteexeccall ["ica_fnc_addEH",0];
};

_obj addEventHandler [_eh, _code];