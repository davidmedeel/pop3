/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

/*
if(life_inv_handcuffs > 0) then
{
    life_inv_handcuffs = life_inv_handcuffs + 1;
} else {
    [true,"handcuffs",1] call life_fnc_handleInv;
};
*/
if ((["pop_llaves"] call ica_fnc_tengo) <= 0) exitWith {hint "No tienes llaves para las esposas";};
["pop_esposas", 1] call ica_fnc_item;

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]] remoteexeccall ["life_fnc_broadcast",west];

if (_unit getVariable ["surrender", false]) then {
	_unit setVariable ["surrender", false, true];
};