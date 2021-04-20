
/*
por: Medel
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
};
