
/*
por: Icaruk
	0 spawn ica_fnc_consumo;
*/

private ["_coef", "_aumento", "_miNivel", "_vel"];

while {true} do {

	_coef = 0.010; // (1 / (_coef * 2)) = 33.3min
	_aumento = 0.001;

	_miNivel = "con" call ica_fnc_expToLevel;
	sleep 0.1;
	
	_coef = switch (true) do {
		case (_miNivel >= 3): {_coef * 0.5};
		case (_miNivel >= 1): {_coef * 0.75};
		case (_miNivel >= 0): {_coef * 1};	
	};
	
	if (vehicle player != player) then { // estoy en veh
		if ((vehicle player) isKindOf "Land") then { // veh terrestre
			if (isEngineOn vehicle player) then { // motor encendido
				if (driver (vehicle player) == player) then {	// soy conductor
					_vel = speed vehicle player;
					
					if ((_vel >= 20) AND (_vel < 60)) then {
						vehicle player setFuel ((fuel vehicle player) - _coef);
					};
					if ((_vel >= 60) AND (_vel < 100)) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + _aumento));
					};
					if ((_vel >= 100) AND (_vel < 140)) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + (_aumento * 2)));
					};
					if (_vel >= 140) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + (_aumento * 3)));
					};
				};
			};
		};
	};
	
	sleep 30;
};