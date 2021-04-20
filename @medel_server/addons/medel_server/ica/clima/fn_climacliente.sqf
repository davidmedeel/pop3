//////////////////////////////////////////////////////////////////////////////
//																			//
//		           		  		DESOLATION						     		//
//                 		    by Icaruk & nerkaid								//
//		                                                      			    //
//		   If you want to use our code or part of it coctact us at:         //
//	 	Si quieres usar nuestro código o parte del mismo contáctanos en:	//
//                    Email: desolation@nerkaid.com							//
//                    Web: http://www.npgclan.com							//
//															                //
//////////////////////////////////////////////////////////////////////////////

/*
Script de la misión Desolation creado por Icaruk & nerkaid
	0 spawn ica_fnc_climaCliente;
*/

sleep (10 * 60);
waitUntil {!isNil {meteo}};

private ["_niebla", "_clima", "_lluvia", "_tiempoCambio"];
_tiempoCambio = 1;

while {true} do {
	_t0 = serverTime;

	switch (meteo select 0) do {
		case 0: {
			_niebla = 0;
			_clima = 0;
			_lluvia = 0;
		};
		case 1: {
			_niebla = 0;
			_clima = 0.1;
			_lluvia = 0;
		};
		/*
		case 2: {
			_niebla = 0;
			_clima = 0.2;
			_lluvia = 0.3;
		};
		case 3: {
			_niebla = 0;
			_clima = 0.3;
			_lluvia = 0.4;
		};
		case 4: {
			_niebla = 0.1;
			_clima = 0.5;
			_lluvia = 0.5;
		};
		case 5: {
			_niebla = 0.6;
			_clima = 1;
			_lluvia = 0.4;
		};
		*/
	};

	_tNiebla = ((_niebla - fog) * _tiempoCambio); // cuanto más cambio vaya a haber, más tiempo de transición, min3' max30'
	if (_tNiebla < 0) then { _tNiebla = (_tNiebla * (-1)) }; // si da negativo, lo pongo positivo
	_tClima = ((_clima - overcast) * _tiempoCambio);
	if (_tClima < 0) then { _tClima = (_tClima * (-1)) };
	_tLluvia = ((_lluvia - rain) * _tiempoCambio);
	if (_tLluvia < 0) then { _tLluvia = (_tLluvia * (-1)) };

	_tNiebla setFog _niebla;
	_tClima setOvercast _clima;
	_tLluvia setRain _lluvia;
	_tLluvia setLightnings _lluvia; // uso la misma var que lluvia, pero tarda más en aparecer

	sleep (((meteo select 1) - _t0) + 10); // el +10 porsiaca se queda en 0 alguna vez
	_tiempoCambio = 60 * 30;
};
