_getColours = {
	_colourArray = _this;
	_colourMax = [_colourArray, 1] call BIS_fnc_findExtreme;
	[(_colourArray select 0) / _colourMax / 1.5, (_colourArray select 1) / _colourMax / 1.5, (_colourArray select 2) / _colourMax / 1.5]
};

_clouds = if (overcast >= 0.7) then {0.25 * overcast} else {0};
_natural = (sunOrMoon - _clouds) + (0.1 * moonIntensity);
_artificial = [0, [0,0,0]];

if (_natural < 0.5) then {

	_nearestLight = [0];
	_lampLight = [0];
	_carLight = [0];
	_fireLight = [0];
	_chemLight = [0];
	_flashLight = [0];

	//lamps/lights
	_allLamps = nearestObjects [player, ["Lamps_base_F", "Land_PowerPoleWooden_L_F"], 60]; // PENDIENTE
	if (count _allLamps > 0) then {
		{
			_lamp = _x;
			_type = typeOf _lamp;
			
			if (isClass (configFile >> "CfgVehicles" >> _type >> "Reflectors")) then {
				if (((toUpper _type) find "OFF") == -1) then {
					_reflectors = (configFile >> "CfgVehicles" >> _type >> "Reflectors");
					if (count _reflectors > 0) then {
						_liveReflectors = [];
						for "_i" from 0 to (count _reflectors - 1) do {
							_reflector = _reflectors select _i;
							if ((_lamp getHit (getText (_reflector >> "hitpoint"))) <= 0.9) then {
								_liveReflectors pushBack (_reflectors select _i);
							};
						};
						if (count _liveReflectors > 0) then {
							_reflectorPrime = _reflectors select 0;
							_fullDistance = getNumber (_reflectorPrime >> "attenuation" >> "hardLimitEnd");
							_startVectors = [];
							for "_i" from 0 to (count _reflectors - 1) do {
								_startVectors pushBack (_lamp selectionPosition (getText ((_reflectors select _i) >> "position")));
							};
							_startVect = _startVectors call vip_cmn_fnc_cl_vectorAverage;
							_startPos = _lamp modelToWorld _startVect;
							_playerPos = player modelToWorld (player selectionPosition "spine3");
							
							if (getNumber (_reflectorPrime >> "outerAngle") == 360) then {
								_colourArray = getArray (_reflectorPrime >> "color");
								_colour = _colourArray call _getColours;
								_lampLight = [1 - ((_playerPos distance _startPos) / _fullDistance), _colour];
							} else {
								_endVectors = [];
								for "_i" from 0 to (count _reflectors - 1) do {
									_endVectors pushBack (_lamp selectionPosition (getText ((_reflectors select _i) >> "direction")));
								};
								_endVect = _endVectors call vip_cmn_fnc_cl_vectorAverage;
								_endPos = _lamp modelToWorld _endVect;
								
								_lampVector = _startPos vectorFromTo _endPos;
								_lampToPlayerVector = _startPos vectorFromTo _playerPos;
								_diff = vectorMagnitude (_lampVector vectorDiff _lampToPlayerVector);
								_angle = getNumber (_reflectorPrime >> "outerAngle");
								_coef = getNumber (_reflectorPrime >> "coneFadeCoef");
								
								if (_diff < (((100 / _coef) + _angle) / 180)) then {
									_colourArray = getArray ((_liveReflectors select 0) >> "color");
									_colour = _colourArray call _getColours;
									_lampLight = [(1 - ((_playerPos distance _startPos) / _fullDistance)) - _diff / 8, _colour];
								};
							};
						};
					};
				};
			};
			if (count _lampLight > 1) exitWith {};
		} forEach _allLamps;
	};
	
	//cars/trucks
	_allCars = nearestObjects [player, ["Car_F"], 60];
	if (count _allCars > 0) then {
		{
			_veh = _x;
			if (vehicle player != _veh) then {
				if (isLightOn _veh) then {
					_type = typeOf _veh;
					if (isClass (configFile >> "CfgVehicles" >> _type >> "Reflectors")) then {
						_reflectors = (configFile >> "CfgVehicles" >> _type >> "Reflectors");
						if (count _reflectors > 0) then {
							_liveReflectors = [];
							for "_i" from 0 to (count _reflectors - 1) do {
								_reflector = _reflectors select _i;
								if ((_veh getHit (getText (_reflector >> "hitpoint"))) <= 0.9) then {
									_liveReflectors pushBack (_reflectors select _i);
								};
							};
							if (count _liveReflectors > 0) then {
								_startPos = _veh modelToWorld [0,0,0];
								_endPos = _veh modelToWorld [0,5,-0.25];
								_reflectorVect = _startPos vectorFromTo _endPos;
								_playerPos = player modelToWorld (player selectionPosition "spine3");
								_reflectorToPlayerVect = _startPos vectorFromTo _playerPos;
								_diff = vectorMagnitude (_reflectorVect vectorDiff _reflectorToPlayerVect);
								if (_diff < 0.7) then {
									_colourArray = getArray ((_liveReflectors select 0) >> "color");
									_colour = _colourArray call _getColours;
									_carLight = [(1 - ((_playerPos distance _startPos) / 60)) - _diff / 2, _colour];
								};
							};
						};
					};
				};
			};
			if (count _carLight > 1) exitWith {};
		} forEach _allCars;
	};
	
	//fires
	_allFires = nearestObjects [player, ["Land_FirePlace_F"], 25];
	if (count _allFires > 0) then {
		{
			_fire = _x;
			if (inflamed _fire) then {
			
				_playerPos = player modelToWorld (player selectionPosition "spine3");
				_pos = getPos _fire;
				_colour = getArray (configFile >> "CfgLights" >> (getText (configFile >> "CfgVehicles" >> (typeOf _fire) >> "Effects" >> "Light1" >> "type")) >> "color");
				_fireLight = [1 - ((_playerPos distance _pos) / 25), _colour];
			};			
			if (count _fireLight > 0) exitWith {};
		} forEach _allFires;
	};		
	
	//chemlights
	_allGrenades = player nearObjects ["SmokeShell", 10];
	_allChemlights = [];
	{if (((toUpper (typeOf _x)) find (toUpper "chemlight")) > -1) then {_allChemlights pushback _x}} forEach _allGrenades;
	if (count _allChemlights > 0) then {
		_nearestChem = _allChemlights select 0;
		
		for "_i" from 1 to (count _allChemlights - 1) do { //sort by nearest first
			_chem = _allChemlights select _i;
			if ((_chem distance player) > (_nearestChem distance player)) then {_nearestChem = _chem};
		};
		
		_type = typeOf _nearestChem;
		_colour = switch (true) do {
		
			case (_type find "red" > -1): {[0.5,0,0]};
			case (_type find "green" > -1): {[0,0.5,0]};
			case (_type find "blue" > -1): {[0,0.6,0.6]};
			case (_type find "yellow" > -1): {[0.5,0.5,0]};
		};
		_playerPos = player modelToWorld (player selectionPosition "spine3");
		_chemLight = [1 - (_playerPos distance _nearestChem) / 10, _colour];
	};
	
	//flashlights	
	_allFlashlights = nearestObjects [player, ["CAManBase"], 25];
	if (count _allFlashlights > 0) then {
		{
			_man = _x;
			if (_man isFlashlightOn currentWeapon _man) then {
				_playerPos = player modelToWorld (player selectionPosition "spine3");
				_handPos = _man modelToWorld (_man selectionPosition "lefthand");
				_weaponVect = _man weaponDirection (currentWeapon _man);
				_weaponPos = _handPos vectorAdd (_weaponVect vectorMultiply 0.25);
				_manToPlayerVect = _weaponPos vectorFromTo _playerPos;
				_diff = vectorMagnitude (_weaponVect vectorDiff _manToPlayerVect);	
				if (_diff < 0.5) then {
					_item = 
					if ((currentWeapon _man) == primaryWeapon _man) then {
						(primaryWeaponItems _man) select 1}
					else {
						if ((currentWeapon _man) == secondaryWeapon _man) then {
							(secondaryWeaponItems _man) select 1}
						else {
							(handGunItems _man) select 1
						};
					};					
					_colourArray = getArray (configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "Flashlight" >> "color");
					_colour = _colourArray call _getColours;
					_flashLight = [(1 - ((_playerPos distance _weaponPos) / 25)) - _diff / 2, _colour];
				};
			};
			if (count _flashLight > 1) exitWith {};
		} forEach _allFlashlights;
	};
	
	{
		if ((_x select 0) > (_nearestLight select 0)) then {_nearestLight = _x};
	} forEach [_lampLight, _carLight, _fireLight, _chemLight, _flashLight];
	
	if (count _nearestLight > 1) then {

		_intensity = _nearestLight select 0;
		_colour = _nearestLight select 1;
		if (_intensity < 0) then {_intensity = 0} else {if (_intensity > 1) then {_intensity = 1}};
		_artificial = [_natural + _intensity, _colour];
	} else {_artificial = [0,[0,0,0]]};

} else {_artificial = [0,[0,0,0]]};

vip_lit_var_cl_artificialLight = _artificial;
vip_lit_var_cl_naturalLight = _natural;

//doesn't work because reflector angle/distance does not seem to be defined in vehicle (?)
/*
_nearestReflector = _liveReflectors select 0;
{
	if ((player distance (_veh modelToWorld (_veh selectionPosition (getText (_x >> "position"))))) < ((_veh modelToWorld (_veh selectionPosition (getText (_nearestReflector >> "position")))) distance player)) then {_nearestReflector = _x}
} forEach _liveReflectors;
_start = _veh modelToWorld (_veh selectionPosition (getText (_nearestReflector >> "position")));
_end = _veh modelToWorld (_veh selectionPosition (getText (_nearestReflector >> "direction")));
test_draw = [_start, _end];
_reflectorVect = _start vectorFromTo _end;
_playerPos = player modelToWorld (player selectionPosition "spine3");
_reflectorToPlayerVect = _start vectorFromTo _playerPos;
_diff = vectorMagnitude (_reflectorVect vectorDiff _reflectorToPlayerVect);
systemChat str [_diff];*/