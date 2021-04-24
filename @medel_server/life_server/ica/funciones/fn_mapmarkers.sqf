
/*
Por: Killzone_Kid
	0 spawn ica_fnc_mapMarkers;
*/

waitUntil {!isNull findDisplay 12};
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
	if (visibleMap) then {
		_scale = 0.05 / ctrlMapScale (_this select 0);
		if (_scale > 0.95) then {_scale = 0.95};
		{
			_m = "#markerSize_" + _x;
			if (markerShape _x == "ICON") then {
				if (isNil {missionNamespace getVariable _m}) then {
					missionNamespace setVariable [_m, markerSize _x];
				};
				_x setMarkerSizeLocal [
					((missionNamespace getVariable _m) select 0) * _scale,
					((missionNamespace getVariable _m) select 1) * _scale
				];
			};
		} forEach allMapMarkers;
	};
}];
