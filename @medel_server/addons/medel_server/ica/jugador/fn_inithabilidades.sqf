
/*
por: Icaruk
	call ica_fnc_initHabilidades;
*/

[] spawn { // Fortaleza, pesca y fatiga por carga
	while {true} do {
		_fortaleza = "for" call ica_fnc_expToLevel;
		_pesca = "pes" call ica_fnc_expToLevel;
		_carga = ["kg"] call ica_fnc_cargaInv;
		
		if ((_pesca >= 3) AND (underwater player)) then {
			player setFatigue 0;
		};
		_n = 0;
		
		_n = if (_fortaleza >= 3) then {0.065} else {0};
		_nCarga = if ((_fortaleza < 6) AND (_carga >= 2)) then {_carga / 100} else {0};
		_nFin = _n - _nCarga; // neoxan, aquí está el problema
		
		player setFatigue ((getFatigue player) + _nFin);
		if (getFatigue player > 0.9) then {player setFatigue 0.9};
		
		_listaBuzo = [];
		if (((uniform player) in _listaBuzo) AND (_pesca < 4)) then {
			removeUniform player;
			hint "No tienes los conocimientos necesarios para llevar un traje de buzo";
		};
		
		sleep 30;
	};
};

[] spawn { // Medicina (regeneracion)
	while {true} do {
		_med = "med" call ica_fnc_expToLevel;
		
		if (_med >= 6) then {
			player setDamage ((damage player) - 0.1);
		};

		sleep (60 * 1);	
	};
};

player addEventHandler ["HandleDamage", {
	_for = "for" call ica_fnc_expToLevel;
	
	if ((_this select 3) == player) then {
		_reduc = 0;
		
		_dmg = if (_for >= 2) then {(_this select 2) - 4} else {_this select 2};
		if (_dmg < 0) then {_dmg = 0};
		//hint format ["daño: %1\n daño final %2", _this select 2, _dmg];
		
		_dmg
	} else {
		_dmg = if (_for >= 4) then {
			if ((random 100) < 20) then {0} else {_this select 2};
		} else {
			_this select 2
		};
		
		_dmg
	};
}];