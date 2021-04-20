call vip_lit_fnc_cl_lighting;

_viewPos = positionCameraToWorld [0,0,0];
_open = false;
_underWater = 0;
if (((_viewPos select 2) < 0) && surfaceIsWater _viewPos) then {
	_underwater = (getPosASL player) select 2;
} else {
	if (rain > 0.1) then {
		_veh = vehicle player;
		if (_veh != player) then {
			if ((toUpper (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "attenuationEffectType")) find "OPEN") > -1) then {_open = true};
		} else {
			_playerPos = ATLtoASL (player modelToWorld (player selectionPosition "head"));
			if !(lineIntersects [_playerPos, [_playerPos select 0, _playerPos select 1, (_playerPos select 2) + 30]]) then {_open = true};
		};
	};
};

if (_open) then {[findDisplay 12 displayCtrl 51] spawn vip_lit_fnc_cl_mapRainLoop};

vip_lit_var_cl_mapOpen = [true, _open, _underwater];
waitUntil {

	if ((round(diag_ticktime) mod 5) == 0) then {call vip_lit_fnc_cl_lighting};
	
	sleep 0.016;

	!visibleMap
};
vip_lit_var_cl_mapOpen = [false, false, 0];