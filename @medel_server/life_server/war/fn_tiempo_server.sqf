/*
Author:WarBlast
Auto-inicio de tiempo soleado
*/

_pido = param [0];

if (_pido == 0) then {
	sleep 60;
	setWind [0,0,true];
	5 setRain 0;
	5 setFog [0,0,0];
	while {true} do {
		setWind [0,0,true];
		5 setRain 0;
		5 setFog [0,0,0];
		sleep 600;
	};
};
