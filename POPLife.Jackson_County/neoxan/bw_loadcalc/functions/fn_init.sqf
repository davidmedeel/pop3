if (isDedicated) exitWith {};
	[] spawn {
		// waitUntil {!isnull player};
		if (player == player) then {
		nul = [] spawn BWLoadCalc_Fnc_GEARMONITOR;
		player addEventHandler ["Respawn", {nul = [] spawn BWLoadCalc_Fnc_GEARMONITOR}];
		};
	};