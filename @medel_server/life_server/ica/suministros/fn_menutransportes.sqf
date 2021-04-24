
/*
por: Icaruk
	[1] spawn ica_fnc_menuTransportes;
	[2] spawn ica_fnc_menuTransportes;

*/

_param = _this select 0;

if ((_param isEqualTo 1) OR (_param isEqualTo 2)) exitWith { // menu

	_tio = [tioA1, tioA2] call ica_fnc_masCercano;
	if ((player distance _tio) > 2) exitWith {hint "Los negocios tienen que ser de cerca."};
	if ((count (nearestObjects [(getPos _tio), ["Man"], 2])) > 1) exitWith {
		hint "Los negocios tienen que ser de tú a tú, la demás peña, sobra.";
	};

	[player, ["alm1Ali", "alm1Agu", "alm1Com", "alm1Mad",
		"alm2Ali", "alm2Agu", "alm2Com", "alm2Mad",
		"des1Ali", "des1Agu", "des1Com", "des1Mad",
		"des2Ali", "des2Agu", "des2Com", "des2Mad",
		"des3Ali", "des3Agu", "des3Com", "des3Mad",
		"des4Ali", "des4Agu", "des4Com", "des4Mad"]
	] call ica_fnc_varToServer; waitUntil {recibido};

	disableSerialization;
	createDialog "transportes";
	_ui = uiNameSpace getVariable "transportes";
	_lista = (_ui displayCtrl 6086);
	_entrada = (_ui displayCtrl 6085);
	_boton = (_ui displayCtrl 6089);
	_cabecera = (_ui displayCtrl 6060);
	_pie = (_ui displayCtrl 6090);

	_txb1 = (_ui displayCtrl 6061);
	_txb2 = (_ui displayCtrl 6062);
	_txb3 = (_ui displayCtrl 6063);
	_txb4 = (_ui displayCtrl 6064);
	_b1 = (_ui displayCtrl 6065);
	_b2 = (_ui displayCtrl 6066);
	_b3 = (_ui displayCtrl 6067);
	_b4 = (_ui displayCtrl 6068);
	_b5 = (_ui displayCtrl 6069);
	_b6 = (_ui displayCtrl 6070);
	_b7 = (_ui displayCtrl 6071);
	_b8 = (_ui displayCtrl 6072);
	_b9 = (_ui displayCtrl 6073);
	_b10 = (_ui displayCtrl 6074);
	_b11 = (_ui displayCtrl 6075);
	_b12 = (_ui displayCtrl 6076);
	_b13 = (_ui displayCtrl 6077);
	_b14 = (_ui displayCtrl 6078);
	_b15 = (_ui displayCtrl 6079);
	_b16 = (_ui displayCtrl 6080);
	_b17 = (_ui displayCtrl 6081);
	_b18 = (_ui displayCtrl 6082);
	_b19 = (_ui displayCtrl 6083);
	_b20 = (_ui displayCtrl 6084);

	_boton ctrlEnable false;
	_cabecera ctrlSetText format ["Almacén %1                                Carberry     Diablos      Cerros      Cristobal", _param]; 
	almacen = _param;
	_lista ctrlSetEventHandler ["LBSelChanged", "['actualiza', almacen] spawn ica_fnc_menuTransportes; "];
	_entrada ctrlSetEventHandler ["Char", "['actualiza', almacen] spawn ica_fnc_menuTransportes; "];

	_var1 = missionNamespace getVariable format ["alm%1Ali", _param];
	_var2 = missionNamespace getVariable format ["alm%1Agu", _param];
	_var3 = missionNamespace getVariable format ["alm%1Com", _param];
	_var4 = missionNamespace getVariable format ["alm%1Mad", _param];
	_txb1 ctrlSetText str _var1;
	_txb2 ctrlSetText str _var2;
	_txb3 ctrlSetText str _var3;
	_txb4 ctrlSetText str _var4;

	_suministros = ["Alimento", "Agua", "Combustible", "Madera"];
	_data = ["Ali", "Agu", "Com", "Mad"];
	lbClear _lista;

	_idx = 0;
	while {_idx < (count _suministros)} do {
		_lista lbAdd (_suministros select _idx);
		_lista lbSetData [_idx, (_data select _idx)];
		_idx = _idx + 1;
	};
	_lista lbSetCurSel -1;

	_max = 1000;
	_b1 progressSetPosition (_var1 / _max);
	_b2 progressSetPosition (_var2 / _max);
	_b3 progressSetPosition (_var3 / _max);
	_b4 progressSetPosition (_var4 / _max);

	_barras = [_b5, _b6, _b7, _b8, _b9, _b10, _b11, _b12, _b13, _b14, _b15, _b16, _b17, _b18, _b19, _b20];
	_vars = [des1Ali, des1Agu, des1Com, des1Mad, des2Ali, des2Agu, des2Com, des2Mad,
		des3Ali, des3Agu, des3Com, des3Mad, des4Ali, des4Agu, des4Com, des4Mad];
	for "_idx" from 0 to (count _barras) do {
		(_barras select _idx) progressSetPosition ((_vars select _idx) / _max);
	};

};

if (_param isEqualTo "actualiza") exitWith {
	disableSerialization;
	_almacen = _this select 1;
	_ui = uiNameSpace getVariable "transportes";
	_lista = (_ui displayCtrl 6086);
	_entrada = (_ui displayCtrl 6085);
	_boton = (_ui displayCtrl 6089);
	_valor = (_ui displayCtrl 6087);
	_impuestos = (_ui displayCtrl 6088);
	_txb1 = (_ui displayCtrl 6061);
	_txb2 = (_ui displayCtrl 6062);
	_txb3 = (_ui displayCtrl 6063);
	_txb4 = (_ui displayCtrl 6064);

	_idxLista = lbCurSel 6086;
	_cosa = _lista lbData _idxLista;
	_can = parseNumber (ctrlText _entrada);
	if (_can <= 0) then {_can = 1; _entrada ctrlSetText "1"};
	if (_can > 170) then {_can = 170; _entrada ctrlSetText "170"};

	_variable = format ["alm%1%2", _almacen, _cosa];

	_formula = {
		private ["_almacen", "_cosa", "_n","_eco"];
		_cosa = _this select 0;
		_almacen = _this select 1;
		_eco = (missionNamespace getVariable _variable);
		_n = round (115*(-0.0000005*_eco*_eco-0.00025*_eco+1));
		_n
	};

	cosa = _cosa; can = _can; variable = _variable;
	if ((lbCurSel 6086) != -1) then {
		_num = [_cosa, _almacen] call _formula;
		_num = _num * _can;
		// _valor ctrlSetText format ["%1 €", _num];
		_reduc = if (("log" call ica_fnc_expToLevel) >= 3) then {0.66} else {1};
		precio = round (_num * _reduc);
		_impuestos ctrlSetText format ["%1 €", precio];

		if (_can <= (missionNamespace getVariable _variable)) then {
			_boton ctrlEnable true;
			_boton buttonSetAction '
				["carga", cosa, can, variable, precio] spawn ica_fnc_menuTransportes;
			';
		} else {
			_boton ctrlEnable false;
		};
	};
};

if (_param isEqualTo "carga") exitWith {
	if !(("log" call ica_fnc_expToLevel) >= 1) exitWith {hint "No tienes el permiso de transportista"};

	_cosa = _this select 1;
	_can = _this select 2;
	_variable = _this select 3;
	_precio = _this select 4;

	[almacen, _cosa, _can, _variable, _precio] spawn ica_fnc_carga;
};


