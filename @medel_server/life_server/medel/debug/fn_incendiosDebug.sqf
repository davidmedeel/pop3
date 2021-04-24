
/*
por: Medel
*/

_param = param[0];

if (_param isEqualTo "debugFuego") exitWith {

	_incendiosEnCurso = missionNamespace getVariable "incendiosEnCurso";
	_emsON = {side _x == independent} count playableUnits;

	for "_i" from 0 to 1 step 0 do {
		sleep 240;
		if (_incendiosEnCurso >= 1 AND _emsON < 2) then {
			deleteMarker markerFuego;
			missionNamespace setVariable ["incendiosEnCurso", 0, true];

			_arrIncendios = nearestTerrainObjects [pos_incendio, [], 100];
			{
				if !(isPlayer _x) then {
					if ((_x getVariable ["matricula", ""]) isEqualTo "") then {
						deleteVehicle _x;
					};
				};
			} forEach _arrIncendios;
		};
	};
};

if (_param isEqualTo "debugIncendio") exitWith {
	{
		deleteVehicle incendiop1;
		deleteVehicle incendiop2;
		deleteVehicle incendiop3;
		deleteVehicle incendiop4;
		deleteVehicle incendio5;
		deleteMarker marcadorIncendio;
		pos_incendio = [0.174907,0.183105,0];
	} forEach playableUnits;
	missionNamespace setVariable["incendiosEnCurso", 0, true];
};
