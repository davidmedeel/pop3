
private ["_unit", "_killer", "_tmpCash"];

_unit	= [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_killer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
disableSerialization;
_tmpCash = medel_din;
life_deadPosition = (getPos player);
medel_din = 0;

[6] call SOCK_fnc_updatePartial;

call ica_fnc_sync; // si muero sincronizo

[] spawn
{
	while {(vehicle player) != player} do {
		player action ["Eject", (vehicle player)];
	};
};

// ica
[player] spawn ica_fnc_initMed;
player setvariable ["trabajando",false];

_unit setVariable ["Revive", FALSE, TRUE];
_unit setVariable ["name", profileName, TRUE];
_unit setVariable ["restrained", FALSE, TRUE];
_unit setVariable ["Escorting", FALSE, TRUE];
_unit setVariable ["transporting", FALSE, TRUE];
_unit setVariable ["steam64id", (getPlayerUID player), true];

[false] spawn ica_fnc_vistaBonita;

if (!isNull _killer) then	{
	life_killer = _killer;
};

if (side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	if (!life_use_atm && {_tmpCash > 0}) then {
		(format [localize "STR_Cop_RobberDead", [_tmpCash] call life_fnc_numberText]) remoteexeccall ["life_fnc_broadcast", -2];
		_tmpCash = 0;
	};
};

if (!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

medel_din = _tmpCash;
_handle	  = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

medel_din = 0;

[player, life_sidechat, playerSide] remoteexeccall ["TON_fnc_managesc",2];

// ica
profileNamespace setVariable ["hearb",100];
profileNamespace setVariable ["fois",100];
call ica_fnc_actualizaHUD;
profileNamespace setVariable ["edmcai", nil];
[player, true] spawn ica_fnc_initMed; // reset de variables de medicaruk

profileNamespace setVariable ["rutome", 60 * 6];

0 spawn ica_fnc_nigromante;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
