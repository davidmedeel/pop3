
/*
por: Icaruk
	call ica_fnc_matriculas3D;
*/

removeAllMissionEventHandlers "Draw3D";
0 spawn {
	addMissionEventHandler ["Draw3D",{

		_target = cursorTarget;
		_dist = player distance _target;
		_dist = if (_dist < 1.5) then {1.5} else {_dist};

		if (_dist < 60) then {

			_mat = _target getVariable ["matricula", ""];

			if (side player == WEST) then {
				if ((["pop_portatil"] call ica_fnc_tengo) >= 1) then {
					if (("inf" call ica_fnc_expToLevel) >= 4) then {
						_mat = if (isNil {_target getVariable "vehicle_info_owners"}) then {
							"";
						} else {
							format ["%1   (%2)", _mat, (_target getVariable "vehicle_info_owners") select 0 select 1];
						};
					};
				};
			};

			drawIcon3D [
				"\a3\ui_f\data\map\Markers\System\dummy_ca.paa",
				[1,1,1, (60 - _dist) / 50],
				[((getPos _target) select 0), ((getPos _target) select 1), 0.5+(1.8/(60/_dist))],
				1,
				1,
				0,
				_mat,
				1.8,
				(0.037-(0.030*(_dist/60))),
				"TahomaB"
			];
		};
	}];
};