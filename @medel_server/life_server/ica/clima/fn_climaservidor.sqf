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
	0 spawn ica_fnc_climaServidor;
*/

sleep (10 * 60);

meteo = [0, serverTime];
publicVariable "meteo";

_fnc_clima = {

	_siguiente = serverTime + (60 * 60);

	_dados = round (random 100);
	if ((_dados >= 0) AND (_dados < 80)) then {		// 60
		meteo = [0, _siguiente];
	};

	if ((_dados >= 80) AND (_dados < 100)) then {		// 20
		meteo = [1, _siguiente];
	};
	/*
	if ((_dados >= 80) AND (_dados < 90)) then {		// 10
		meteo = [2, _siguiente];
	};
	if ((_dados >= 90) AND (_dados < 95)) then {		// 5
		meteo = [3, _siguiente];
	};
	if ((_dados >= 95) AND (_dados < 98)) then {		// 3
		meteo = [4, _siguiente];
	};
	if ((_dados >= 98) AND (_dados <= 100)) then {	// 2
		meteo = [5, _siguiente];
	};
    */
	publicVariable "meteo";

};

while {true} do {
	call _fnc_clima;
	sleep (60 * 60);
};