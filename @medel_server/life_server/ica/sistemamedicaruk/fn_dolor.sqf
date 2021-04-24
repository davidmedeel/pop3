
/*
por: Icaruk
	[player, 2] spawn ica_fnc_dolor;
		de 0.5 a 2
*/

_victima = _this select 0;

_victima setVariable ["dolor", true];

private "_fuera";
while {true} do {
	_dolor = ((_victima getVariable "cabeza") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "piernas")) / 4;

	if (!isNil {_dolor}) then {
		if (_dolor < 20) exitWith {_victima setVariable ["dolor", false]; hint "No me duele nada"; _fuera = true;};

		private "_borrosidad";
		_borrosidad = switch (true) do {
			case (_dolor >= 80): {2};
			case (_dolor >= 60): {1.5};
			case (_dolor >= 40): {1};
			case (_dolor >= 20): {0.5};
			case (_dolor >= 0): {0};
		};
		if (_borrosidad > 0) then {[_borrosidad] spawn ica_fnc_borroso};

		if (((random 100) < (_dolor / 25)) and (((animationstate _victima) == "ainjPpneMstpSnonWnonDnon") or ((animationstate _victima) == "amovppnemstpsnonwnondnon_injured")))  then {
			[_victima, true] spawn ica_fnc_inconsciente;
		};
	};

	sleep 60;

	if (!isNil {_dolor}) then {
		if ((random 100) > ((_dolor) * 0.25)) then {
			if (((animationstate _victima) == "ainjPpneMstpSnonWnonDnon") or ((animationstate _victima) == "amovppnemstpsnonwnondnon_injured")) then { // si no estoy inconsciente, no me levanto porque ya estoy de pie
				[_victima, false] spawn ica_fnc_inconsciente;
			};
		};
	};

	if (!isNil {_fuera}) exitWith {};
};
