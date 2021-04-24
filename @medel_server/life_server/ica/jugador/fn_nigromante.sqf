
/*
por: Icaruk
	para la gente que se ha desconectado sin esperar el tiempo de muerte
	0 spawn ica_fnc_nigromante;
*/

private ["_tiempoMuerto", "_handle"];

if ((profileNamespace getVariable "rutome") > 0) then {
	[false] spawn ica_fnc_vistaBonita;
	waitUntil {(!isNull player) AND (player == player)};
	sleep 2;

	player setPos (getMarkerPos "respawn_civilian");

	[] spawn {
		if (!isNil {loopNigromante}) exitWith {}; // ya estoy en el loop

		while {true} do {
			_tiempoMuerto = profileNamespace getVariable "rutome";
			loopNigromante = true;

			sleep 1;
			if (_tiempoMuerto <= 0) exitWith {
				sleep 1;
				[false, false] spawn ica_fnc_vistaBonita;
				heNacido = true;
				loopNigromante = nil;

				profileNamespace setVariable ["rutome", 0];
				_mrk = if (isNil {life_deadPosition}) then {
					"salidahospitalc";
				} else {
					[life_deadPosition, ["salidahospitalc", "salidahospitalp", "salidahospitalb"]] call ica_fnc_masCercano;
				};

				player setPos (getMarkerPos _mrk);
				if (playerside isEqualto WEST) then {player setpos (getmarkerpos "cop_spawn_1")};
				profileNamespace setVariable ["noiposci", getMarkerPos "salidahospitalc"];
				disableUserInput false;
				call life_fnc_respawned;
				0 spawn life_fnc_inicio;
			};

			titleText [format ["Estás Muerto. Espera %1s", _tiempoMuerto], "PLAIN"];
			profileNamespace setVariable ["rutome", (profileNamespace getVariable "rutome") - 1];
		};
	};
} else {
	if (isNil {profileNamespace getVariable "noiposci"}) then {
		profileNamespace setVariable ["noiposci", (getMarkerPos "salidahospitalc")];
	};
	player setPosATL (profileNamespace getVariable "noiposci");
};
