
/*
por: Icaruk
	["menu"] call ica_fnc_mensajesica;
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	disableSerialization;
	createDialog "mensajesica";
	_ui = uiNamespace getVariable "mensajesica";

	_lista = _ui displayCtrl 7080;
	_desplegable = _ui displayCtrl 7081;
	_entrada = _ui displayCtrl 7082;
	_boton = _ui displayCtrl 7083;

	_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo'] call ica_fnc_mensajesica; "];
	_desplegable ctrlSetEventHandler ["LBSelChanged", "['actualizo'] call ica_fnc_mensajesica; "];
	_entrada ctrlSetEventHandler ["Char", "['actualizo'] call ica_fnc_mensajesica; "];

	_modosDespl = ["Mis mensajes", "Mensaje privado", "Policía", "EMS", "Admin"];
	_idx = 0;
	while {_idx < count _modosDespl} do {
		_desplegable lbAdd (_modosDespl select _idx);
		_desplegable lbSetData [_idx, (_modosDespl select _idx)];
		_idx = _idx + 1;
	};
	
	0 spawn {
		while {!isNil {uiNamespace getVariable "mensajesica"}} do {
			texto = ctrlText 7082;
			sleep 0.5;
		};
	};
};

if (_param isEqualTo "actualizo") exitWith {
	modo = toLower (lbData [7081, (lbCurSel 7081)]);
	// texto = ctrlText 7082; // se come el último caracter

	if (modo isEqualTo "mis mensajes") then {
		ctrlShow [7083, false];
		ctrlShow [7080, true];

		lbClear 7080;
		_misMensajes = profilenamespace getVariable "arraySMS";
		reverse _misMensajes;

		_idx = 0;
		while {_idx < count _misMensajes} do {
			lbAdd [7080, _misMensajes select _idx select 0];
			_idx = _idx + 1;
		};
		if (lbCurSel 7080 != -1) then {
			_mens = (_misMensajes select (lbCurSel 7080));
			hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _mens select 0, _mens select 1];
		};
		reverse _misMensajes;

	} else {
		lbClear 7080;
		{
			if (alive _x && _x != player) then {
				_tipo = switch (side _x) do {
					case west: {"Pol"};
					case civilian: {"Civ"};
					case independent: {"Med"};
					case east: {"OP"};
				};
				lbAdd [7080, format ["%1 (%2)", _x getVariable ["realname", name _x], _tipo]];
				lbSetData [7080, (lbSize 7080) -1, str (_x)];
			};
		} foreach playableUnits;

		lbSort [((uiNamespace getVariable "mensajesica") displayCtrl 7080), "ASC"];
		ctrlShow [7083, true];

		if (modo isEqualTo "mensaje privado") then {
			ctrlShow [7080, true];
		} else {
			ctrlShow [7080, false];
		};

		quien = switch (modo) do {
			case "mensaje privado": {lbData [7080, (lbCurSel 7080)]};
			case "policía": {WEST};
			case "ems": {INDEPENDENT};
			case "admin": {true};
		};

		buttonSetAction [7083, ' ["envio", toLower (lbData [7081, (lbCurSel 7081)]), quien] call ica_fnc_mensajesica; '];
		modo = nil;
	};
};

if (_param isEqualTo "envio") exitWith {
	_modo = toLower (_this select 1);
	_quien = _this select 2;
	_quien = if ((typeName _quien) == "STRING") then {call compile format ["%1", _quien]} else {_quien};
	texto = ctrlText 7082;
	
	if (_modo isEqualTo "") exitWith {hint "No se ha podido enviar el mensaje"};
	if (!(_modo isEqualTo "admin") AND (!isNil {DDoS})) exitWith {hint "Parece que no funciona..."};
	
	private ["_fuera", "_leoMensajeDeApagado"];
	if (_modo isEqualTo "mensaje privado") then {
		_leoMensajeDeApagado = true;
		if (isNil {_quien}) then {
			hint "Destinatario inválido";
			_fuera = true;
		};
	};
	if (!isNil {_fuera}) exitWith {};
	
	if (_modo isEqualTo "policía") then {
		texto = "(A todos los policías)<br/>" + texto;
	};
	if (_modo isEqualTo "ems") then {
		texto = "(A todos los EMS)<br/>" + texto;
	};
	if (_modo isEqualTo "admin") then {
		texto = "(A todos los admin)<br/>" + texto;
	};
	
	if (isNil {_leoMensajeDeApagado}) then {_leoMensajeDeApagado = false};
	
	if (typeName _quien == "BOOL") exitWith {
		["recibo", player, texto, true, _leoMensajeDeApagado] remoteexeccall ["ica_fnc_mensajesica",0];
		closeDialog 0;
	};
	
	
	["recibo", player, texto, false, _leoMensajeDeApagado] remoteexeccall ["ica_fnc_mensajesica",_quien];
	closeDialog 0;
};

if (_param isEqualTo "recibo") exitWith {
	if (isDedicated) exitWith {};
	
	_de = name (_this select 1);
	_texto = _this select 2;
	_paraAdmin = param [3, false];
	_leoMensajeDeApagado = _this select 4;
	
	if (
		((["pop_note"] call ica_fnc_tengo) == 0) AND
		((["pop_iphone"] call ica_fnc_tengo) == 0) AND
		((["pop_nokia"] call ica_fnc_tengo) == 0)
		AND !_paraAdmin AND
		_leoMensajeDeApagado
	) exitWith {
		//["Ese teléfono está apagado o fuera de cobertura", "hint", _this select 1, false, false] call BIS_fnc_MP;
		"Ese teléfono está apagado o fuera de cobertura" remoteexeccall ["hint",(_this select 1)];
	};

	if ((_paraAdmin) AND ((call life_adminlevel) < 1)) exitWith {};

	hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _de, _texto];

	_miArr = profileNamespace getVariable "arraySMS";
	_miArr pushBack [_de, _texto];
	reverse _miArr;
	_miArr resize 30;
	reverse _miArr;
	profileNamespace setVariable ["arraySMS", _miArr];
};


// DEBUG
/*
0 spawn {
	while {true} do {
		hint format ["Tienes seleccionado a %1", lbData [7080, (lbCurSel 7080)]];
		sleep 1;
	};
};
*/


