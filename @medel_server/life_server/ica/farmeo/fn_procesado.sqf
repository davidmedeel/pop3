
/*
por: Icaruk
	["pop_tronco"] spawn ica_fnc_procesado;
	["pop_aguasucia"] spawn ica_fnc_procesado;
	["alimentos"] spawn ica_fnc_procesado;
*/

_param = _this select 0;
_tengo = [_param] call ica_fnc_tengo;

switch (_param) do {
	case "pop_tronco": {
		if (_tengo >= 1) then {
			[_param, _tengo *-1] call ica_fnc_item;
			[format ["-%1 tronco", _tengo]] call ica_fnc_infolog;
			_t = _tengo / 2;
			[_t, "Serrando..."] spawn ica_fnc_barrita;
			sleep _t;
			["pop_madera", _tengo] call ica_fnc_item;	
			[format ["+%1 madera", _tengo]] call ica_fnc_infolog;
		};
	};
	case "pop_aguasucia": {
		if (_tengo >= 1) then {
			[_param, _tengo *-1] call ica_fnc_item;
			[format ["-%1 agua sucia", _tengo]] call ica_fnc_infolog;
			_t = _tengo / 2;
			[_t, "Purificando..."] spawn ica_fnc_barrita;
			sleep _t;
			["pop_agualimpia", _tengo] call ica_fnc_item;	
			[format ["+%1 agua limpia", _tengo]] call ica_fnc_infolog;
		};
	};
	case "alimentos": {	
		_listaAlimentos = ["pop_rabano_i", "pop_girasol_i", "pop_maiz_i", "pop_trigo_i", "pop_pez", "pop_tiburon"];
		_puedo = false;
		_idx = 0;
		while {_idx < (count _listaAlimentos)} do {
			_param = _listaAlimentos select _idx;			
			if (([_param] call ica_fnc_tengo) >= 1) exitWith {
				_tengo = [_param] call ica_fnc_tengo;
				_tengo = if (_param == "pop_tiburon") then {_tengo * 5} else {_tengo};
				_puedo = true;
			};
			_idx = _idx + 1;
		};
			
		if !(_puedo) exitWith {hint "No tienes alimento para procesar"};
		
		[_param, _tengo *-1] call ica_fnc_item;
		[format ["-%1 %2", _tengo, [_param] call ica_fnc_classToName]] call ica_fnc_infolog;
		_t = _tengo / 2;
		[_t, "Procesando..."] spawn ica_fnc_barrita;
		sleep _t;
		["pop_cajaalimentos", _tengo] call ica_fnc_item;	
		[format ["+%1 caja alimento", _tengo]] call ica_fnc_infolog;
	};
};