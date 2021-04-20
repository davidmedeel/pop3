/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/

if (isNil {electricidad}) then {
	electricidad = 0;
	publicVariable "electricidad";
};

waitUntil {!isNil {electricidad}};



[] spawn {
	while {true} do {
			if (electricidad >= 10) then {
				execVM "ica\electricidad\encenderKavala.sqf";
				waitUntil {electricidad < 10};
			};
			if (electricidad < 10) then {
				execVM "ica\electricidad\apagarKavala.sqf";
				waitUntil {electricidad >= 10};
			};
			
	sleep 1;		
	};
};

while {true} do {
	if (((date select 3) >= 20) OR ((date select 3) <= 7)) then {
		if (electricidad > 0) then {
			electricidad = electricidad - 1;
			publicVariable "electricidad";
		};
	};
	
sleep 60;
};

