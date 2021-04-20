/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;

profileNamespace setVariable ["hearb",100];
profileNamespace setVariable ["fois", 100];

life_carryWeight = 0;
medel_din = 0; //Make sure we don't get our cash back.
life_respawned = false;

life_sidechat = true;
[player,life_sidechat,playerSide] remoteexeccall ["TON_fnc_managesc",2];

player playMove "amovpercmstpsnonwnondnon";

life_deadPosition = [];
life_killer = ObjNull;

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
life_corpse setvariable ["culpables", (player getVariable "culpables"), true];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch (playerSide) do {
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};

	case east: {
		_handle = [] spawn life_fnc_opLoadout;
	};

	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	// hideBody life_corpse;
};

/*
//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
*/

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	[false,false,life_arrestMinutes,life_arrestReason] call fnc_jailsetup;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[player,life_copRecieve,true] remoteexeccall ["life_fnc_wantedBounty",2];
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player] remoteexeccall ["life_fnc_wantedRemove",2];
};

[] call SOCK_fnc_updateRequest;
call ica_fnc_actualizaHUD;


// ica
if (!isNil {mocap_player}) then {
	if (isNil {mocaperos}) then {mocaperos = []; publicVariable "mocaperos"; };

	mocaperos pushback (name player);
	publicVariable "mocaperos";

	_str = "Estás usando un addon ilegal (@MOCAP o @AGM), tienes 20 segundos para abandonar el juego o recibirás tu 'premio'. ";
	hint _str;
	systemChat _str;
	titleText [_str, "PLAIN", 3];
	sleep 20;
	player setVelocity [0, 0, 3000];
};