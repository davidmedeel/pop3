
/*
por: Icaruk
	["envio", obj, 60, 60*20] call ica_fnc_bloqueoDinero;
	["recibo"] call ica_fnc_bloqueoDinero; // init
	["recibo", 123] call ica_fnc_bloqueoDinero;
*/

_param = param [0];

if (_param isEqualTo "envio") exitWith {
	_objeto = param [1];
	_distancia = param [2];
	_tiempo = param [3];

	_area = (position _objeto) nearObjects _distancia;
	_gente = [];
	{
		if ((_x isKindOf "man") AND ((side _x) == CIVILIAN) AND ((_x distance _objeto) < _distancia))  then {
			_gente pushBack _x;
		};
	} forEach _area;
	
	["recibo",_tiempo] remoteexeccall ["ica_fnc_bloqueoDinero",_gente];
};

if (_param isEqualTo "recibo") exitWith {
	_tiempo = _this select 1;
	
	if (!isNil {_tiempo}) then {
		profileNamespace setVariable ["dinerobloqueado", _tiempo];
	};
	0 spawn {
		while {true} do {
			if ((profileNamespace getVariable "dineroBloqueado") <= 0) exitWith {profileNamespace setVariable ["dinerobloqueado", nil]};
			profileNamespace setVariable ["dineroBloqueado", (profilenamespace getVariable "dineroBloqueado") - 30];
			sleep 30;
		};
	};
	if (!isNil {_tiempo}) then {
		life_use_atm = false;
		sleep _tiempo;
		life_use_atm = true;
	};
};