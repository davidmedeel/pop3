/*
	Creado por Rosen
*/

private["_distancia1","_distancia2","_distancia3","_distancia4","_velocidad","_multa"];

if (playerSide != civilian) exitWith {};

while{true} do {
	if (((vehicle player != player) && ((assignedVehicleRole player) select 0) == "driver")) then {
	    _distancia1 = player distance radar1;
		_distancia2 = player distance radar2;
		_distancia3 = player distance radar3;
		_distancia4 = player distance radar4;
		_velocidad = round speed player;

		if((_distancia1 < 25 OR _distancia2 < 25 OR _distancia3 < 25 OR _distancia4 < 25) AND _velocidad > 128) then {
			playSound "fotoradar";
			cutText ["","WHITE OUT",0.5];
			cutText ["","WHITE IN",0.5];		
			if(_velocidad < 130) then {
				_multa = round(750 + 1.5 * _velocidad);
			}
			else {
				_multa = round(2000 + 1.5 * _velocidad);
			};
			sleep 3;
			if(medel_atmdin > _multa) then {
				hint format ["Exceso de velocidad (%1 Km/h). Multa de %2€", _velocidad, _multa];
				medel_atmdin = medel_atmdin - _multa;
			} 
			else {
				if(medel_din > _multa) then {
					hint format ["Exceso de velocidad (%1 Km/h). Multa de %2€", _velocidad, _multa];
					medel_din = medel_din - _multa;					
				}
				else {
					[getPlayerUID player,name player,"261A"] Remoteexeccall ["life_fnc_wantedAdd",2];
 					hint "Estas to pobre! Lo vas a pagar en carnes en chirona con Rosen.";
				};
			};
			sleep 1;
		};
	};
	if (((vehicle player != player) && ((assignedVehicleRole player) select 0) == "driver")) then {
		sleep 1;
	}
	else {
		sleep 10;
	};
};
