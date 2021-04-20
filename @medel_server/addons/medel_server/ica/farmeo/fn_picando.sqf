/*
Minijuego para picar, hay que pulsar el botón cuando la barra que se llena y que se vacía rápidamente esté a tope
by: Icaruk

["menu", "hierro"] spawn ica_fnc_picando;
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	mineral = _this select 1;
	_necesito = if (mineral == "arena") then {"cl_shovel"} else {"cl_pick_axeweap"};
	
	if (!isNil {espera}) exitWith {hint format ["Espera %1 segundos, tienes que descansar", espera]};
	if ((("min" call ica_fnc_expToLevel) < 7) AND (([_necesito] call ica_fnc_tengo) < 1)) exitWith {hint "Necesitas un pico (o una pala para la arena)."};
	if (currentWeapon player != _necesito && (("min" call ica_fnc_expToLevel) < 7)) exitWith {hint "Con las manos es dificil..."};
	if (vehicle player != player) exitWith {hint "¿Pretendes picar desde el vehículo? ¿Por la ventanilla? Venga va, no me seas vago..." };

	disableSerialization;
	createDialog "picando";
	_ui = uiNameSpace getVariable "picando";
	_txt = (_ui displayCtrl 4050);
	_boton = (_ui displayCtrl 4051);

	_boton buttonSetAction '
		parate = true;
	';

	private "_ope",
	tpicar = 10;
	while {dialog} do {
		if (!isNil {parate}) exitWith {
			0 spawn {
				espera = tpicar + 1;
				while {true} do {
					if (espera <= 0) exitWith {espera = nil};
					espera = espera - 1;
					sleep 1;
				};
			};

			parate = nil;
			if (tpicar >= 10) then {_ope = -1};
			if (tpicar <= 0) then {_ope = 1};
			tpicar = tpicar + _ope;
			_txt ctrlSetStructuredText parseText format ["<t align='left' size='2.2'>  %1</t>", tpicar];
			sleep 0.4;
			if (tpicar >= 10) then {_ope = -1};
			if (tpicar <= 0) then {_ope = 1};
			tpicar = tpicar + _ope;
			_txt ctrlSetStructuredText parseText format ["<t align='left' size='2.2'>  %1</t>", tpicar];
			sleep 0.6;
			if (tpicar >= 10) then {_ope = -1};
			if (tpicar <= 0) then {_ope = 1};
			tpicar = tpicar + _ope;
			_txt ctrlSetStructuredText parseText format ["<t align='left' size='2.2'>  %1</t>", tpicar];
			sleep 0.8;
			if (tpicar >= 10) then {_ope = -1};
			if (tpicar <= 0) then {_ope = 1};
			tpicar = tpicar + _ope;
			_txt ctrlSetStructuredText parseText format ["<t align='left' size='2.2'>  %1</t>", tpicar];
			sleep 1;
			if !(dialog) exitWith {};
			["pica", tpicar, mineral] call ica_fnc_picando;
			closeDialog 0;
		};

		if (tpicar >= 10) then {_ope = -1};
		if (tpicar <= 0) then {_ope = 1};
		tpicar = tpicar + _ope;
		_txt ctrlSetStructuredText parseText format ["<t align='left' size='2.2'>  %1</t>", tpicar];
		sleep 0.04;
	};

};

if (_param isEqualTo "pica") exitWith {
	_tpicar = _this select 1;
	_mineral = _this select 2;

	if (isNil {tpicar}) exitWith {};
	closeDialog 0;
	tpicar = nil;

	while {_tpicar > 0} do {
		titleText [format ["Picando... %1s", _tpicar], "PLAIN"];
		_tpicar = _tpicar - 1;
		sleep 1;
	};
	titleText ["¡Hecho!", "PLAIN", 0.1];

	_min = "min" call ica_fnc_expToLevel;

	_puedoPicar = switch (_mineral) do {
		case "arena": {if (_min >= 1) then {true}};
		case "carbon": {if (_min >= 2) then {true}};
		case "cobre": {if (_min >= 3) then {true}};
		case "hierro": {if (_min >= 4) then {true}};
		case "oro": {if (_min >= 5) then {true}};
		case "platino": {if (_min >= 6) then {true}};
	};
	if (isNil {_puedoPicar}) exitWith {hint "No tienes los conocimientos necesarios para hacer esto"};

	_class = format ["pop_%1_r", _mineral];
	[_class, 1 + floor random 2] call ica_fnc_item;
	[format ["+1 %1", _mineral]] call ica_fnc_infolog;
	_tocapelotas = floor (random 300); // 0.3%
	if (_tocapelotas < 1) then {
		["pop_pico", -1] call ica_fnc_item;
		titleText ["Rompistes el pico manazas", "PLAIN"];
	};
};