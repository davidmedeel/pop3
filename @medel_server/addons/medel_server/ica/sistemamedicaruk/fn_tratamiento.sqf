
/*
por: Icaruk

	player playMove "Acts_TreatingWounded1"; // RCP 5.3
	player playMove "Acts_TreatingWounded2"; // pinchazo 8.1
	player playMove "Acts_TreatingWounded3"; // vendaje compresivo 8.7
	player playMove "Acts_TreatingWounded5"; // genérico 10
*/

_victima = _this select 0;
_zona = _this select 1;
_cosa = _this select 2;

if (!isNil {ocupado}) exitWith {};
ocupado = true;

// hint format ["%1 \n %2 \n %3", name _victima, _zona, _cosa];

if (isNil {_victima}) exitWith {hint "No hay paciente"; ocupado = nil};
if (!(alive _victima) AND (_cosa != "pop_csi")) exitWith {hint "El paciente está muerto"; ocupado = nil};
if ((player distance _victima) > 2) exitWith {hint "Estás demasiado lejos"; ocupado = nil};
if (isNil {_zona}) exitWith {hint "Tienes que seleccionar una zona"; ocupado = nil};
if (isNil {_cosa}) exitWith {hint "Tienes que seleccionar un tratamiento"; ocupado = nil};

if !(([_cosa] call ica_fnc_tengo) >= 1) exitWith {hint "No te queda de eso"; ocupado = nil};

_lvlmed = "med" call ica_fnc_expToLevel;
switch (_cosa) do {
	case "pop_vendas": {
		if (_lvlmed < 1) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if !((_zona == "brazos") OR (_zona == "piernas")) exitWith {hint "Las vendas sólo se puede aplicar a brazos y piernas"; ocupado = nil};
		
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		if (vehicle player == player) then { 
			[8, "Aplicando vendaje..."] spawn ica_fnc_barrita;
			player playmove "AinvPknlMstpSnonWrflDr_medic2";
			sleep 8;
			player switchMove "";
		} else {
			[2, "Aplicando vendaje..."] spawn ica_fnc_barrita;
			sleep 2;
		};
	
		_n = _victima getVariable _zona;
		_n = if (_n < 50) then {_n} else {50};
		_victima setVariable [_zona, (_victima getVariable _zona) - _n, true];
	};
	case "pop_vendas_c": {
		if (_lvlmed < 2) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		
		if (vehicle player == player) then {
			[8, "Aplicando vendaje compresivo..."] spawn ica_fnc_barrita;
			player playmove "AinvPknlMstpSnonWrflDr_medic5";
			sleep 8;		
			player switchMove "";
		} else {
		[2, "Aplicando vendaje compresivo..."] spawn ica_fnc_barrita;
		sleep 2;
		};
		_sangrando = _victima getVariable "sangrando";
		_idx = switch (_zona) do {
			case "cabeza": {0};
			case "pecho": {1};
			case "brazos": {2};
			case "piernas": {3};
		};
		if (((_victima getVariable "sangrando") select _idx) >= 1) then {
			_sangrando set [_idx, (_sangrando select _idx) - 1];
			_victima setVariable ["sangrando", _sangrando, true];
		};
	};
	case "pop_tramadol": {
		if (_lvlmed < 3) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		
		if (vehicle player == player) then {
			[8, "Suministrando tramadol..."] spawn ica_fnc_barrita;
			player playmove "AinvPknlMstpSnonWrflDr_medic1";
			sleep 8;	
			player switchMove "";		
		} else {
		[2, "Suministrando tramadol..."] spawn ica_fnc_barrita;
		sleep 2;
		};
		_rnd = 15 + round (random 10);
		_n = _victima getVariable _zona;
		_n = if (_n < _rnd) then {_n} else {_rnd};
		_victima setVariable [_zona, (_victima getVariable _zona) - _n, true];
		
		_victima setVariable ["toxicidad", (_victima getVariable "toxicidad") + _n, true];
		// [_victima] spawn ica_fnc_toxicidad;
		[_victima] remoteexec ["ica_fnc_toxicidad",_victima];
	};
	case "pop_morfina": {
		if (_lvlmed < 4) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		if (vehicle player == player) then {
			[8, "Inyectando morfina..."] spawn ica_fnc_barrita;
			player playmove "AinvPknlMstpSnonWrflDr_medic1";
			sleep 8;	
			player switchMove "";
		} else { 
		[2, "Inyectando morfina..."] spawn ica_fnc_barrita;
		sleep 2;
		};

		_rnd = 35 + round (random 10);
		_n = _victima getVariable _zona;
		_n = if (_n < _rnd) then {_n} else {_rnd};
		
		_victima setVariable [_zona, (_victima getVariable _zona) - _n, true];
		
		_victima setVariable ["toxicidad", (_victima getVariable "toxicidad") + _n, true];
		// [_victima] spawn ica_fnc_toxicidad;
		[_victima] remoteexec ["ica_fnc_toxicidad",_victima];
	};
	case "pop_epinefrina": {
		if (_lvlmed < 5) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if !(_zona == "pecho") exitWith {hint "El desfibrilador tiene que utilizarse en el pecho"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		[8, "Inyectando epinefrina..."] spawn ica_fnc_barrita;
		if (vehicle player == player) then {
			player playmove "AinvPknlMstpSnonWrflDr_medic2";
			sleep 8;	
			player switchMove "";
			[_victima, false] spawn ica_fnc_inconsciente;
			detach _victima;
		} else { sleep 8;};
		
		_victima setVariable ["toxicidad", (_victima getVariable "toxicidad") + 50, true];
		// [_victima] spawn ica_fnc_toxicidad;
		[_victima] remoteexec ["ica_fnc_toxicidad",_victima];
	};
	case "pop_desfibrilador": {
		if (_lvlmed < 5) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if !(_zona == "pecho") exitWith {hint "El desfibrilador tiene que utilizarse en el pecho"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		//[_cosa, -1] call ica_fnc_item;
		//[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		[8, "Usando desfibrilador..."] spawn ica_fnc_barrita;
		if (vehicle player == player) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 8;	
			player switchMove "";
			[_victima, false] spawn ica_fnc_inconsciente;
			_victima setDamage ((damage _victima) + 0.5);
			detach _victima;
		} else { sleep 8;};
	};
	case "pop_bolsadesangre": {
		if (_lvlmed < 6) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if !(_zona == "brazos") exitWith {hint "La bolsa de sangre tiene que aplicarse en el brazo"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		
		if (vehicle player == player) then {
			[8, "Administrando sangre..."] spawn ica_fnc_barrita;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 8;
			player switchMove "";
		} else {
		[2, "Administrando sangre..."] spawn ica_fnc_barrita;
		sleep 2;
		};

		_victima setDamage ((damage _victima) - 0.3);
		_victima setVariable ["toxicidad", (_victima getVariable "toxicidad") + 10, true];
		// [_victima] spawn ica_fnc_toxicidad;
		[_victima] remoteexec ["ica_fnc_toxicidad",_victima];
	};
	case "pop_csi": {
		if (_lvlmed < 7) exitWith {hint "No tienes los conocimientos para hacer eso"; ocupado = nil};
		if (side player != INDEPENDENT) exitWith {hint "No eres médico"; ocupado = nil};
		if (alive _victima) exitWith {hint "No se puede practicar una biopsia en alguien vivo"; ocupado = nil};
		if !(_zona == "pecho") exitWith {hint "La biopsia/necropsia se debe hacer en el pecho"; ocupado = nil};
		if (player == _victima) exitWith {hint "No puedes aplicarte ese tratamiento a ti mismo"; ocupado = nil};
		
		[_cosa, -1] call ica_fnc_item;
		[format ["-1 %1", [_cosa] call ica_fnc_classToname]] call ica_fnc_infolog;
		
		[8, "Investigando..."] spawn ica_fnc_barrita;
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 8;
		player switchMove "";

		_arr = _victima getVariable "culpables";
		_str = "";
		for "_x" from 0 to (count _arr)-1 do {
			if (count (_arr select _x) == 0) exitWith {};
			_str = _str + "Proyectil:   " + (_arr select _x select 1) + "\n";
			_str = _str + "Huellas:   " + (_arr select _x select 0) + "\n\n";
		};
		hint format ["%1", _str];
	};
};

ocupado = nil;
