
/*
por: Icaruk
	call ica_fnc_sync;
*/

	
	//if (!isNil "_exit") exitWith {//hint localize "STR_Session_SyncCheater"};
	[] call SOCK_fnc_updateRequest;
	// [22] call SOCK_fnc_updatePartial; // exp
	[true] call ica_fnc_guardaCargaMed; // guardar variables medicaruk
	[true] spawn ica_fnc_posicion;
	//profilenamespace setvariable ["rutome",0];
	
	// DEBUG: QUITAR EN PRODUCTION
	//hint "DEBUG: Sincronización"
