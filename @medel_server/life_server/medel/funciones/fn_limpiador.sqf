
/*
por Medel
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {

  sleep 1800;

	for "_i" from 0 to 1 step 0 do {

		systemChat "Va a pasar el limpiador en 10 segundos!";

		sleep 10;

  		systemChat "Ha pasado el limpiador";

		[] call fnc_limpiador;

		sleep 1800;
	};
};
