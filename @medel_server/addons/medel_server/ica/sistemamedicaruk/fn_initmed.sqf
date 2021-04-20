
/*
por: Icaruk
	[player] spawn ica_fnc_initMed;		// init
	[player, true] spawn ica_fnc_initMed;	// reset
*/

_victima = _this select 0;
_reset = _this select 1;

if (!isNil {_reset}) exitWith {
	if (_reset) then {
		{_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
		_victima setVariable ["sangrando", [0, 0, 0, 0], true];
		_victima setVariable ["inconsciente", false, true];
		_victima setVariable ["cegado", false, true];
		_victima setVariable ["toxicidad", 0, true];
		_victima setVariable ["dolor", false];
		_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
		_victima setVariable ["organos", [true, true, true], true];
		//quick cegado
		//variable cegado
		_victima  setVariable["cegado", false ,true]; 
		//efecto camara al jugador
		[[], "ica_fnc_cegado", player , false] call BIS_fnc_MP;
		piernasRotas = false;
		//drogas reset
		_victima setVariable ["drogado",false,true];
		_victima setVariable ["tengoMono",false,true];	

		[true] call ica_fnc_guardaCargaMed;
	};
};

if (isNil {profileNamespace getVariable "edmcai"}) then {
	_victima setVariable ["total", 0];
	{_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
	_victima setVariable ["sangrando", [0, 0, 0, 0], true];
	_victima setVariable ["inconsciente", false, true];
	_victima setVariable ["cegado", false, true];
	_victima setVariable ["toxicidad", 0, true];
	_victima setVariable ["dolor", false];
	_victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
	_victima setVariable ["organos", [true, true, true], true];
	//quick cegado
	//variable cegado
	_victima setVariable["cegado", false ,true]; 
	//efecto camara al jugador
	[[], "ica_fnc_cegado", player , false] call BIS_fnc_MP;
			//drogas reset
		_victima setVariable ["drogado",false,true];
		_victima setVariable ["tengoMono",false,true];	
		
	piernasRotas = false;

	[true] call ica_fnc_guardaCargaMed;
} else {
	[false] call ica_fnc_guardaCargaMed;
};

waitUntil {!isNil {_victima getVariable "BIS_fnc_feedback_hitArrayHandler"}};
_victima removeAllEventHandlers "HandleDamage";
_victima addEventHandler ["HandleDamage",{_this call ica_fnc_sistemaMedica}];
