
private ["_pos","_corcho","_tiempo","_probabilidad","_distancia","_tirones","_tecla"];

sleep random 1;
if(vehicle player != player) exitWith{};
_pos = player modelToWorld[0, 10 + (random 5), 0];
if (surfaceIsWater _pos) then {
if ((player distance [8530.69,6628.44,-0.0585136]) < 50) exitwith {};
	if(player getVariable "pescando"  isEqualTo  1) exitWith {
		hint "Solo puedes pescar con un corcho a la vez.";
	};
	player setVariable ["pescando", 1];	
	contador = 0;
	pesca = false;
	player playAction "cl_fishingrod_cast";
	sleep 1;
	_corcho = createVehicle ["pop_corcho",_pos, [], 0, "CAN_COLLIDE"];
    _corcho setPosASL _pos;	
	sleep 1;
	playSound "agua";    
	["<t size='0.8' shadow='1' color='#FF6600'>Pescando... haz click con el raton para intentar coger algo!</t>", 0, 1, 10, 2, 0, 1] spawn BIS_fnc_dynamicText;
	sleep 10;
	_tiempo = round(random 60);
	_probabilidad = round(random 20);	
	while{_tiempo > 0} do {
		_tiempo = _tiempo - 1;
		_distancia = player distance _corcho;
		if(_distancia > 25 or vehicle player != player) exitWith{hint "No puedes alejarte tanto o debes pescar en zonas menos profundas.";player setVariable ["pescando", 0];deleteVehicle _corcho;};
		sleep 1;
	};		
	_tirones = random 40;
	_tempo = 0;
	_corcho setMass 0.5;
	waituntil {!isnull (finddisplay 46)};
	_tecla = (findDisplay 46) displayAddEventHandler ["MouseButtonDown",{_distancia = player distance _corcho;
		if(_distancia > 25 or vehicle player != player) exitWith{hint "No puedes alejarte tanto o debes pescar en zonas menos profundas.";player setVariable ["pescando", 0];deleteVehicle _corcho;(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _tecla];pesca = false;};pesca = true;contador = contador+1;playSound "carrete";player playAction "cl_fishingrod_strike";}];	
	["<t size='0.8' shadow='1' color='#FF6600'>Han picado!</t>", 0, 1, 10, 2, 0, 1] spawn BIS_fnc_dynamicText;
	while {!pesca || _tempo < 4} do {
		_tempo = _tempo + 1;
		if(_distancia > 25 or vehicle player != player) exitWith{
			hint "No puedes alejarte tanto o debes pescar en zonas menos profundas.";
			player setVariable ["pescando", 0];
			deleteVehicle _corcho;
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _tecla];
			pesca = false;
		};
	};
	if(!pesca) exitWith {player setVariable ["pescando", 0];deleteVehicle _corcho;["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _tecla];};
	deleteVehicle _corcho;
	sleep 10;
	if(primaryWeapon player != "cl_fishing_rod" or vehicle player != player) exitWith { hint "Ahora se pesca de esta forma? LOL.";player setVariable ["pescando", 0];
	deleteVehicle _corcho;(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _tecla];};
	switch (true) do { 
		case (_probabilidad <= 5) : {
			["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
		}; 
		case (_probabilidad > 5 AND _probabilidad <= 10) : {
			if(contador >= _tirones) then {
				["<t size='0.8' shadow='1' color='#FF6600'>Has pescado un salmonete!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;			
				["pop_pez3"] call ica_fnc_item;
			}
			else {
				["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
			};
		}; 
		case (_probabilidad > 10 AND _probabilidad <= 15) : {
			if(contador >= _tirones) then {
				["<t size='0.8' shadow='1' color='#FF6600'>Has pescado un bacalao!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;			
				["pop_pez2"] call ica_fnc_item;

			}
			else {
				["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
			};
		}; 
		case (_probabilidad > 15 AND _probabilidad <= 19) : { 
			if(contador >= _tirones) then {
				["<t size='0.8' shadow='1' color='#FF6600'>Has pescado una caballa!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;			
				["pop_pez4"] call ica_fnc_item;
			}
			else {
				["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
			};
		}; 
		case (_probabilidad  isEqualTo  20) : {
			if(contador >= _tirones) then {
				["<t size='0.8' shadow='1' color='#FF6600'>Has pescado un TIBURON ROSEN!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;					
				["pop_tiburon"] call ica_fnc_item;
			}
			else {
				["<t size='0.8' shadow='1' color='#FF6600'>Se ha escapado!</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
			};
		}; 
		default { ["<t size='0.8' shadow='1' color='#FF6600'>Se ha roto el hilo.</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;};
	};
	player setVariable ["pescando", 0];
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _tecla];
}
else {
	hint "Hay que pescar en el agua, merluzo!";
};
