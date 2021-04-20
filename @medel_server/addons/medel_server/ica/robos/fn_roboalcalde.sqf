/*
Robo de portátil
by: Icaruk

Función: Contiene todo el proceso de robo del alcalde


	["menu"] spawn ica_fnc_roboAlcalde;
	["DSC"] spawn ica_fnc_roboAlcalde;
*/

_param = _this select 0;

if (_param == "menu") exitWith {
	if ({side _x == WEST} count playableUnits < 9) exitWith {hint "Tienen que estar al menos 9 policias conectados, sinó, no es divertido."};

	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

	disableSerialization;
	createDialog "portatil";
	_ui = uiNamespace getVariable "portatil";
	_txt = (_ui displayCtrl 4090);
	_txtC = (_ui displayCtrl 4091);
	_boton = (_ui displayCtrl 4093);

	if ((estadoPortatil select 0) == 99) exitWith { hint "El sistema se está restaurando"; }; // cancelado o acabado
	if ((estadoPortatil select 0) == 3) exitWith {hint "Ya no hace falta mirar aquí"; }; // fase 3, ya han robado
	if ((estadoPortatil select 0) == 0) then { // fase 0
		_boton buttonSetAction '
			["DSC", ctrlText 4092] spawn ica_fnc_roboAlcalde;
		';
		_txt ctrlSetText "Introduce código DSC";
	};
	if ((estadoPortatil select 0) == 1) then { // fase 1 (desencriptando)
		_boton ctrlEnable false;
		(_ui displayCtrl 4092) ctrlEnable false; // entrada
		waitUntil {!isNil {desencriptando}};
		[_txt, _txtC] spawn {	// numeritos random
			_txt = _this select 0;
			_txtC = _this select 1;
			while {!isNil {abierto}} do { // entra cada vez que miras
				if (desencriptando == 100) exitWith {
					_txt ctrlSetText format ["Desencriptado 100%1", "%"];
					_txtC ctrlSetText format ["%1", estadoPortatil select 2];
				};
				_txt ctrlSetText format ["Desencriptando %1%2", desencriptando, "%"];
				_txtC ctrlSetText ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
				sleep 0.1;
			};
		};
	};
};

if (_param == "DSC") exitWith {
	disableSerialization;
	_ui = uiNamespace getVariable "portatil";
	_txt = (_ui displayCtrl 4090);
	_txtC = (_ui displayCtrl 4091);
	_entrada = (_this select 1);

	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

	if ((estadoPortatil select 0) == 99) exitWith { hint "El sistema se está restaurando"; }; // cancelado o acabado
	if ((estadoPortatil select 0) == 0) then { // fase 0
		if (_entrada != (estadoPortatil select 1)) exitWith {hint "Acceso denegado"; };
		// acierto el código y avanzo a la fase 1
		estadoPortatil = [1, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";
		closeDialog 0;
		
		["loop"] remoteexeccall ["ica_fnc_roboAlcalde",2];
		hint format ["Acceso permitido. \nDesencriptando..."];

		[10, "Aviso", [1,0,0], 1.5, "Están intentando acceder al sistema informático del alcalde", [1,1,1], 1] remoteexec ["ica_fnc_anuncio",WEST];
		sleep 30;
		[10, "Aviso", [1,0,0], 1.5, "Están intentando acceder al sistema informático del alcalde", [1,1,1], 1] remoteexec ["ica_fnc_anuncio",WEST];
	};
};

if (_param == "cajafuerteMenu") exitWith {
	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

	if ((estadoPortatil select 0) == 3) exitWith {}; // fase 3, ya han robado
	if ((estadoPortatil select 0) == 2) exitWith { hint "Parece que la cerradura tiene una apertura retardada de 5 minutos."; };
	
	disableSerialization;
	createDialog "cajafuerte";
	_ui = uiNamespace getVariable "cajafuerte";
	_boton = (_ui displayCtrl 4096);
	_boton buttonSetAction '
		["cajafuerte", ctrlText 4097] spawn ica_fnc_roboAlcalde;
	';
};

if (_param == "cajafuerte") exitWith {
	_entrada = _this select 1;

	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

	if (_entrada != (estadoPortatil select 2)) exitWith {hint "Acceso denegado"; };
	closeDialog 0;
	hint "Las cajas fuertes Kuraci de máxima seguridad disponen de una apertura retardada de 5 minutos, por su seguridad.";
	// acierto el segundo código y paso a la fase 2
	estadoPortatil = [2, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";

	["cajaloop"] remoteexeccall ["ica_fnc_roboAlcalde",2];

};

if (_param == "loop") exitWith {
	desencriptando = 0;
	while {true} do {
		if (desencriptando >= 100) exitWith {};
		if (isNil {desencriptando}) exitWith {};
		desencriptando = desencriptando + 1;
		publicVariable "desencriptando";
		sleep 3;
	};
};

if (_param == "cajaloop") exitWith {
	sleep (60 * 5);
	estadoPortatil = [3, estadoPortatil select 1, estadoPortatil select 2];	// paso a fase 3
};

if (_param == "roboDinero") exitWith {
	if ((player distance cajafuerte) > 2) exitWith {hint "Desde aquí no llegas"; };
	if ((count (nearestObjects [(getPos cajafuerte), ["Man"], 4])) > 1) exitWith {
		hint "Con tante gente por aquí, no podemos abrir la puerta, no hay suficiente espacio en la habitación.";
	};
	if (!isNil {ocupado}) exitWith {hint "No puedes abrir algo que ya estás abriendo, se abriría una brecha espaciotemporal y... ya sabes."};
	ocupado = true;

	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};
	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

	_t = 4 + round (random 4);
	[_t, "Abriendo..."] spawn ica_fnc_barrita;
	sleep _t;

	if ((estadoPortatil select 0) != 3) exitWith {hint "Está cerrada. Muy cerrada."; ocupado = nil };

	itemDocumentos setPos (getMarkerPos "lejos");

	["reset"] remoteexeccall ["ica_fnc_roboAlcalde",2];

	_din = fondosPublicos;
	fondosPublicos = 0;
	publicVariable "fondosPublicos";

	medel_din = medel_din + medel_dsin_din;
	hint format ["Has robado %1€", _din];
	
	_diamante = round (_din / 300000); // 3 de diamante por cada millón
	if (_diamante > 0) then {
		["pop_diamante", _diamante] call ica_fnc_item;
		hint format ["Has robado %1 diamantes.", _diamante];
	} else {
		hint "Queda dinero...";
	};

	["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
	ocupado = nil;
};

if (_param isEqualTo "useATM") exitWith {
	if ((player distance Portatilalcade) < 60) then {
		if (playerSide == CIVILIAN) then {
			[] spawn {
				life_use_atm = false;
				sleep (60 * 10);
				life_use_atm = true;
			};
		};
	};
};
