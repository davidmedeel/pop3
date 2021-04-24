
/*
por Medel
Incautador de dinero por %
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {
	createDialog "IncautarDinero";
};

if (_param isEqualTo "confirmo") exitWith {
	_porcentaje = ctrlText 999017;
	if (!([_porcentaje] call TON_fnc_isnumber)) exitWith { 	hint "Formato Inválido"; };
	_porcentaje = parseNumber(_porcentaje);
	if ((_porcentaje > 100) or (_porcentaje < 1)) exitWith {
		hint "Formato Inválido";
	};
	closeDialog 0;
	["quitar",_porcentaje,player] remoteexec ["ica_fnc_quitardinero", life_pInact_curTarget, false];
};
if (_param isEqualTo "quitar") exitWith {
	_porcentaje = param [1];
	_player = param [2];
	
	_porcentajeF = round (medel_din * _porcentaje / 100);
	medel_din = medel_din - _porcentajeF;
	hint format ["Te han incautado el %1%3 [%2€]", _porcentaje, _porcentajeF, "%"];
	["dar",_porcentajeF,_porcentaje] remoteexec ["ica_fnc_quitardinero", _player, false];
};
if (_param isEqualTo "dar") exitWith {
	_porcentajeF = param [1];
	_porcentaje = param [2];
	medel_din = abs medel_din;
	medel_din = medel_din + _porcentajeF;
	hint format ["Has incautado el %1%3 [%2€]", _porcentaje, _porcentajeF, "%"];
};
