
/*
Sacar dinero público para que lo use la policía por Icaruk
	["consultar"] spawn ica_fnc_sacoDineroPublico;
	[20000] spawn ica_fnc_sacoDineroPublico;
*/

_param = param [0];

if (_param == "consultar") exitWith {
	if (side player != WEST) exitWith {hint "No eres policía"};
	// añadir comprobacion de rango

	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};

	disableSerialization;
	createDialog "sacoDineroPublico";
	_ui = uiNameSpace getVariable "sacoDineroPublico";
	_txt = _ui displayCtrl 5053;
	_txt ctrlSetText format ["Fondos públicos: %1€", fondosPublicos];
};

if (_param != "consultar") exitWith {
	[player, ["fondosPublicos"]] call ica_fnc_varToServer; waitUntil {recibido};

	_entrada = parseNumber (_this select 0);
	if ((_entrada <= 0) OR (isNil {_entrada})) exitWith {hint "Si no quieres sacar nada, ¿para qué abres este menú?" };
	if (_entrada >= 999999) exitWith {hint "No puedes sacar más de 999.999€ a la vez" };
	if (_entrada > fondosPublicos) exitWith {"No hay tanto dinero" };

	closeDialog 0;
	fondosPublicos = fondosPublicos - _entrada;
	publicVariableServer "fondosPublicos";
	medel_din = medel_din + medel_dsin_entrada;

	hint format ["Has sacado %1€ de los fondos públicos", _entrada];

	[0, format ["La policía ha sacado %1€ de los fondos públicos", _entrada]] remoteexeccall ["life_fnc_broadcast",-2];
	
	
	["Money Log",format [
	"%1 - (%2) ha sacado %3 de los fondos publicos",
	profileName,
	(getPlayerUID player),
	_entrada
	]
	] remoteexeccall ["ica_fnc_customlog",2];
};
