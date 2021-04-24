
/*
por: Icaruk
	["menu"] spawn ica_fnc_menuMineria;
	["diamantes"] spawn ica_fnc_menuMineria;
*/

_param = _this select 0;
_maxMineria = 200;

if (_param isEqualTo "menu") exitWith {
	if ((player distance (getMarkerPos "mrkGremioDeMineros")) > 2) exitWith {hint "Los negocios tienen que ser de cerca."};
	if ((count (nearestObjects [(getMarkerPos "mrkGremioDeMineros"), ["Man"], 2])) > 1) exitWith {
		hint "Los negocios tienen que ser de tú a tú, la demás peña, sobra.";
	};

	[player, ["minAre", "minCar", "minCob", "minHie", "minOro", "minPla"]] call ica_fnc_varToServer; waitUntil {recibido};
	disableSerialization;
	createDialog "mineria_dialog";

	_ui = uiNameSpace getVariable "mineria_dialog";
	_bar1 = _ui displayCtrl 7001;
	_bar2 = _ui displayCtrl 7002;
	_bar3 = _ui displayCtrl 7003;
	_bar4 = _ui displayCtrl 7004;
	_bar5 = _ui displayCtrl 7005;
	_bar6 = _ui displayCtrl 7006;
	_entrada = _ui displayCtrl 7007;
	_lista = _ui displayCtrl 7008;
	_boton = _ui displayCtrl 7009;

	_idxLista = lbCurSel 7008;
	_mineral = _lista lbData _idxLista;

	_bar1 progressSetPosition (minAre / _maxMineria);
	_bar2 progressSetPosition (minCar / _maxMineria);
	_bar3 progressSetPosition (minCob / _maxMineria);
	_bar4 progressSetPosition (minHie / _maxMineria);
	_bar5 progressSetPosition (minOro / _maxMineria);
	_bar6 progressSetPosition (minPla / _maxMineria);

	_minerales = ["Arena", "Carbón", "Cobre", "Hierro", "Oro", "Platino"];
	_data = ["Are", "Car", "Cob", "Hie", "Oro", "Pla"];

	_idx = 0;
	while {_idx < (count _minerales)} do {
		_lista lbAdd (_minerales select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_idx = _idx + 1;
	};

	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo'] spawn ica_fnc_menuMineria; "];
	_entrada ctrlSetEventHandler ["Char", "['actualizo'] spawn ica_fnc_menuMineria; "];
};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "mineria_dialog";
	_entrada = _ui displayCtrl 7007;
	_lista = _ui displayCtrl 7008;
	_boton = _ui displayCtrl 7009;

	_idxLista = lbCurSel 7008;
	mineral = _lista lbData _idxLista;
	private "_base";
	switch (mineral) do {
		case "Are": {_base = 400};
		case "Car": {_base = 450};
		case "Cob": {_base = 500};
		case "Hie": {_base = 600};
		case "Oro": {_base = 700};
		case "Pla": {_base = 800};
	};
	_eco=(missionNamespace getVariable (format ["min%1", mineral]))*5;
	precio = round (_base*(-0.0000005*_eco*_eco-0.00025*_eco+1));
	entrada = parseNumber (ctrlText _entrada);

	// hint format ["%1 y %2", entrada, mineral]; 

	_boton buttonSetAction '
		closeDialog 0;
		["vendo", mineral, precio, entrada] spawn ica_fnc_menuMineria;
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
	_mineral = _this select 1;
	_precio = _this select 2;
	_can = _this select 3;

	if (_can <= 0) exitWith {hint "Eso no es ninguna cantidad"};

	_pre = round (_precio * _can);

	if (isNil {_mineral}) exitWith {hint "No has seleccionado nada"};

	private "_class";
	_class = switch (_mineral) do {
		case "Are": {"pop_arena_r"};
		case "Car": {"pop_carbon_r"};
		case "Cob": {"pop_cobre_r"};
		case "Hie": {"pop_hierro_r"};
		case "Oro": {"pop_oro_r"};
		case "Pla": {"pop_platino_r"};
	};
	if !(([_class] call ica_fnc_tengo) >= _can) exitWith {hint "No tienes minerales para mí. Aquí quien no pica, no cobra."};

	_mineral = format ["min%1", _mineral];
	missionNamespace setVariable [_mineral, (missionNamespace getVariable _mineral) + _can];
	if ((missionNamespace getVariable _mineral) > _maxMineria) then {missionNamespace setVariable [_mineral, _maxMineria]};
	publicVariableServer _mineral;

	[_class, _can *-1] call ica_fnc_item;
	["mineria", _pre] spawn ica_fnc_subeBajaBeneficios;
	medel_din = medel_din + _pre;
	
	["exp", _pre / 1000] call ica_fnc_arrayExp;
	
	hint "Buen trabajo, sigue así.";
	[format ["- %1 %2", _can, [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
	[format ["+ %1€", [_pre] call ica_fnc_numToStr]] call ica_fnc_infolog;
};

if (_param isEqualTo "diamantes") exitWith {
	_tengo = ["pop_diamante"] call ica_fnc_tengo;
	if (_tengo == 0) exitWith {hint "No tienes diamantes que venderme"};
	if (_tengo >= 10) then {_tengo = 10};
	["pop_diamante", _tengo *-1] call ica_fnc_item;
	_din = _tengo * (15000 + (round random 5000));
	medel_din = medel_din + _din;
	[format ["-%1 Diamante", _tengo]] call ica_fnc_infolog;
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	
	
	["Money Log",format [
	"%1 - (%2) ha vendido %3 diamantes por un total de %6  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_tengo,
	medel_atmdin,
	medel_din,
	_din
	]
	] remoteexeccall ["ica_fnc_customlog",2];
	
	
};
