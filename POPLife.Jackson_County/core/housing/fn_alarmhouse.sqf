/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Activate / deactivate the house alarm.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !((typeOf _house) in listaCasas)) exitWith {};

_state = _house getVariable["alarm",true];
if(_state) then {
	_house setVariable["alarm",false,true];
	titleText["ALARME DESACTIVEE","PLAIN"];
} else {
	_house setVariable["alarm",true,true];
	titleText["ALARME ACTIVEE","PLAIN"];
};