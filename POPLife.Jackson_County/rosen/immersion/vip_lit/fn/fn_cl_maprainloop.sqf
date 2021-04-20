disableSerialization;
_map = _this select 0;
_mapSize = vip_lit_var_cl_mapWorldSize * 1280;
_mapHalf = _mapSize / 2;

waitUntil {
	_drop = floor(random((((1 - rain) * 1.5) + 0.1) * 100));
	if (_drop < 10) then {
		_snd = vip_lit_var_cl_mapRainSounds select floor(random(count vip_lit_var_cl_mapRainSounds));
		_a = floor(random(2));
		_b = if (_a == 1) then {1} else {floor(random(2))};
		for "_i" from _a to _b do {
			playSound (_snd select _i)
		};
		
		_mapZoom = ctrlMapScale _map;
		if (_mapZoom < 0.2) then {_mapZoom = 0.2};
		_mapPos = _map ctrlMapScreenToWorld [0.5, 0.5];
		for "_i" from 0 to (round(rain * 10)) do {
			_x = (_mapPos select 0) + random(_mapSize) * _mapZoom * call vip_cmn_fnc_cl_randomSign;
			_y = (_mapPos select 1) + random(_mapSize) * _mapZoom * call vip_cmn_fnc_cl_randomSign;
			if ((_x <= _mapSize) && (_x >= 0) && (_y <= _mapSize) && (_y >= 0)) then {
				vip_lit_var_cl_mapRainArray pushBack [diag_tickTime, vip_lit_var_cl_mapRainTypes select (floor random(7)), _x, _y, 3 + random(1), random(360)];
			};
		};
	};
	
	_rainArray = vip_lit_var_cl_mapRainArray;
	{
		_diff = diag_tickTime - (_x select 0);
		if (_diff > 1) then {_rainArray deleteAt _forEachIndex};
	} forEach vip_lit_var_cl_mapRainArray;
	
	sleep 0.004;
	
	!(visibleMap) || (rain < 0.1)
};