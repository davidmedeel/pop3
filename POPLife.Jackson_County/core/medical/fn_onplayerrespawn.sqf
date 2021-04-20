/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something but I won't know till I write it...
*/
private["_unit", "_corpse", "_containers", "_skull"];
_unit = _this select 0;
_corpse = _this select 1;

// ica borrar cadáver
_corpse setVariable ["culpables", culpables, true];
[_corpse, 60 * 10] call ica_fnc_borrame;


life_corpse = _corpse;
life_is_alive = false;

life_sidechat = true;
[player,life_sidechat,playerSide] remoteexeccall ["TON_fnc_managesc",2];

/* DRUGS */
resetCamShake;
"colorCorrections" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
ppColorNukeExplode ppEffectEnable false;
ppColorNukeLight ppEffectEnable false;
ppColorNukeExplode ppEffectEnable false;
{
	missionNamespace setVariable[_x, 0];
} forEach (life_inv_drugs_consuming);

/* DELETE WEAPON */
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5];
{
	deleteVehicle _x;
} forEach (_containers);

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[_unit,life_sidechat,playerSide] remoteexeccall ["TON_fnc_managesc",2];
// [] execVM "als\alsOn.sqf";

// ica
profileNamespace setVariable ["edmcai", nil];
[player, true] spawn ica_fnc_initMed; // reset de variables de medicaruk
if (((animationstate _unit) == "ainjPpneMstpSnonWnonDnon") or ((animationstate _unit) == "amovppnemstpsnonwnondnon_injured")) then { profileNamespace setVariable ["rutome", 60 * 8]};

// Rosen
player setVariable ['QS_seated',FALSE];
