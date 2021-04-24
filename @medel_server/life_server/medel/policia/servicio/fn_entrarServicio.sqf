
/*
por: Medel
*/

#include <macro.h>

_param = param [0];

	_lvl = (__GETC__(life_coplevel));

	disableSerialization;

if (_param isEqualTo "entrar") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres policia.";};

		case 1: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 1, true];

			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			license_civ_policiaon = true;
		};

		case 2: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 2, true];
		
			_grp = createGroup west; 
			_oldPlayer = player; 
			_oldPosplayer = getposWorld player; 
			_dir = getDir player; 
			_oldVarName = vehicleVarName _oldPlayer; 
			[_oldPlayer] joinSilent _grp;  

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];
			license_civ_policiaon = true;
		};

		case 3: {
			player setvariable ["PoliciaDeServicio", 3, true];
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
		
			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;
			
			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			license_civ_policiaon = true;
		};

		case 4: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 4, true];

			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;  
		
			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			license_civ_policiaon = true;
		};

		case 5: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 5, true];
		
			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			license_civ_policiaon = true;
		};

		case 6: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 6, true];
		
			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			license_civ_policiaon = true;
		};

		case 7: {
			if (player getvariable "PoliON") exitwith {hint "Ya estas de servicio";};
			player setvariable ["PoliciaDeServicio", 7, true];

			_grp = createGroup west;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["UniformePoli",uniform player,true];
			player setvariable ["ChalecoPoli",vest player,true];
			player setvariable ["MochilaPoli",backpack player,true];

			player setvariable ["PoliON",true];
			player setVariable ["abropuertas",true];
			[] call life_fnc_setupActions;

			license_civ_policiaon = true;
			player setvariable ["PoliciaDeServicio", 7, true];
		};
	};
};

if (_param isequalto "salir") exitwith {

	switch (_lvl) do {
		case 0: { hint "No eres policia.";
	};

		case 1: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;

			license_civ_policiaon = false;
		};

		case 2: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;
			
			license_civ_policiaon = false;
		};

		case 3: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian; 
			_oldPlayer = player; 
			_oldPosplayer = getposWorld player; 
			_dir = getDir player; 
			_oldVarName = vehicleVarName _oldPlayer; 
			[_oldPlayer] joinSilent _grp;  
		
			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;

			license_civ_policiaon = false;

		};

		case 4: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			
			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;

			license_civ_policiaon = false;
		};

		case 5: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian; 
			_oldPlayer = player; 
			_oldPosplayer = getposWorld player; 
			_dir = getDir player; 
			_oldVarName = vehicleVarName _oldPlayer; 
			[_oldPlayer] joinSilent _grp;  

			player setVariable ["abropuertas",false];
			player setvariable ["PoliON",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;

			license_civ_policiaon = false;
		};

		case 6: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian; 
			_oldPlayer = player; 
			_oldPosplayer = getposWorld player; 
			_dir = getDir player; 
			_oldVarName = vehicleVarName _oldPlayer; 
			[_oldPlayer] joinSilent _grp;  

		
			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;
			
			license_civ_policiaon = false;
		};

		case 7: {
			if !(player getvariable "PoliON") exitwith {hint "Ya estas fuera de servicio!";};
			player setvariable ["PoliciaDeServicio", false];
			_grp = createGroup civilian;
			_oldPlayer = player;
			_oldPosplayer = getposWorld player;
			_dir = getDir player;
			_oldVarName = vehicleVarName _oldPlayer;
			[_oldPlayer] joinSilent _grp;

			_uniforme = player getvariable "UniformePoli";
			_chaleco = player getvariable "ChalecoPoli";
			_mochila = player getvariable "MochilaPoli";
			removeUniform player;
			removevest player;
			removeBackpack player;
			player addUniform _uniforme;
			player addvest _chaleco;
			player addBackpack _mochila;
			
			player setvariable ["PoliON",false];
			player setVariable ["abropuertas",false];
			[] call life_fnc_setupActions;

			license_civ_policiaon = false;
		};
	};	
};
