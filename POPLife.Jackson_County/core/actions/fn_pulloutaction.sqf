/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;
_veh = cursorTarget;
if ((cursorTarget distance player) > 7) exitWith { // ica
	hint "No eres mago, por lo tanto no puedes sacar a gente de un vehículo que está fuera de tu alcance. Lo siento, no hay Hogwarts para ti";
};
switch (playerSide) do {
	case(west): {
		{
			if(side _x != west) then {
				_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
				[_x] remoteexeccall ["life_fnc_pulloutVeh",_x];
			};
		} foreach _crew;
	};
	case(civilian): {
			{
				if (_x getVariable "restrained") then {
					_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
					[_x] remoteexeccall ["life_fnc_pulloutVeh",_x];
				};
			} foreach _crew;
		};
	case(independent): {
		{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[_x] remoteexeccall ["life_fnc_pulloutVeh",_x];
		} foreach _crew;
	};
};
