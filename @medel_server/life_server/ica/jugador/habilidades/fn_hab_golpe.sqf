
// ["pego"] call ica_fnc_hab_Golpe;
_param = _this select 0;

if (_param isEqualTo "pego") exitWith {
	if (!isNil {golpeDado}) exitWith {hint "Tienes que descansar 15 segundos, dar puñetazos así de molones cansa mucho." };
	[] spawn {
		golpeDado = true;
		sleep 15;
		golpeDado = nil;
	};

	[cursorTarget] spawn {
		_victima = _this select 0;

		if (isNull cursorTarget) exitWith { // le pegas al vacío
			[player, "AwopPercMstpSgthWnonDnon_end"] remoteexec ["switchMove", 0];
		};

		if ((player distance _victima) > 4.5) exitWith {};
			[player, "AwopPercMstpSgthWnonDnon_end"] remoteexec ["switchMove", 0];
		sleep 0.75;

		if ( !(_victima getVariable "restrained") AND ((animationState _victima) != "Incapacitated") AND (_victima isKindOf "Man") ) then {
			["recibo", _victima] remoteexeccall ["ica_fnc_hab_Golpe",-2];
		};
	};
};

if (_param isEqualTo "recibo") exitWith {
	[_this select 1] spawn {
		_victima = _this select 0;
		if (player != _victima) exitWith {};
		0 spawn ica_fnc_cierraTodo;

		_victima setUnconscious true;

		sleep 4;
		
		_victima setUnconscious false;
		_victima switchMove "FXStandDip";
	};
};
