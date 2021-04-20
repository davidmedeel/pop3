
/*
por: Medel
*/

0 spawn {
	waitUntil {!(isNull (findDisplay 602))};

	disableSerialization
	_display = findDisplay 602;

	if !((vehicle player) isEqualTo player) then {
		{
			_ctrl = _display displayCtrl _x;

			_ctrl ctrlSetFade 1;
			_ctrl ctrlCommit 0;
			_ctrl ctrlEnable false;

		} forEach [
			6381, 6191,
			6382, 6192,
			6305, 6306
		];

		{
			_ctrl = displayCtrl _x;

			_ctrl ctrlSetFade 0.7;
			_ctrl ctrlCommit 0;
			_ctrl ctrlEnable false;

		} forEach [632, 619];
	};
};
