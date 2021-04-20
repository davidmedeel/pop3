/*
	File: fn_startRace.sqf
	Author: Akryllax
	Desc: Aqui está toda la lógica de la carrera, además del manejo de texturas de las orbs.
*/

private["_raceID", "_car"];

_raceID = [_this, 0, "", [""]] call BIS_fnc_param;
_car = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

inRace = true;
player setVariable["inRace",inRace, true];
racing_lastCP = time;
racing_timeOut = 30; //Tiempo maximo entre punto y punto.

//LOGICA de la carrera
_raceID spawn {
	
	_orbRadious = 12;

	_count = count currentTrackOrbs;
	waypointIndex = 0;
	player setVariable["waypointIndex", waypointIndex, true];
	while {inRace} do {
		waitUntil { ((position player) vectorDistance (position currentOrb) < _orbRadious) || !alive Player || (racing_lastCP + racing_timeOut < time)};
		
		if(!alive player) exitWith {
			inRace = false; 
			player setVariable["inRace",inRace, true];
			[_this, true] call life_fnc_racingEnded;
		};
		
		_posicion = getMarkerPos "finCarnet";

		if(racing_lastCP + racing_timeOut < time) exitWith {
			hint "Has tardado mucho entre punto y punto.";
			_coche = vehicle player;
			_coche setFuel 0;
			inRace = false;
			[_this, true] call life_fnc_racingEnded;
			player allowDamage false;
			[_coche, [0, 0, 1]] call ica_fnc_setVelocityRas;
			deletevehicle _coche;

			player setPos _posicion;
			player allowDamage true;
		};
		
		racing_lastCP = time;
		
		waypointIndex = waypointIndex + 1;
		player setVariable["waypointIndex", waypointIndex, true];
		
		if(waypointIndex < _count) then {
			currentOrb = currentTrackOrbs select waypointIndex;
		};
		if(waypointIndex == _count) then {
			[_this] call life_fnc_racingEnded;
		};
	};
};

//TEXTURAS
[] spawn {
	while {inRace} do{
		_cur = currentOrb;
		_found = false;
		
		waitUntil {!isNil "waypointIndex"};

		{
			if(waypointIndex < count currentTrackOrbs) then {
				if(_x == _cur) then {
					_found = true;
					_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.098,0.369,0.812,1)"];
				} else {
					if(!_found) then {
						_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.2,0.812,0.2,1)"];
					} else {
						_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.812,0.2,0.2,1)"];
					};
				};
			} else {
				_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.2,0.812,0.2,1)"];
			};
			
		} forEach (currentTrackOrbs);
		
		waitUntil{_cur != currentOrb};
	};
};

_raceID spawn {
	
	waitUntil{vehicle player != player};
	for "_i" from 0 to 9 do {
		[
			[
				[
					format["%1", 10 - _i],
					"<t align = 'center' shadow = '1' size = '3' font='PuristaBold'>%1</t>"
				]
			]
		] spawn BIS_fnc_typeText;
		
		sleep 1;
	};
	
	[
		[
			[
				"INICIO",
				"<t align = 'center' shadow = '1' size = '3' font='PuristaBold'>%1</t>"
			]
		]
	] spawn BIS_fnc_typeText;
	
	raceStartTime = time;
	
	(vehicle player) setFuel 1;
	_this spawn {
	
		_raceConfig = [_this] call life_fnc_raceConf;
		
		_mode = _raceConfig select 0;
		_price = _raceConfig select 1;
		
		switch(_mode) do {
			case 0: {
				_oro = (_raceConfig select 2);
				_plata = (_raceConfig select 3);
				_bronce = (_raceConfig select 4);
			
				while {inRace} do {
					hintSilent parseText format ["<t size = '1' align='center' font='TahomaB'>Tiempo: </t><br/><t size='0.95' align='center'>Restante: %8</t><br/><t size='1.5'>%1</t><br/><t align='center' color='#E6D525' font='TahomaB'>Oro: %2 (%3)</t><br/><t align='center' color='#C9C9C9' font='TahomaB'>Plata: %4 (%5)</t><br/><t align='center' color='#965D0C' font='TahomaB'>Bronce: %6 (%7)</t>", [time - raceStartTime] call BIS_fnc_timeToString, _oro select 1, _oro select 0, _plata select 1, _plata select 0,_bronce select 1, _bronce select 0, (racing_lastCP + 60) - time];
					sleep 0.02;
				};
			};
			
			case 1: {
				_premio = (_raceConfig select 2);
				
				while {inRace} do {
					hintSilent parseText format ["<t size = '1' align='center' font='TahomaB'>Tiempo </t><br/><t size='0.95' align='center'>Actual: %8</t><br/><t size='1.5'>%1</t><br/><t align='center' color='#E6D525' font='TahomaB'>Minimo: %2 (%3)</t>", [time - raceStartTime] call BIS_fnc_timeToString, _premio select 1];
					sleep 0.02;
				};
			};
			case 2: {
				_premio = (_raceConfig select 2);
				
				while {inRace} do {
					hintSilent parseText format ["<t size = '1' align='center' font='TahomaB'>Tiempo </t><br/><t size='0.95' align='center'>Actual: %8</t><br/><t size='1.5'>%1</t><br/><t align='center' color='#E6D525' font='TahomaB'>Minimo: %2 (%3)</t>", [time - raceStartTime] call BIS_fnc_timeToString, _premio select 1];
					sleep 0.02;
				};
			};
		};
	};
};