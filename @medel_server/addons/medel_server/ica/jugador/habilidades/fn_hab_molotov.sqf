

[] spawn {
	if (!isNil {fuegoenlamano}) exitWith {hint "Tienes las manos ocupadas"};
	fuegoenlamano = true;

	[3, "Preparando bomba de fuego..."] call ica_fnc_barrita;

	_t = 3;
	while {true} do {
		if (_t <= 0) exitWith {};
		if (!alive player) exitWith {cancelar = true};

		_t = _t - 1;
		sleep 1;
	};

	if (!isNil {cancelar}) exitWith {("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; fuegoenlamano = nil; }; // si cancelo no sigo

	flecha = "Sign_Arrow_F" createVehicleLocal getMarkerPos "";
	flecha attachTo [player, [0, 7, 0.5]];

	accioncancelar = player addAction ["Cancelar",{
		detach flecha;
		deleteVehicle flecha;
		player removeAction act_colocaFuego;
		player removeAction accioncancelar;
		fuegoenlamano = nil;
	}];

	act_colocaFuego = player addAction ["Lanzar bomba de fuego", {
		player removeAction act_colocaFuego;
		player removeAction accioncancelar;
		[1, ""] call ica_fnc_barrita;
		_t = 1;
		while {true} do {
			if (_t <= 0) exitWith {
				if (stance player == "STAND") exitWith {
					player playMove "AwopPercMstpSgthWrflDnon_start1";
					[player,"AwopPercMstpSgthWrflDnon_start1"] remoteexeccall ["life_fnc_animSync",-2];
					sleep 1.5;
					waitUntil {animationState player != "AwopPercMstpSgthWrflDnon_start1"};
				};
				if (stance player == "CROUCH") exitWith {
					player playMove "AwopPknlMstpSgthWrflDnon_start";
					[player,"AwopPknlMstpSgthWrflDnon_start"] remoteexeccall ["life_fnc_animSync",-2];
					sleep 1.5;
					waitUntil {animationState player != "AwopPknlMstpSgthWrflDnon_start"};
				};
				if (stance player == "PRONE") exitWith {
					player playMove "AwopPpneMstpSgthWrflDnon_start";
					[player,"AwopPpneMstpSgthWrflDnon_start"] remoteexeccall ["life_fnc_animSync",-2];
					sleep 1.5;
					waitUntil {animationState player != "AwopPpneMstpSgthWrflDnon_start"};
				};
			};
			if (!alive player) exitWith {
				detach flecha;
				deleteVehicle flecha;
				player removeAction act_colocaFuego;
				player removeAction accioncancelar;
				fuegoenlamano = nil;
			};
			_t = _t - 1;
			sleep 1;
		};

		_fuego = "#particlesource" createVehicle getpos flecha;
		_fuego setParticleClass "BigDestructionFire";
		_fuego setParticleFire [0.3,1.0,0.1];
		_humo = "#particlesource" createVehicle getpos flecha;
		_humo setParticleClass "BigDestructionSmoke";

		[_fuego, 60] call ica_fnc_borrame;
		[_humo, 60] call ica_fnc_borrame;

		detach flecha;
		deleteVehicle flecha;
		fuegoenlamano = nil;
	}];
};

