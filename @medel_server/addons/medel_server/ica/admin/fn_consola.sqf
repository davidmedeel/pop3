
/*
por: Icaruk
	
	["menu"] call ica_fnc_consola;
	["borradatos"] call ica_fnc_consola; // para borrar los datos de la consola que han sido guardados en profileNamespace
	
NOTA: 
	Los monitores actualizan cada 0.25s menos el último, que actualiza cada 1s.
	Si se mantiene CTRL al pulsar EXE LOC hará spawn en lugar de call.
	La entrada 4 siempre se lanza con spawn.
	Cursortarget y cursorobject serán automáticamente definidos en las variables ct y co.
	La posición ATL, la dirección y posDir serán automáticamente definidos en las variables pos, dir y posdir.
	
Teclas rápidas:
	
	CTRL + 1-4		Ejecuta la entrada 1-4.
	ALT + 1-4		Página 1-4.
	
	
	CTRL + SHIFT + 1-4		TP a la posición 1-4.
	CTRL + ALT + 1-4		Guardar posición 1-4.
	
	CTRL + B		Borrar entrada actual.
	CTRL + M		Borrar monitores.
	
	CTRL + G		GUI Editor
	CTRL + H		Config viewer
	
	CTRL + W		Cambiar entre modo separado y centrado.
	ALT + A			Ocultar parte izquierda.
	ALT + D			Ocultar parte derecha.
	
	F3				Recompilar.
	ALT + R			Compara rendimiento del código de la entrada 1 con la 2.
	
	CTRL + S		Guarda todo (ya no es necesario, se guarda al pulsar ESC).
	
*/


_param = param [0];



if (_param isEqualTo "menu") exitWith {
	
	disableSerialization;
	createDialog "consola";
	_ui = uiNamespace getVariable "consola";
	
	
	_fondoIzq = _ui displayCtrl 8398;
	_fondoDer = _ui displayCtrl 8399;
	
	_b1 = _ui displayCtrl 8401; // exe loc
	_b2 = _ui displayCtrl 8402; // exe srv
	_b3 = _ui displayCtrl 8403; // exe glo
	_b4 = _ui displayCtrl 8400; // borrar
	
	_hb1 = _ui displayCtrl 8424;
	_hb2 = _ui displayCtrl 8425;
	_hb3 = _ui displayCtrl 8426;
	_hb4 = _ui displayCtrl 8427;
	
	_check1 = _ui displayCtrl 8422;
	_check2 = _ui displayCtrl 8423;

	_e1 = _ui displayCtrl 8404;
	_e2 = _ui displayCtrl 8405;
	_e3 = _ui displayCtrl 8406;
	_e4 = _ui displayCtrl 8407;

	_mon1 = _ui displayCtrl 8408;
	_res1 = _ui displayCtrl 8409;

	_mon2 = _ui displayCtrl 8410;
	_res2 = _ui displayCtrl 8411;

	_mon3 = _ui displayCtrl 8412;
	_res3 = _ui displayCtrl 8413;

	_mon4 = _ui displayCtrl 8414;
	_res4 = _ui displayCtrl 8415;

	_mon5 = _ui displayCtrl 8416;
	_res5 = _ui displayCtrl 8417;

	_mon6 = _ui displayCtrl 8418;
	_res6 = _ui displayCtrl 8419;

	_mon7 = _ui displayCtrl 8420;
	_res7 = _ui displayCtrl 8421;
	
	_mon8 = _ui displayCtrl 8430;
	_res8 = _ui displayCtrl 8431;
	_grp_res8 = _ui displayCtrl 8432;
	
	_posicionL =  _ui displayCtrl 8428;
	_posicionR =  _ui displayCtrl 8429;

	// Ajusto altura texto res8
	con_altoRes = (ctrlPosition _res1) select 3;
	_res8 ctrlSetPosition [(ctrlPosition _res8) select 0, (ctrlPosition _res8) select 1, (ctrlPosition _res8) select 2, (ctrlTextHeight _res8) max con_altoRes];
	_res8 ctrlCommit 0;	

	{
		_x ctrlEnable false;
		_x ctrlShow false;
	} forEach [_posicionL, _posicionR]; // para que no interfiera con las demás hitBoxes
	
	_fondoIzq ctrlEnable false;
	_fondoDer ctrlEnable false;

	// oculto, ya no molan
	{
		_x ctrlEnable false;
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_check1, _check2];

	// -----------------------
	// -------- CARGO --------
	// -----------------------

	_e1 ctrlSetText (profileNamespace getVariable ["con_e1", ""]);
	_e2 ctrlSetText (profileNamespace getVariable ["con_e2", ""]);
	_e3 ctrlSetText (profileNamespace getVariable ["con_e3", ""]);
	_e4 ctrlSetText (profileNamespace getVariable ["con_e4", ""]);
	_mon1 ctrlSetText (profileNamespace getVariable ["con_mon1", ""]);
	_mon2 ctrlSetText (profileNamespace getVariable ["con_mon2", ""]);
	_mon3 ctrlSetText (profileNamespace getVariable ["con_mon3", ""]);
	_mon4 ctrlSetText (profileNamespace getVariable ["con_mon4", ""]);
	_mon5 ctrlSetText (profileNamespace getVariable ["con_mon5", ""]);
	_mon6 ctrlSetText (profileNamespace getVariable ["con_mon6", ""]);
	_mon7 ctrlSetText (profileNamespace getVariable ["con_mon7", ""]);
	_mon8 ctrlSetText (profileNamespace getVariable ["con_mon8", ""]);
	
	
	_oculto1 = profileNamespace getVariable ["con_parteIzqOculta", 0];
	_oculto2 = profileNamespace getVariable ["con_parteDerOculta", 0];
	if (_oculto1 isEqualTo 1) then {
		["oculta", "izq", 1, true] call ica_fnc_consola;
		_check1 cbSetChecked true;
	};
	if (_oculto2 isEqualTo 1) then {
		["oculta", "der", 1, true] call ica_fnc_consola;
		_check2 cbSetChecked true;
	};
	
	
	_centrado = profileNamespace getVariable ["con_centrado", false];
	if (_centrado) then {
		_pos_XL1 = (ctrlPosition _fondoIzq) select 0;
		_pos_XL2 = (ctrlPosition _posicionL) select 0;
		_pos_XR1 = (ctrlPosition _fondoDer) select 0;
		_pos_XR2 = (ctrlPosition _posicionR) select 0;
		con_XL = abs (_pos_XL1 - _pos_XL2);
		con_XR = abs (_pos_XR1 - _pos_XR2);
	};
	
	con_pos = profileNamespace getVariable ["con_pos", []];
	
	
	
	// -----------------------
	// ----- FIN CARGADO -----
	// -----------------------

	
	// Guardo y oculto HUD
	//showHUD [false, false, false, false, false, false, false, false];	
	
	// EHs para que los botones se muevan a la entrada correspondiente
	_e1 ctrlAddEventHandler ["SetFocus", {["mouseEnter", 0] call ica_fnc_consola;}];
	_e2 ctrlAddEventHandler ["SetFocus", {["mouseEnter", 1] call ica_fnc_consola;}];
	_e3 ctrlAddEventHandler ["SetFocus", {["mouseEnter", 2] call ica_fnc_consola;}];
	_e4 ctrlAddEventHandler ["SetFocus", {["mouseEnter", 3] call ica_fnc_consola;}];
	
	_e1 ctrlAddEventHandler ["Char", {["mouseEnter", 0] call ica_fnc_consola;}];
	_e2 ctrlAddEventHandler ["Char", {["mouseEnter", 1] call ica_fnc_consola;}];
	_e3 ctrlAddEventHandler ["Char", {["mouseEnter", 2] call ica_fnc_consola;}];
	_e4 ctrlAddEventHandler ["Char", {["mouseEnter", 3] call ica_fnc_consola;}];	
	
	_hb1 ctrlAddEventHandler ["MouseEnter", {["mouseEnter", 0] call ica_fnc_consola;}];
	_hb2 ctrlAddEventHandler ["MouseEnter", {["mouseEnter", 1] call ica_fnc_consola;}];
	_hb3 ctrlAddEventHandler ["MouseEnter", {["mouseEnter", 2] call ica_fnc_consola;}];
	_hb4 ctrlAddEventHandler ["MouseEnter", {["mouseEnter", 3] call ica_fnc_consola;}];
	
	// EHs para ocultar partes
	_check1 ctrlAddEventHandler ["CheckedChanged", {["oculta", "izq", _this select 1] call ica_fnc_consola;}];
	_check2 ctrlAddEventHandler ["CheckedChanged", {["oculta", "der", _this select 1] call ica_fnc_consola;}];
	
	// EH para botones
	_b1 ctrlAddEventHandler ["ButtonClick", {["exe", "loc"] call ica_fnc_consola;}];
	_b2 ctrlAddEventHandler ["ButtonClick", {["exe", "srv"] call ica_fnc_consola;}];
	_b3 ctrlAddEventHandler ["ButtonClick", {["exe", "glo"] call ica_fnc_consola;}];
	_b4 ctrlAddEventHandler ["ButtonClick", {["borra"] spawn ica_fnc_consola;}];
	
	// EH para keybinds
	_ui displayAddEventHandler ["KeyDown", {["tecla", _this] call ica_fnc_consola;}];
	
	// EH de salida
	_ui displayAddEventHandler ["Unload", {["unload"] call ica_fnc_consola;}];
	
	
	// calculo las posiciones de los botones
	con_b1Y_ini = ctrlPosition _b1 select 1;
	con_b2Y_ini = ctrlPosition _b2 select 1;
	con_b3Y_ini = ctrlPosition _b3 select 1;
	con_b4Y_ini = ctrlPosition _b4 select 1;
	con_saltoY = abs ((ctrlPosition _b1 select 1) - (ctrlPosition _b2 select 1)); // resto Yb1 - Yb2
	// con_saltoX = abs ((ctrlPosition _b1 select 0) - (ctrlPosition _b4 select 0)); // resto Xb1 - Xb4
	// con_separX = abs (((ctrlPosition _e1 select 0) + (ctrlPosition _e1 select 2)) - (ctrlPosition _b1 select 0)); // (Xe + Le) - Xb1
	
	
	
	if (_centrado) then {
		
		con_noME = true; // para que MouseEnter no funcione
		
		// Colocación de las partes
		{
			_x ctrlSetPosition [((ctrlPosition _x) select 0) + con_XL, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
			_x ctrlCommit 0.3;
		} forEach [_fondoIzq, _b1, _b2, _b3, _b4, _e1, _e2, _e3, _e4];
		
		{
			_x ctrlSetPosition [((ctrlPosition _x) select 0) - con_XR, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
			_x ctrlCommit 0.3;
		} forEach [_fondoDer, _mon1, _mon2, _mon3, _mon4, _mon5, _mon6, _mon7, _mon8, _res1, _res2, _res3, _res4, _res5, _res6, _res7, _res8, _grp_res8];
		
		
		// Corrijo posiciones de hitboxes y botones
		_anchoFondo = (ctrlPosition _fondoIzq) select 2;
		_anchoBoton = (ctrlPosition _b1) select 2;
		_desplazamientoX = abs (_anchoFondo - con_XL + (_anchoBoton * 2.3));
		
		{
			_x ctrlSetPosition [((ctrlPosition _x) select 0) - _desplazamientoX, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
			_x ctrlCommit 0.2;
		} forEach [_b1, _b2, _b3, _b4, _hb1, _hb2, _hb3, _hb4];
		
		
		0 spawn {
			sleep 0.3;
			con_noME = nil; // vuelvo a activar el MouseEnter
		};
		
	};
	
	
	// Loop de monitores
	0 spawn {
		
		disableSerialization;
		_ui = uiNamespace getVariable "consola";
		
		_mon1 = _ui displayCtrl 8408;
		_res1 = _ui displayCtrl 8409;
		_mon2 = _ui displayCtrl 8410;
		_res2 = _ui displayCtrl 8411;
		_mon3 = _ui displayCtrl 8412;
		_res3 = _ui displayCtrl 8413;
		_mon4 = _ui displayCtrl 8414;
		_res4 = _ui displayCtrl 8415;
		_mon5 = _ui displayCtrl 8416;
		_res5 = _ui displayCtrl 8417;
		_mon6 = _ui displayCtrl 8418;
		_res6 = _ui displayCtrl 8419;
		_mon7 = _ui displayCtrl 8420;
		_res7 = _ui displayCtrl 8421;
		_mon8 = _ui displayCtrl 8430;
		_res8 = _ui displayCtrl 8431;		
		
		
		_v = 0; // vueltas
		
		while {!isNil {uiNamespace getVariable "consola"}} do {
			
			ct = cursortarget;
			co = cursorObject;
			pos = getPosATL player;
			dir = round (getDir player);
			posDir = [getPosATL player, round (getDir player)];
			
			
			// Mon 1-6			
			{
				_ctrlMon = _x select 1;
				_ctrlRes = _x select 0;
				_isNil = isNil {call compile (ctrlText _ctrlMon)};
				
				if (_isNil) then { // me da nil
					_ctrlRes ctrlSetText ""; // vacío					
				} else {				
					_ctrlRes ctrlSetText str (call compile (ctrlText _ctrlMon));
				};
				
			} forEach [[_res1, _mon1], [_res2, _mon2], [_res3, _mon3], [_res4, _mon4], [_res5, _mon5], [_res6, _mon6]];
			
			
			
			// Mon 7 y 8
			if (_v >= 4) then { // 4 vueltas = 1 segundo
				
				
				// Mon 7
				_isNil = isNil {call compile (ctrlText _mon7)};
				
				if (_isNil) then { // me da nil
					_res7 ctrlSetText ""; // vacío					
				} else {
					_res7 ctrlSetText str (call compile (ctrlText _mon7));
				};
				
				
				// Mon 8
				_textoEn8 = ctrlText _mon8;
				
				if !(_textoEn8 isEqualTo "") then {
					
					_isNil = isNil {call compile (ctrlText _mon8)};
					
					
					if (_isNil) then {
						_res8 ctrlSetText "";
					} else {
						
						_array = call compile (ctrlText _mon8);
						
						
						if (_array isEqualType []) then {
						
							_strElementos = "";
							{
								// font='EtelkaMonospacePro'
								_strElementos = _strElementos + (format ["<t size='0.95'><t color='%1'>%2:<t/><t color='%3'> %4</t><br/></t>", hColVer, _forEachIndex, hColGri, _x]);
							} forEach _array;
							
							if (_strElementos isEqualTo "") then {_strElementos = "[ ]"};
							
							
							_res8 ctrlSetStructuredText parseText _strElementos;
							
							
							// Ajusto altura texto
							_res8 ctrlSetPosition [(ctrlPosition _res8) select 0, (ctrlPosition _res8) select 1, (ctrlPosition _res8) select 2, (ctrlTextHeight _res8) max con_altoRes];
							_res8 ctrlCommit 0;
							
						} else {
							_res8 ctrlSetText (str _array);
						};
						
					};
					
				} else {
					_res8 ctrlSetText "";
				};
				
				
				_v = 0;
			};
			
			_v = _v + 1;
			
			sleep 0.25;
			
		};	
	};
	
	
	con_eActual = 0;
	
};



private [
	"_fondoIzq", "_fondoDer",
	"_b1", "_b2", "_b3", "_b4",
	"_check1", "_check2",
	"_e1", "_e2", "_e3", "_e4",
	"_mon1", "_mon2", "_mon3", "_mon4", "_mon5", "_mon6", "_mon7", "_mon8",
	"_res1", "_res2", "_res3", "_res4", "_res5", "_res6", "_res7", "_res8"
];

disableSerialization;
if (!isNil {uiNamespace getVariable "consola"}) then {
	
	_ui = uiNamespace getVariable "consola";

	_fondoIzq = _ui displayCtrl 8398;
	_fondoDer = _ui displayCtrl 8399;
	
	_b1 = _ui displayCtrl 8401; // exe local
	_b2 = _ui displayCtrl 8402; // exe srv
	_b3 = _ui displayCtrl 8403; // exe global
	_b4 = _ui displayCtrl 8400; // borrar

	_check1 = _ui displayCtrl 8422;
	_check2 = _ui displayCtrl 8423;

	_e1 = _ui displayCtrl 8404;
	_e2 = _ui displayCtrl 8405;
	_e3 = _ui displayCtrl 8406;
	_e4 = _ui displayCtrl 8407;

	_mon1 = _ui displayCtrl 8408;
	_res1 = _ui displayCtrl 8409;

	_mon2 = _ui displayCtrl 8410;
	_res2 = _ui displayCtrl 8411;

	_mon3 = _ui displayCtrl 8412;
	_res3 = _ui displayCtrl 8413;

	_mon4 = _ui displayCtrl 8414;
	_res4 = _ui displayCtrl 8415;

	_mon5 = _ui displayCtrl 8416;
	_res5 = _ui displayCtrl 8417;

	_mon6 = _ui displayCtrl 8418;
	_res6 = _ui displayCtrl 8419;

	_mon7 = _ui displayCtrl 8420;
	_res7 = _ui displayCtrl 8421;
	
	_mon8 = _ui displayCtrl 8430;
	_res8 = _ui displayCtrl 8431;	
};



if (_param isEqualTo "mouseEnter") exitWith {
	
	if (!isNil "con_noME") exitWith {};
	
	_entrada = param [1];
	
	if (con_eActual isEqualTo _entrada) exitWith {}; // ya estoy donde toca
	
	con_eActual = _entrada; // de 0 a 3
	
	
	_b1 ctrlSetPosition [ctrlPosition _b1 select 0, con_b1Y_ini + (con_saltoY * (_entrada * 3)), ctrlPosition _b1 select 2, ctrlPosition _b1 select 3];
	_b2 ctrlSetPosition [ctrlPosition _b2 select 0, con_b2Y_ini + (con_saltoY * (_entrada * 3)), ctrlPosition _b2 select 2, ctrlPosition _b2 select 3];
	_b3 ctrlSetPosition [ctrlPosition _b3 select 0, con_b3Y_ini + (con_saltoY * (_entrada * 3)), ctrlPosition _b3 select 2, ctrlPosition _b3 select 3];
	_b4 ctrlSetPosition [ctrlPosition _b4 select 0, con_b4Y_ini + (con_saltoY * (_entrada * 3)), ctrlPosition _b4 select 2, ctrlPosition _b4 select 3];
	
	
	{_x ctrlCommit 0.15} forEach [_b1, _b2, _b3, _b4];
	
	
};

if (_param isEqualTo "exe") exitWith {
	
	_modo = param [1];
	_eActual = param [2, con_eActual];
	
	_esCall = true;
	_code = switch (_eActual) do {
		case 0: {ctrlText _e1};
		case 1: {ctrlText _e2};
		case 2: {ctrlText _e3};
		case 3: {_esCall = false; ctrlText _e4};
	};

	
	_modo = switch (_modo) do  {
		case "loc": {player};
		case "srv": {2};
		case "glo": {0};
	};
	
	
	if (pulsandoCtrl) then {
		_esCall = false;	
	};
	
	
	if (_modo isEqualTo player) then {
		if (_esCall) then {
			call compile _code;
		} else {
			0 spawn (compile _code);
		};
		
	} else {
		(compile _code) remoteExec ["call", _modo];
	};
	
	["guarda"] call ica_fnc_consola;
};

if (_param isEqualTo "tecla") exitWith {
	
	_this2 = _this select 1;
	
	_code = _this2 select 1;
	_shi = _this2 select 2;
	_ctr = _this2 select 3;
	_alt = _this2 select 4;
	_bloqueo = false;	
	
	
	
	if (_code isEqualTo 48) then { // B
		if (_ctr) exitWith { // CTRL + B
			["borra"] spawn ica_fnc_consola;
		};
	};
	
	if (_code isEqualTo 28) then { // ENTER
		if (!_ctr AND !_shi AND !_alt) exitWith {
			["exe", "loc"] call ica_fnc_consola;
		};
	};
	
	if (_code in [2, 3, 4, 5]) then { // 1-4
		
		if (_ctr AND !_shi AND !_alt) exitWith { // CTRL + 1-4
			["exe", "loc", _code - 2] call ica_fnc_consola;
		};
		
		if (!_ctr AND !_shi AND _alt) exitWith { // ALT + 1-4
			["pagina", _code - 2] call ica_fnc_consola;
		};	
		
		if (_ctr AND !_shi AND _alt) exitWith { // CTRL + ALT + 1-4
			["guardaPos", _code - 2] call ica_fnc_consola;
			true
		};
		
		if (_ctr AND _shi AND !_alt) exitWith { // CTRL + SHIFT + 1-4
			["setPos", _code - 2] call ica_fnc_consola;
			true
		};
	};
	
	if (_code isEqualTo 30) then { // A
		if (_alt) exitWith { // ALT + A
			_bool = if (cbChecked _check1) then {0} else {1};
			["oculta", "izq", _bool] call ica_fnc_consola;
		};
	};

	if (_code isEqualTo 32) then { // D
		if (_alt) exitWith { // ALT + D
			_bool = if (cbChecked _check2) then {0} else {1};
			["oculta", "der", _bool] call ica_fnc_consola;
		};	
	};

	if (_code isEqualTo 50) then { // M
		if (_ctr) exitWith { // CTRL + M
			{
				_x ctrlSetText "";
			} forEach [_mon1, _mon2, _mon3, _mon4, _mon5, _mon6, _mon7, _mon8, _res1, _res2, _res3, _res4, _res5, _res6, _res7, _res8];
		};	
	};

	if (_code isEqualTo 19) then { // R
		if (!_ctr AND !_shi AND _alt) exitWith { // ALT + R
			["compara"] call ica_fnc_consola;
		};	
	};
	
	if (_code isEqualTo 31) then { // S
		if (_ctr) exitWith { // CTRL + S
			["guarda"] call ica_fnc_consola;
		};	
	};	

	if (_code isEqualTo 34) then { // G
		if (_ctr) exitWith { // CTRL + G
			0 spawn BIS_fnc_GUIeditor;
		};	
	};
	
	if (_code isEqualTo 35) then { // H
		if (_ctr) exitWith { // CTRL + H
			[] call BIS_fnc_configviewer;	
		};
	};
	
	/*if (_code isEqualTo 61) then { // F3
		if (!_ctr AND !_shi AND !_alt) exitWith {
			3 call ica_fnc_recompile;
		};	
	};*/

	if (_code isEqualTo 17) then { // W
		if (_ctr AND !_shi AND !_alt) exitWith { // CTRL + W
			profileNamespace setVariable ["con_centrado", !(profileNamespace getVariable ["con_centrado", false])];
			closeDialog 0;
			["menu"] call ica_fnc_consola;
		};
	};

	if (_code isEqualTo 1) then { // ESC
		["guarda"] call ica_fnc_consola;
		closeDialog 0;
		
		_bloqueo = true;
	};

	// -------------------------------
	// Variables de modificadores
	// -------------------------------
	
	if (_code in [29, 42, 56]) then { // ctrl, shift, alt
			
		if (_code isEqualTo 29) then {
			if (!pulsandoCtrl) then {
				pulsandoCtrl = true;
			};
		};
		
		if (_code isEqualTo 42) then {
			if (!pulsandoShift) then {
				pulsandoShift = true;
			};
		};
		
		if (_code isEqualTo 56) then {
			if (!pulsandoAlt) then {
				pulsandoAlt = true;
			};
		};
		
	};
	_bloqueo
};

if (_param isEqualTo "pagina") exitWith {

	_num = param [1];

	// guardo en la página en la que estaba
	profileNamespace setVariable [format ["con_pag%1", profileNamespace getVariable ["con_pagina", 1]], [ctrlText _e1, ctrlText _e2, ctrlText _e3, ctrlText _e4]];

	// cargo la página que he llamado
	_arr = profileNamespace getVariable [format ["con_pag%1", _num], ["", "", "", ""]];

	_e1 ctrlSetText (_arr select 0);
	_e2 ctrlSetText (_arr select 1);
	_e3 ctrlSetText (_arr select 2);
	_e4 ctrlSetText (_arr select 3);

	profileNamespace setVariable ["con_pagina", _num];
};


if (_param isEqualTo "compara") exitWith {
	
	_code1 = compile ctrlText _e1;
	_code2 = compile ctrlText _e2;
	
	[
		_code1,
		_code2
	] call ica_fnc_rendimiento;
};

if (_param isEqualTo "borra") exitWith {
	
	_ctrl = switch (con_eActual) do {
		case 0: {_e1};
		case 1: {_e2};
		case 2: {_e3};
		case 3: {_e4};
	};
	
	_t = 0.1;
	
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit _t;
	
	sleep _t;
	
	_ctrl ctrlSetText "";
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit _t;

	["guarda"] call ica_fnc_consola;
};

if (_param isEqualTo "oculta") exitWith {
	
	_lado = param [1]; 				// STRING
	_checked = param [2]; 			// SCALAR
	_instant = param [3, false]; 	// BOOL
	_bool = if (_checked isEqualTo 1) then {true} else {false};

	_arrCtrls = if (_lado isEqualTo "izq") then {
		_check1 cbSetChecked _bool;
		[_fondoIzq, _b1, _b2, _b3, _b4, _e1, _e2, _e3, _e4]
	} else {
		_check2 cbSetChecked _bool;
		[_fondoDer, _mon1, _mon2, _mon3, _mon4, _mon5, _mon6, _mon7, _mon8, _res1, _res2, _res3, _res4, _res5, _res6, _res7, _res8]
	};
	
	_nFade = if (_instant) then {0} else {0.7};
	{
		if !((_x isEqualTo _fondoIzq) OR (_x isEqualTo _fondoDer)) then {
			_x ctrlEnable !_bool;
		};
		
		_x ctrlSetFade _checked;
		_x ctrlCommit _nFade;
	} forEach _arrCtrls;
	
	profileNamespace setVariable [format ["con_parte%1Oculta", _lado], _checked]; // "con_parteIzqOculta" o "con_parteDerOculta"
	
};

if (_param isEqualTo "guardaPos") exitWith {
	
	private _idx = param [1];
	
	if (isNil "con_pos") then {con_pos = []};
	
	con_pos set [_idx, [getPosATL player, getDir player]];
	hint format ["Pos %1 guardada", _idx];
};

if (_param isEqualTo "setPos") exitWith {
	
	private _idx = param [1];
	
	private _posDir = con_pos param [_idx, [getPos player, getDir player]];
	
	player setPosATL (_posDir select 0);
	player setDir (_posDir select 1);
	
};

if (_param isEqualTo "guarda") exitWith {
	
	profileNamespace setVariable ["con_e1", ctrlText _e1];
	profileNamespace setVariable ["con_e2", ctrlText _e2];
	profileNamespace setVariable ["con_e3", ctrlText _e3];
	profileNamespace setVariable ["con_e4", ctrlText _e4];
	
	profileNamespace setVariable ["con_mon1", ctrlText _mon1];
	profileNamespace setVariable ["con_mon2", ctrlText _mon2];
	profileNamespace setVariable ["con_mon3", ctrlText _mon3];
	profileNamespace setVariable ["con_mon4", ctrlText _mon4];
	profileNamespace setVariable ["con_mon5", ctrlText _mon5];
	profileNamespace setVariable ["con_mon6", ctrlText _mon6];
	profileNamespace setVariable ["con_mon7", ctrlText _mon7];
	profileNamespace setVariable ["con_mon8", ctrlText _mon8];
	
	profileNamespace setVariable ["con_pos", missionNamespace getVariable ["con_pos", []]];
	
};

if (_param isEqualTo "unload") exitWith {
	
	con_eActual = nil;
	
	con_b1Y_ini = nil;
	con_b2Y_ini = nil;
	con_b3Y_ini = nil;
	con_b4Y_ini = nil;
	con_saltoY = nil;
	
	con_XL = nil;
	con_XR = nil;
	
	con_noME = nil;
	
	showHUD desolation_showHUD;
	
};

if (_param isEqualTo "borradatos") exitWith {
	
	profileNamespace setVariable ["con_e1", nil];
	profileNamespace setVariable ["con_e2", nil];
	profileNamespace setVariable ["con_e3", nil];
	profileNamespace setVariable ["con_e4", nil];
	
	profileNamespace setVariable ["con_mon1", nil];
	profileNamespace setVariable ["con_mon2", nil];
	profileNamespace setVariable ["con_mon3", nil];
	profileNamespace setVariable ["con_mon4", nil];
	profileNamespace setVariable ["con_mon5", nil];
	profileNamespace setVariable ["con_mon6", nil];
	profileNamespace setVariable ["con_mon7", nil];
	profileNamespace setVariable ["con_mon8", nil];
	
	profileNamespace setVariable ["con_parteIzqOculta", nil];
	profileNamespace setVariable ["con_parteDerOculta", nil];
	
};
