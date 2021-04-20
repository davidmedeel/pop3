
/*
por: Icaruk
	["menu"] spawn ica_fnc_camello
*/

_param = _this select 0;
_maxCame = 50;

if (_param isEqualTo "menu") exitWith {
	private "_mult";
	if ((player distance camello) > 3) exitWith {hint "Los negocios tienen que ser de cerca."};
	if ((count (nearestObjects [(getPos camello), ["Man"], 4])) > 1) exitWith {
		hint "Los negocios tienen que ser de tú a tú, la demás peña, sobra.";
	};
	if (vehicle player != player) exitWith {hint "Mejor baja del vehículo, que no me fio..."};

	_mult = 0.5;
	if ({side _x == WEST} count playableUnits != 0) then {
		_polis = ({side _x == civilian} count playableUnits) / ({side _x == WEST} count playableUnits);
		if (_polis < 12) then {_mult = 0.5};
		if (_polis < 8) then {_mult = 0.75};
		if (_polis < 4) then {_mult = 1};
	};

	[player, ["camMar", "camHer", "camCoc", "camMet"]] call ica_fnc_varToServer; waitUntil {recibido};
	disableSerialization;
	createDialog "traficante_dialog";

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

	_boton ctrlSetText "Vender";

	_pre1 ctrlSetText format ["%1 €",round (7000*(-0.0000005*camMar*20*camMar*20-0.00025*camMar*20+1)*_mult)];
	_pre2 ctrlSetText format ["%1 €",round (10000*(-0.0000005*camHer*20*camHer*20-0.00025*camHer*20+1)*_mult)];
	_pre3 ctrlSetText format ["%1 €",round (8500*(-0.0000005*camCoc*20*camCoc*20-0.00025*camCoc*20+1)*_mult)];
	_pre4 ctrlSetText format ["%1 €",round (8500*(-0.0000005*camMet*20*camMet*20-0.00025*camMet*20+1)*_mult)];
	_bar1 progressSetPosition (camMar / _maxCame);
	_bar2 progressSetPosition (camHer / _maxCame);
	_bar3 progressSetPosition (camCoc / _maxCame);
	_bar4 progressSetPosition (camMet / _maxCame);


	_txt1 ctrlSetStructuredText parseText format ["<t align='left'>  Marihuana</t>"];
	_txt2 ctrlSetStructuredText parseText format ["<t align='left'>  Heroína</t>"];
	_txt3 ctrlSetStructuredText parseText format ["<t align='left'>  Cocaína</t>"];
	_txt4 ctrlSetStructuredText parseText format ["<t align='left' size='0.91'>  Metanfetamina</t>"];

	// Creo la lista
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

	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo'] spawn ica_fnc_camello; "];
};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "traficante_dialog";
	_boton = _ui displayCtrl 6015;
	_entrada = _ui displayCtrl 6016;
	_lista = _ui displayCtrl 6017;

	_idxLista = lbCurSel 6017;
	droga = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;
	entrada = parseNumber (ctrlText _entrada);

	_boton buttonSetAction '
		closeDialog 0;
		["vendo", droga, precio, entrada] spawn ica_fnc_camello;
	';
};

//////////////
if (_param isEqualTo "vendo") then {
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

if (_param isEqualTo "vendo") exitWith {
	_droga = toLower (_this select 1);
	_precio = _this select 2;
	_can = _this select 3;
	_can = round _can;
	if (_can <= 0) exitWith {hint "Eso no es ninguna cantidad"};

	_pre = round (_precio * _can);

	if (isNil {_droga}) exitWith {hint "No has seleccionado nada"};
	if !(([_droga] call ica_fnc_tengo) >= _can) exitWith {hint "No tienes mercancía para mí. Vete de aquí antes de que te vean."};

	_varDroga = switch (_droga) do {
		case "pop_marihuana_f": {"Mar"};
		case "pop_heroina_f": {"Her"};
		case "pop_cocaina_f": {"Coc"};
		case "pop_metanfetamina_f": {"Met"};
	};
	_var = format ["cam%1", _varDroga];

	missionNamespace setVariable [_var, (missionNamespace getVariable _var) + _can];
	if ((missionNamespace getVariable _var) > _maxCame) then {missionNamespace setVariable [_var, _maxCame]};
	if ((missionNamespace getVariable _var) < 0) then {missionNamespace setVariable [_var, 0]};
	publicVariableServer _var;

	[_droga, _can *-1] call ica_fnc_item;
	medel_din = medel_din + medel_dsin_pre;
	["exp", _pre / 1000] call ica_fnc_arrayExp;
	hint format ["Nadie te ha dado %1€, nadie está aquí y tú no le has dado nada a nadie.", _pre];
	[format ["- %1 %2", _can, [_droga] call ica_fnc_classToName]] call ica_fnc_infolog;
	[format ["+ %1€", [_pre] call ica_fnc_numToStr]] call ica_fnc_infolog;
};
