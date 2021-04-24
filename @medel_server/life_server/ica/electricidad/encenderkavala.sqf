/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/


	_tipos = ["Land_LampStreet_small_F","LampStreet_F","Land_LampSolar_F","Land_LampShabby_F","Land_LampAirport_F","Lamps_Base_F", "PowerLines_base_F","LampDecor_F","LampHalogen_F","Land_LampHarbour_F","Land_objetivohabby_F","Land_NavigLight","Land_runway_edgelight","PowerPoleWooden_L_F"];

	for [{_i = 0}, {_i < (count _tipos)}, {_i = _i + 1}] do {

		_farolas = getMarkerPos "ciudadKavala" nearObjects [_tipos select _i, 1000];

		{_x setHit ["light_1_hitpoint", 0];} forEach _farolas;
		{_x setHit ["light_2_hitpoint", 0];} forEach _farolas;
		{_x setHit ["light_3_hitpoint", 0];} forEach _farolas;
		{_x setHit ["light_4_hitpoint", 0];} forEach _farolas;
		{_x setHit ["light_5_hitpoint", 0];} forEach _farolas;
		{_x setHit ["light_6_hitpoint", 0];} forEach _farolas;

	};

