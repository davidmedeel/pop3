
/*
por: Icaruk
	["menu", true, 1] spawn ica_fnc_traficanteDroga
	["menu", true, 2] spawn ica_fnc_traficanteDroga
	["menu", false, 1] spawn ica_fnc_traficanteDroga
	["menu", false, 2] spawn ica_fnc_traficanteDroga
*/

_param = param [0];
_maxTraf = 200;

if (_param isEqualTo "menu") exitWith {
	private "_mult";
	_modo = param [1];
	_tio = param [2];

	_tioObj = if (_tio == 1) then {traficanteDeDroga1} else {traficanteDeDroga2};
	if ((player distance _tioObj) > 3) exitWith {hint "Estás demasiado lejos para hacer transas"};
	if ((count (nearestObjects [(getPos _tioObj), ["Man"], 4])) > 1) exitWith {
		hint "Hay demasiada peña por aquí, diles que se alejen.";
	};
	if !(isNull objectParent player) exitWith {hint "Mejor baja del vehículo, que no me fio..."};
	_mult=0.5;
	if ({side _x == WEST} count playableUnits != 0) then {
		if (({side _x == civilian} count playableUnits)/({side _x == WEST} count playableUnits) > 3) then {_mult = 1};
		if (({side _x == civilian} count playableUnits)/({side _x == WEST} count playableUnits) > 5) then {_mult = 0.75};
		if (({side _x == civilian} count playableUnits)/({side _x == WEST} count playableUnits) > 10) then {_mult = 0.5};

	};

	[player, ["traf1Mar", "traf2Mar", "traf1Her", "traf2Her", "traf1Coc", "traf2Coc", "traf1Met", "traf2Met"]] call ica_fnc_varToServer; waitUntil {recibido};
	createDialog "traficante_dialog";

	disableSerialization;
	_ui = uiNameSpace getVariable "traficante_dialog";
	_boton = _ui displayCtrl 6015;
	_entrada = _ui displayCtrl 6016;
	_lista = _ui displayCtrl 6017;
	_bar1 = _ui displayCtrl 6018;
	_bar2 = _ui displayCtrl 6019;
	_bar3 = _ui displayCtrl 6020;
	_bar4 = _ui displayCtrl 6021;
	_txt1 = _ui displayCtrl 6022;
	_txt2 = _ui displayCtrl 6023;
	_txt3 = _ui displayCtrl 6024;
	_txt4 = _ui displayCtrl 6025;
	_pre1 = _ui displayCtrl 6026;
	_pre2 = _ui displayCtrl 6027;
	_pre3 = _ui displayCtrl 6028;
	_pre4 = _ui displayCtrl 6029;

	_idxLista = lbCurSel 6017;
	_droga = _lista lbData _idxLista;

	if (_modo) then {
		_boton ctrlSetText "Comprar";
		if (_tio == 1) then {

			_pre1 ctrlSetText format ["%1 €", 1800/_mult];
			_pre2 ctrlSetText format ["%1 €", 2400/_mult];
			_pre3 ctrlSetText format ["%1 €", 1800/_mult];
			_pre4 ctrlSetText format ["%1 €", 2100/_mult];
			_bar1 progressSetPosition (traf1Mar / _maxTraf);
			_bar2 progressSetPosition (traf1Her / _maxTraf);
			_bar3 progressSetPosition (traf1Coc / _maxTraf);
			_bar4 progressSetPosition (traf1Met / _maxTraf);
		} else {

			_pre1 ctrlSetText format ["%1 €", 1800/_mult];
			_pre2 ctrlSetText format ["%1 €", 2400/_mult];
			_pre3 ctrlSetText format ["%1 €", 1800/_mult];
			_pre4 ctrlSetText format ["%1 €", 2100/_mult];
			_bar1 progressSetPosition (traf2Mar / _maxTraf);
			_bar2 progressSetPosition (traf2Her / _maxTraf);
			_bar3 progressSetPosition (traf2Coc / _maxTraf);
			_bar4 progressSetPosition (traf2Met / _maxTraf);
		};

		_txt1 ctrlSetStructuredText parseText format ["<t align='left'>  Marihuana</t>"];
		_txt2 ctrlSetStructuredText parseText format ["<t align='left'>  Heroína</t>"];
		_txt3 ctrlSetStructuredText parseText format ["<t align='left'>  Cocaína</t>"];
		_txt4 ctrlSetStructuredText parseText format ["<t align='left' size='0.91'>  Metanfetamina</t>"];

		_lista lbAdd format ["Marihuana"];
			_lista lbSetData [0, "pop_marihuana_f"];
			_lista lbSetValue [0, parseNumber (ctrlText _pre1)];
		_lista lbAdd format ["Heroína"];
			_lista lbSetData [1, "pop_heroina_f"];
			_lista lbSetValue [1, parseNumber (ctrlText _pre2)];
		_lista lbAdd format ["Cocaína"];
			_lista lbSetData [2, "pop_cocaina_f"];
			_lista lbSetValue [2, parseNumber (ctrlText _pre3)];
		_lista lbAdd format ["Metanfetamina"];
			_lista lbSetData [3, "pop_metanfetamina_f"];
			_lista lbSetValue [3, parseNumber (ctrlText _pre4)];
	} else {
		_boton ctrlSetText "Vender";
		if (_tio == 1) then {

			_pre1 ctrlSetText format ["%1 €",round (600*_mult)];
			_pre2 ctrlSetText format ["%1 €",round (850*_mult)];
			_pre3 ctrlSetText format ["%1 €",round (650*_mult)];
			_pre4 ctrlSetText format ["%1 €",round (700*_mult)];
			_bar1 progressSetPosition (traf1Mar / _maxTraf);
			_bar2 progressSetPosition (traf1Her / _maxTraf);
			_bar3 progressSetPosition (traf1Coc / _maxTraf);
			_bar4 progressSetPosition (traf1Met / _maxTraf);
		} else {

			_pre1 ctrlSetText format ["%1 €",round (700*_mult)];
			_pre2 ctrlSetText format ["%1 €",round (900*_mult)];
			_pre3 ctrlSetText format ["%1 €",round (750*_mult)];
			_pre4 ctrlSetText format ["%1 €",round (800*_mult)];
			_bar1 progressSetPosition (traf2Mar / _maxTraf);
			_bar2 progressSetPosition (traf2Her / _maxTraf);
			_bar3 progressSetPosition (traf2Coc / _maxTraf);
			_bar4 progressSetPosition (traf2Met / _maxTraf);
		};

		_txt1 ctrlSetStructuredText parseText format ["<t align='left'>  Cannabis</t>"];
		_txt2 ctrlSetStructuredText parseText format ["<t align='left'>  Opio</t>"];
		_txt3 ctrlSetStructuredText parseText format ["<t align='left'>  Coca</t>"];
		_txt4 ctrlSetStructuredText parseText format ["<t align='left'>  Efedrina</t>"];

		_lista lbAdd format ["Cannabis"];
			_lista lbSetData [0, "pop_cannabis_i"];
			_lista lbSetValue [0, parseNumber (ctrlText _pre1)];
		_lista lbAdd format ["Opio"];
			_lista lbSetData [1, "pop_opio_b"];
			_lista lbSetValue [1, parseNumber (ctrlText _pre2)];
		_lista lbAdd format ["Coca"];
			_lista lbSetData [2, "pop_coca_b"];
			_lista lbSetValue [2, parseNumber (ctrlText _pre3)];
		_lista lbAdd format ["Efedrina"];
			_lista lbSetData [3, "pop_efedrina_b"];
			_lista lbSetValue [3, parseNumber (ctrlText _pre4)];
	};
	tio = _tio;
	modo = _modo;
	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo', tio, modo] spawn ica_fnc_traficantedroga; "];
	_entrada ctrlSetEventHandler ["char", "['actualizo', tio, modo] spawn ica_fnc_traficantedroga; "];
};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_tio = _this select 1;
	_modo = _this select 2;

	_ui = uiNameSpace getVariable "traficante_dialog";
	_boton = _ui displayCtrl 6015;
	_entrada = _ui displayCtrl 6016;
	_lista = _ui displayCtrl 6017;

	_idxLista = lbCurSel 6017;
	droga = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;
	tio = _tio;
	entrada = parseNumber ctrlText _entrada;

	if (_modo) then {
		_boton buttonSetAction '
			closeDialog 0;
			["compro", droga, precio, parseNumber ctrlText 6016, tio] spawn ica_fnc_traficantedroga;
		';
	} else {
		_boton buttonSetAction '
			closeDialog 0;
			["vendo", droga, precio, parseNumber ctrlText 6016, tio] spawn ica_fnc_traficantedroga;
		';
	};
};

//////////////
if ((_param isEqualTo "compro") OR (_param isEqualTo "vendo")) then {
	if (isNil {autoclick}) then {
		autoclick = 0;
		[] spawn {sleep 1; autoclick = nil};
	};
	autoclick = autoclick + 1;
};
if !(isNil {autoclick}) then {
	_fuera = false;
	if (autoclick > 13) exitWith {
		player setDamage 1;
		_fuera = true;
	};
	if (_fuera) exitWith {};
};
////////////////

if (_param isEqualTo "compro") exitWith {
	private "_fuera";

	_droga = toLower (_this select 1);
	_precio = _this select 2;
	_can = _this select 3;
	_tio = _this select 4;

	if (isNil {_droga}) exitWith {hint "No has seleccionado nada"};
	_can = round _can;
	if (_can <= 0) exitWith {hint "Eso no es ninguna cantidad"};

	_pre = round (_precio * _can);
	if !(medel_din >= _pre) exitWith {hint "No tienes dinero para pagarme."};
	if !(player canAdd _droga) exitWith {hint "No te cabe nada más, y no creo que quieras transportarlo en ninguna cavidad..."};

	_cuanto = _can * 5;
	
	_varDroga = switch (_droga) do {
		case "pop_marihuana_f": {"Mar"};
		case "pop_heroina_f": {"Her"};
		case "pop_cocaina_f": {"Coc"};
		case "pop_metanfetamina_f": {"Met"}; 
	};
	_var = format ["traf%1%2", _tio, _varDroga];

	if ((missionNamespace getVariable _var) < _cuanto) exitWith {hint "No me queda de eso, tráeme más materia prima, que yo la procesaré, primo."};
	missionNamespace setVariable [_var, (missionNamespace getVariable _var) - _cuanto];
	if ((missionNamespace getVariable _var) > _maxTraf) then {missionNamespace setVariable [_var, _maxTraf]};
	if ((missionNamespace getVariable _var) < 0) then {missionNamespace setVariable [_var, 0]};
	publicVariableServer _var;

	[_droga, _can] call ica_fnc_item;
	medel_din = medel_din - _pre;
	hint format ["Me has pagado %1€ y este fardo ahora es tuyo, será mejor que lo escondas bien hasta que lo vendas", _pre];
	[format ["- %1€", [_pre] call ica_fnc_numToStr]] call ica_fnc_infolog;
	[format ["+ %1 %2", _can, [_droga] call ica_fnc_classToName]] call ica_fnc_infolog;
};

if (_param isEqualTo "vendo") exitWith {
	_droga = _this select 1;
	_precio = _this select 2;
	_can = _this select 3;
	_tio = _this select 4;
	_can = round _can;
	if (_can <= 0) exitWith {hint "Eso no es ninguna cantidad"};

	_pre = round (_precio * _can);

	if (isNil {_droga}) exitWith {hint "No has seleccionado nada"};
	if !(([_droga] call ica_fnc_tengo) >= _can) exitWith {hint "No tienes mercancía para mí. Vete de aquí antes de que te vean."};

		[_tio, _droga, _can, _maxTraf] spawn {
			_tio = _this select 0;
			_droga = _this select 1;
			_can = _this select 2;
			_maxTraf = _this select 3;

			sleep (60 * 5);

			_varDroga = switch (_droga) do {
				case "pop_cannabis_i": {"Mar"};
				case "pop_opio_b": {"Her"};
				case "pop_coca_b": {"Coc"};
				case "pop_efedrina_b": {"Met"}; 
			};
			_var = format ["traf%1%2", _tio, _varDroga];

			missionNamespace setVariable [_var, (missionNamespace getVariable _var) + _can];
			if ((missionNamespace getVariable _var) > _maxTraf) then {missionNamespace setVariable [_var, _maxTraf]};
			if ((missionNamespace getVariable _var) < 0) then {missionNamespace setVariable [_var, 0]};
			publicVariableServer _var;
		};

	[_droga, _can *-1] call ica_fnc_item;
	medel_din = medel_din + medel_dsin_pre;
	hint format ["Aquí tienes tus %1€, tú no me has visto y yo no te he visto.", _pre];
	[format ["- %1 %2", _can, [_droga] call ica_fnc_classToName]] call ica_fnc_infolog;
	[format ["+ %1€", [_pre] call ica_fnc_numToStr]] call ica_fnc_infolog;
};


// ["mochila_grande", 1] call ica_fnc_item; ["pop_cannabis_b", 5] call ica_fnc_item; medel_din = 1000000;