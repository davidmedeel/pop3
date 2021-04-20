
/*
por: Icaruk
	[player, "piernas"] spawn ica_fnc_fractura;
*/

_victima = _this select 0;
_parte = _this select 1;

//hombre de hierro
_fortaleza = "sup" call ica_fnc_expToLevel;
if(_fortaleza >= 5)exitWith {

	titleText ["Buff otra persona sin las  piernas tan fuertes no podria correr ...", "PLAIN"];

};


while {true} do {



		if ((_victima getVariable "piernas") < 50 OR _fortaleza > 4) then {

			piernasRotas = false;
			   _victima forceWalk false;

		}else{

		piernasRotas = true;
		   _victima forceWalk true;

	   };


		if !(piernasRotas) exitWith {   _victima forceWalk false; };		   
	   
		sleep 30;
	  	
	


	
	};