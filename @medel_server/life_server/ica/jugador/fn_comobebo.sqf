
/*
Script de la misión Desolation creado por Icaruk
	["init"] call ica_fnc_comoBebo;
	["como", 10] call ica_fnc_comoBebo;
	["bebo", 10] call ica_fnc_comoBebo;
	["todo", 10] call ica_fnc_comoBebo;
	["como", 10, "pop_p_clasica"] call ica_fnc_comoBebo;
	["todo", 10, "pop_p_clasica"] call ica_fnc_comoBebo;
*/

private ["_n", "_item"];

_param = _this select 0;

_h = profileNamespace getVariable "fois";
_s = profileNamespace getVariable "hearb";

if (_param isEqualTo "init") exitWith {

	if (isNil {_h}) then { profileNamespace setVariable ["fois", 100] };
	if (_h > 100) then { profileNamespace setVariable ["fois", 100] };
	if (isNil {_s}) then { profileNamespace setVariable ["hearb", 100] };
	if (_s > 100) then { profileNamespace setVariable ["hearb", 100] };

	[] spawn { // Agua al andar
		_max = 200; // son 400m (100/3) = 20 * 0.4 = 13.3km aguantará andando
		_andado = 0;
		_ultimaPos = (getPos player select 0) + (getPos player select 1);

		while {true} do {
			sleep 0.5;
			if (!alive player) then {
				_andado = 0;
			} else {
				_estoy = (getPos player select 0) + (getPos player select 1);
				if ((_estoy != _ultimaPos) && (vehicle player == player)) then {
					_andado = _andado + 1;
					if (_andado == _max) then	{
						_andado = 0;
						if ((player distance (getMarkerPos "jail_marker")) > 120) then {
							profileNamespace setVariable ["fois", (profileNamespace getVariable "fois") - 1];
							call ica_fnc_actualizaHUD;
						};
					};
				};
				_ultimaPos = (getPos player select 0) + (getPos player select 1);
			};
		};
	};

	[] spawn { // Agua
		while {true} do {
			sleep 60; // aguantas 1.85min
			if ((player distance (getMarkerPos "jail_marker")) > 120) then {
				profileNamespace setVariable ["fois", (profileNamespace getVariable "fois") - 0.45];
				call ica_fnc_actualizaHUD;
			};

			if ((profileNamespace getVariable "fois") <= 0) then {
				[] spawn {
					while {true} do {
						if ((profileNamespace getVariable "fois") > 0) exitWith {};
						player setDamage ((getDammage player) + 0.02);
						_str = ["Debería beber algo", "Tengo sed", "Estoy sediento", "Tendo da boca seca"] call BIS_fnc_selectRandom;
						titleText [_str, "PLAIN DOWN", 0.6];
						sleep 10;
					};
				};
			};
		};
	};

	[] spawn { // Comida
		while {true} do {
			sleep 60; // aguantas 2.08h
			if ((player distance (getMarkerPos "jail_marker")) > 120) then {
				profileNamespace setVariable ["hearb", (profileNamespace getVariable "hearb") - 0.4];
				call ica_fnc_actualizaHUD;
			};

			if ((profileNamespace getVariable "hearb") <= 0) then {
				[] spawn {
					while {true} do {
						if ((profileNamespace getVariable "hearb") > 0) exitWith {};
						player setDamage ((getDammage player) + 0.02);
						_str = ["Debería de comer algo", "Tengo hambre", "Estoy hambriento", "Mi estómago ruge, violentamente"] call BIS_fnc_selectRandom;
						titleText [_str, "PLAIN DOWN", 0.6];
						sleep 10;
					};
				};
			};
		};
	};

	[] spawn {
		while {true} do
		{
			enableSentences false;
			sleep 20;
		};
	};
};


_n = _this select 1;
_item = _this select 2;
if (!isNil {_item}) then {
	_item spawn {sleep 0.1; player removeItem _this};
};

if (isNil {_h}) then { profileNamespace setVariable ["fois", 100] };
if (_h > 100) then { profileNamespace setVariable ["fois", 100] };
if (isNil {_s}) then { profileNamespace setVariable ["hearb", 100] };
if (_s > 100) then { profileNamespace setVariable ["hearb", 100] };

// if ((skillquepido) > X) then {_n = _n * 1.3}; // creo que era un 30% lo que te daba de más al tener skill y comer o beber

 if !((player getVariable "organos") select 2) then { // tengo el estómago jodido
	_n = 1;
	hint "Siento un fuerte dolor en el estómago... no puedo comer ni beber :S";
 };

if (_param isEqualTo "como") exitWith {
	profileNamespace setVariable ["hearb", (profileNamespace getVariable "hearb") + _n];
	if ((profileNamespace getVariable "hearb") > 100) then { profileNamespace setVariable ["hearb", 100] };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
};

if (_param isEqualTo "bebo") exitWith {
	profileNamespace setVariable ["fois", (profileNamespace getVariable "fois") + _n];
	if ((profileNamespace getVariable "fois") > 100) then { profileNamespace setVariable ["fois", 100] };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
};
if (_param isEqualTo "todo") exitWith {
	profileNamespace setVariable ["hearb", (profileNamespace getVariable "hearb") + _n];
	if ((profileNamespace getVariable "hearb") > 100) then { profileNamespace setVariable ["hearb", 100] };
	profileNamespace setVariable ["fois", (profileNamespace getVariable "fois") + _n];
	if ((profileNamespace getVariable "fois") > 100) then { profileNamespace setVariable ["fois", 100] };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
};
