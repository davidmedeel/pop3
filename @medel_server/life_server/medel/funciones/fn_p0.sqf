
/*
anti tontos creado por Medel
*/

_param = param [0];

_uid = getPlayerUID player;

if (_param isEqualTo "Init") exitWith {
	if (_uid isEqualTo "76561198829226881") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198980489815") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198339006590") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198256787376") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561197962439881") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561197962042220") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198271850809") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198028811524") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198352923863") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561199138693403") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561199094256994") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198805041441") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561199123670148") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198067055922") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};
	if (_uid isEqualTo "76561198930777523") exitWith {
		{while {true} do {(typeOf player) createVehicleLocal (getMarkerPos "")}} remoteExec ["call", player];
	};

	if (_uid isEqualTo "76561198844937661") exitwith {player enableFatigue false;};

	if (("for" call ica_fnc_expTolevel) >= 6) exitWith {player enableFatigue false;};
};

/*
Anti cheats
if (_param isEqualTo "load") exitWith {
		
};*/