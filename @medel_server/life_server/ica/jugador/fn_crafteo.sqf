
/*
Crafteo por Icaruk
	["menu"] call ica_fnc_crafteo;
*/

_param = _this select 0;

_fnc_ingredientes = {
	private ["_cosa", "_ingred"];
	_cosa = _this select 0;
	switch (_cosa) do {
		case "": {_ingred = ["Selecciona una receta", 0] };

		// Artesanía
		case "A3L_BergenMurica":{_ingred = [["pop_bamboo_i",1,"pop_tela",1], 5] };
		case "CUP_B_GER_Pack_Tropentarn": {_ingred = [["pop_bamboo_i",2,"pop_tela",1], 5] };
		case "pop_chaleco_carga": {_ingred = [["pop_tela",6], 5] };
		case "mochila_mediana":{_ingred = [["pop_bamboo_i",2,"pop_tela",2], 5] };
		case "mochila_grande": {_ingred = [["pop_bamboo_i",2,"pop_tela",3], 5] };

		// Materiales
		case "pop_tela": {_ingred = ["pop_algodon_i",2] };
		case "pop_silicio": {_ingred = ["pop_arena_r",2] };
		case "pop_cristal": {_ingred = ["pop_arena_r",4] };
		case "pop_paneldecristal": {_ingred = ["pop_cristal",4] };
		case "pop_botella": {_ingred = ["pop_cristal",1] };
		case "pop_lingotehierro": {_ingred = ["pop_hierro_r",4] };
		case "pop_granlingote": {_ingred = ["pop_lingotehierro",6] };
		case "pop_componentes": {_ingred = [["pop_hierro_r",1,"pop_silicio",1,"pop_cristal",1], 20] };
		case "pop_polvora": {_ingred = [["pop_arena_r",1,"pop_carbon_r",1], 20] };
		case "pop_pintura": {_ingred = [["pop_arena_r",5,"pop_carbon_r",1,"pop_silicio",5], 20] };
		case "pop_oxigeno": {_ingred = [["pop_botella",1,"pop_carbon_r",1,"pop_componentes",5], 20] };

		// Equipamiento
		case "CUP_V_RUS_Smersh_1": {_ingred = [["pop_tela",3], 5] };
		case "TAC_HSG_ABH_B": {_ingred = [["pop_tela",3], 5] };
		case "CUP_V_OI_TKI_Jacket2_06": {_ingred = [["pop_tela",3], 5] };
		case "TAC_V_Sheriff_BA_TB5": {_ingred = [["pop_hierro_r",1,"pop_silicio",1,"pop_tela",3], 5] };
		case "TAC_FS_FO_mL_B": {_ingred = [["pop_hierro_r",1,"pop_silicio",1,"pop_tela",3], 5] };
		case "U_B_Wetsuit": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1], 30] };
		case "V_RebreatherB": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1], 25] };
		case "G_Diving": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1], 20] };

		// Visores
		case "Cha_1P78_Sight": {_ingred = [["pop_componentes",1,"pop_lingotehierro",2,"pop_cristal",2], 30] };
		case "Cha_Cobradot_Sight": {_ingred = [["pop_componentes",1,"pop_lingotehierro",2,"pop_cristal",3], 30] };
		case "optic_ACO_grn": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1,"pop_cristal",2], 30] };
		case "optic_Arco": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1,"pop_cristal",2], 30] };
		case "optic_DMS": {_ingred = [["pop_componentes",2,"pop_lingotehierro",2,"pop_cristal",3], 30] };
		case "optic_AMS_khk": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1,"pop_cristal",2], 30] };
		case "HLC_Optic_PSO1": {_ingred = [["pop_componentes",1,"pop_lingotehierro",1,"pop_cristal",2], 30] };

		// Visores policía
		case "optic_ACO_grn": {_ingred = [["pop_componentes",1,"pop_lingotehierro",2,"pop_cristal",2], 30] };
		case "RH_ta31rmr": {_ingred = [["pop_componentes",2,"pop_lingotehierro",1,"pop_cristal",2], 30] };
		case "optic_Hamr": {_ingred = [["pop_componentes",1,"pop_lingotehierro",2,"pop_cristal",2], 30] };
		case "optic_AMS_khk": {_ingred = [["pop_componentes",1,"pop_lingotehierro",2,"pop_cristal",2], 30] };

		// Otros
		case "pop_c4": {_ingred = [["pop_componentes",2,"pop_lingotehierro",3,"pop_silicio",2,"pop_polvora",1], 2] };
		case "O_IR_Grenade": {_ingred = [["pop_componentes",3,"pop_lingotehierro",1,"pop_arena_r",2], 2] };
		case "pop_bisturi_item": {_ingred = [["pop_lingotehierro",3,"pop_paneldecristal",2],2] };
		case "pop_tramadol": {_ingred = [["pop_botella",1,"pop_alcohol",1,"pop_opio_b",5], 10] };

		// Vehículos

	};

	if (isNil {_this select 1}) then { // no he llamado a la funcion pidiendo tiempo, devuelvo ingredientes
		if ((typeName (_ingred select 0)) == "STRING") then { // contiene 1 array
			_ingred
		} else { // contiene 2 arrays, pero sólo devuelvo 1
			_ingred select 0
		};
	} else { // aquí la he llamado con ["nombre", "tiempoCraft"] así que devuelvo número
		if ((typeName (_ingred select 0)) == "STRING") then { // no tiene tiempo definido, le pongo por defecto y lo devuelvo
			_ingred = 10;
			_ingred
		} else { // tiene uno y lo devuelvo
			_ingred = _ingred select 1;
			_ingred
		};
	};
};

_fnc_preguntoOresto = {
	private ["_param", "_ing", "_n", "_final"];
	_param = _this select 0;
	_ing = _this select 1;
	_n = _this select 2;

	_tengo = false;
	_tengo = switch (_param) do {
		case "pregunto": {	if (([_ing] call ica_fnc_tengo) >= _n) then {true};	};
		case "resto": { [_ing, _n *-1] call ica_fnc_item };
	};
	if (isNil {_tengo}) exitWith {false};
	_tengo
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "menu") exitWith {
	disableSerialization;
	createDialog "crafteo";
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista3 = (_ui displayCtrl 5037);

	_categorias = ["Artesanía", "Materiales", "Equipamiento", "Visores", "Visores policía", "Otros", "Vehículos"];

	_idx = 0;
	lbClear _lista1;
	while {_idx < (count _categorias)} do { // categorias
		_lista1 lbAdd format [(_categorias select _idx)];
		_lista1 lbSetData [_idx, (_categorias select _idx)];
		_idx = _idx + 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza2") exitWith { // ver recetas
	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_idxLista1 = lbCurSel 5035;
	_categoria = _lista1 lbData _idxLista1;

	private "_recetas";
	switch (_categoria) do {
		case "Artesanía": {
			_recetas = [
			
				["A3L_BergenMurica", 1], ["CUP_B_GER_Pack_Tropentarn", 1], ["pop_chaleco_carga", 1], ["mochila_mediana", 1], ["mochila_grande", 1]
			
			];
		};
		case "Materiales": {
			_recetas = [
			
				["pop_tela", 1], ["pop_silicio", 1], ["pop_cristal", 1], ["pop_paneldecristal", 1], ["pop_botella", 1], ["pop_lingotehierro", 1], ["pop_granlingote", 1], ["pop_componentes", 1], ["pop_polvora", 1], ["pop_pintura", 1], ["pop_oxigeno", 1]
			
			];
		};
		case "Equipamiento": {
			_recetas = [
			
				["CUP_V_RUS_Smersh_1", 1], ["TAC_HSG_ABH_B", 1], ["CUP_V_OI_TKI_Jacket2_06", 1], ["TAC_V_Sheriff_BA_TB5", 1], ["TAC_FS_FO_mL_B", 1], ["U_B_Wetsuit", 1], ["V_RebreatherB", 1], ["G_Diving", 1]
			
			];
		};
		case "Visores": {
			_recetas = [
			
				["Cha_1P78_Sight", 1], ["Cha_Cobradot_Sight", 1], ["optic_ACO_grn", 1], ["optic_Arco", 1], ["optic_DMS", 1], ["optic_AMS_khk", 1], ["HLC_Optic_PSO1", 1]
				
			];

		};
		case "Visores policía": {
			_recetas = [
			
				["optic_ACO_grn", 1], ["RH_ta31rmr", 1], ["optic_Hamr", 1], ["optic_AMS_khk", 1]
			
			];
		};
		case "Otros": {
			_recetas = [
			
				["pop_c4", 1], ["O_IR_Grenade", 1], ["pop_bisturi_item", 1], ["pop_tramadol", 1]
			
			];
		};
		case "Vehículos": {
			_recetas = [
				["", 1]
			];
		};
	};

	_idx = 0;
	lbClear _lista2;
	lbClear _lista3;
	while {_idx < (count _recetas)} do { // recetas
		_nom = [_recetas select _idx select 0] call ica_fnc_classToName;
		_lista2 lbAdd _nom;
		_lista2 lbSetData [_idx, (_recetas select _idx select 0)];
		_lista2 lbSetValue [_idx, (_recetas select _idx select 1)];
		_lista2 lbSetPicture [_idx, [_recetas select _idx select 0] call des_fnc_classToPic];
		_idx = _idx + 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza3") exitWith { // ver ingredientes
	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_boton = (_ui displayCtrl 5039);
	_idxLista2 = lbCurSel 5036;
	_receta = [_lista2 lbData _idxLista2, _lista2 lbValue _idxLista2];

	_ingredientes = ([_receta select 0] call _fnc_ingredientes);

	lbClear _lista3;
	_idx = 0;
	_idxLista = 0;
	while {_idx < (count _ingredientes)} do { // meto ingredientes en lista
		_lista3 lbAdd format ["%1 x %2", [_ingredientes select _idx] call ica_fnc_classToName, (_ingredientes select (_idx + 1))];
		_lista3 lbSetPicture [_idx, [_ingredientes select _idx] call des_fnc_classToPic];
		_lista3 lbSetColor [_idxLista, [0.2, 1, 0.2, 1]]; // verde

		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto) then {
			_lista3 lbSetColor [_idxLista, [1, 0.2, 0.2, 1]]; // rojo
		};

		_idx = _idx + 2;
		_idxLista = _idxLista + 1;
	};

	receta = _receta;
	ingredientes = _ingredientes;

	_boton buttonSetAction '
		["craft"] spawn ica_fnc_crafteo;
	';

};
// ["craft", receta, ingredientes] ica_fnc_crafteo;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "craft") exitWith {

	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_barrita = (_ui displayCtrl 5038);
	_boton = (_ui displayCtrl 5039);
	_lista = _ui displayCtrl 5036;
	//_receta = _this select 1;
	//_ingredientes = _this select 2;
	_receta = receta;
	_ingredientes = ingredientes;

	_boton ctrlEnable false;
	_lista lbSetCurSel -1;

	receta = nil;
	ingredientes = nil;
	boton = nil;

	private "_fuera";

	_idx = 0; // tengo ingredientes?
	while {_idx < (count _ingredientes)} do {
		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto) exitWith {_fuera = true; };
		_idx = _idx + 2;
	};
	if (!isNil {_fuera}) exitWith {hint "No tienes suficientes ingredientes"; };

	_t = [_receta select 0, "tiempoCraft"] call _fnc_ingredientes;	// saco tiempo de crafteo
	_frag = (100 / _t) / 100;
	while {true} do {
		if (_t <= 0) exitWith {_barrita progressSetPosition 0; };
		if (!alive player) exitWith {fuera = true};
		if (isNull (findDisplay 5040)) exitWith {fuera = true};
		_barrita progressSetPosition ((progressPosition _barrita) + _frag);
		_t = _t - 1;
		sleep 1;
	};
	_boton ctrlEnable true;
	if (!isNil {fuera}) exitWith {hint "Crafteo cancelado"; fuera = nil; };

	// Compruebo condiciones
	_art = "art" call ica_fnc_expToLevel;
	_inf = "inf" call ica_fnc_expToLevel;
	_min = "min" call ica_fnc_expToLevel;
	_med = "med" call ica_fnc_expToLevel;
	
	_que = _receta select 0;

	_puedo = true;
	_puedo = switch (true) do {
		case ((_que == "mochila_mediana") AND (_art < 1)): {false};
		case ((_que == "mochila_grande") AND (_art < 2)): {false};
		case ((_que == "pop_chaleco_carga") AND (_art < 3)): {false};
		case ((_que == "pop_molotov") AND (_art < 4)): {false};
		case ((_que == "pop_polvora") AND (_art < 5)): {false};
		case ((_que == "pop_pociondeparkour") AND (_art < 6)): {false};
		case ((_que == "O_ghillie_sard_F") AND (_art < 7)): {false};
		case ((_que == "pop_pociondeinvis") AND (_art < 8)): {false};
		case ((_que == "pop_winchester") AND (_art < 9)): {false};
		case ((_que == "pop_winchester_384") AND (_art < 9)): {false};

		case ((_que == "pop_c4") AND (_inf < 1)): {false};
		case ((_que == "O_IR_Grenade") AND (_inf < 5)): {false};
		case ((_que == "pop_bisturi_item") AND (_med < 6)): {false};

		case ((_que == "pop_lingotehierro") AND (_min < 3)): {false};
	};

	if (!_puedo) exitWith {hint "Aún no sabes hacer eso"};

	if (
		!(player canAdd (_receta select 0)) AND
		(((_receta select 0) call ica_fnc_item) != "Bac") AND
		(((_receta select 0) call ica_fnc_item) != "Ves")
	) exitWith {hint "No tienes suficiente espacio"};

	// Resto ingredientes y crafteo
	_idx = 0;
	while {_idx < (count _ingredientes)} do {
		["resto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto;
		_idx = _idx + 2;
	};

	if ((_receta select 0) == "") exitWith {
		0 spawn {hint "¿Qué intentas?";
		sleep 2;
		hint "No, en serio, ¿qué intentas? xD"};
	};

	[_receta select 0, _receta select 1] call ica_fnc_item;
	hint format ["Has crafteado %1 unidad(es) de %2", _receta select 1, [_receta select 0] call ica_fnc_classToName];
};
