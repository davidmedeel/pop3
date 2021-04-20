
if (isnil "life_actions") then {life_actions = [];};

switch (playerSide) do
{
	case civilian:
	{
		
		//Robar Persona
		life_actions = life_actions + [player addAction["Robar",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		
		// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 50 && (getPos player) select 2 >= 15 && speed vehicle player < 10 && !(player getVariable["transporting",false]) ']];

		life_actions = life_actions + [player addAction["<t color='#FF0000' size='3'>Inmolarse</t>", life_fnc_comprarchalecobomba,{}, 4, false, true, "", 'vest player isEqualTo "A3L_SuicideVest" OR vest player isEqualTo "pop_chaleco_terro1"']];
		
		life_actions = life_actions + [player addAction["<t color='#FF0000' size='3'>Gritar Allahu Akbar!</t>", {[player, "bomba"] call CBA_fnc_globalSay3D;},{}, 4, false, true, "", 'vest player isEqualTo "A3L_SuicideVest" OR vest player isEqualTo "pop_chaleco_terro1"']];
	};

	case independent:
	{
		//CopEnter - Driver Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Gunner Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_GunnerSeat",life_fnc_copEnter,"gunner",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];
		//CopEnter - Exit
		life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 50 && (getPos player) select 2 >= 15 && speed vehicle player < 10 && !(player getVariable["transporting",false]) ']];
		// Enterrador
		life_actions = life_actions + [player addAction["Meter cuerpo en el ataud",ica_fnc_enterrador,"meto",99,false,false,"", ' cursortarget isKindOF "Man" && !(alive cursortarget) && (player distance cursortarget < 3.5)']];
		life_actions = life_actions + [player addAction["Cargar el ataud",ica_fnc_enterrador,"cargo",99,false,false,"", ' typeof (nearestObjects [player, ["building"], 3.5] select 0) == "pop_ataud" ']];
		life_actions = life_actions + [player addAction["Enterrar",ica_fnc_enterrador,"entierro",99,false,false,"", ' typeof cursortarget == "POP_corbillard_c_noir" && (player distance cursortarget < 3.5)']];
	};

	case west:
	{
	// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 50 && (getPos player) select 2 >= 15 && speed vehicle player < 10 && !(player getVariable["transporting",false]) ']];
	};
};
