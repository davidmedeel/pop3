/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private ["_unit"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (player isEqualTo _unit) exitWith {};
if (!isPlayer _unit) exitWith {};
if (player getVariable "restrained") exitWith {};
//Broadcast!

if !((["pop_esposas"] call ica_fnc_tengo) >= 1) then {
	hint "No tienes esposas";
} else {
	if (playerSide isEqualTo west) then {
		["pop_esposas", -1] call ica_fnc_item;
		_unit say3D "handcuffs";
		_unit setVariable ["restrained",true,true];
		[player] remoteExec ["life_fnc_restrain",_unit];
	} else {
		if(!(_unit getVariable ["surrender",false]) && animationState _unit != "incapacitated") exitWith {
			hintSilent "Tiene que estar noqueado o con las manos en alto!";
		};
		["pop_esposas", -1] call ica_fnc_item;
		_unit say3D "handcuffs";
		_unit setVariable ["restrained",true,true];
		[player] remoteExec ["life_fnc_restrain",_unit];
	};
};
