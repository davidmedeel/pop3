/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

if !((["pop_esposas"] call ica_fnc_tengo) >= 1) then {
	hint "No tiene esposas";
} else {
    ["pop_esposas", -1] call ica_fnc_item;
    //Broadcast!
    _unit say3D "handcuffs";
    _unit setVariable["restrained",true,true];
    hint "El objetivo está esposado";
    [player] remoteexeccall ["life_fnc_civRestrain", _unit];
    [0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] remoteexeccall ["life_fnc_broadcast",west];
};