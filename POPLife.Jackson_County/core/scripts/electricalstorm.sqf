

_pos = getPosATL MapCenter;

while {true} do {
	if (overcast >= 0.8) then {

		Electrical_Storm setPosATL [(_pos select 0)+(random 1000),(_pos select 1)+(random 1000),(_pos select 2)];
		sleep (random 3);
		[Electrical_Storm, nil, true] spawn BIS_fnc_moduleLightning;
	};
};