/*
	por: Bortfive


	["menu"] call ica_fnc_Crafteo

*/

_param = param [0];

arrCrafteos = [
	
	[
		0, 						// id receta
		1, 						// Categoria
		["pop_tela", 1], 		// Recibes
		[["pop_algodon_i", 2]], // Necesitas
		[0,""], 					// ¿Alguna Habilidad?
		10, 					// Tiempo
		1						// Confort que recibes
	],


	[
		1, 
		1,
		["pop_silicio", 1],
		[["pop_arena_r", 2]],
		[0,""],
		10,
		1
	],

	[
		2, 
		1,
		["pop_cristal", 1],
		[["pop_arena_r", 4]],
		[0,""],
		10,
		1
	],


	[
		3, 
		1,
		["pop_paneldecristal", 1],
		[["pop_cristal", 4]],
		[0,""],
		10,
		1
	],



	[
		4, 
		1,
		["pop_botella", 1],
		[["pop_cristal", 1]],
		[0,""],
		10,
		1
	],



	[
		5, 
		1,
		["pop_lingotehierro", 1],
		[["pop_hierro_r", 2]],
		[0,""],
		10,
		1
	],


	[
		6, 
		1,
		["pop_granlingote", 1],
		[["pop_lingotehierro", 6]],
		[0,""],
		10,
		1
	],


	[
		7, 
		1,
		["pop_componentes", 1],
		[["pop_hierro_r", 1], ["pop_silicio", 1],["pop_cristal",1]],
		[0,""],
		20,
		1
	],



	[
		8, 
		1,
		["pop_polvora", 1],
		[["pop_arena_r", 1], ["pop_carbon_r", 1]],
		[0,""],
		20,
		1
	],



	[
		9, 
		1,
		["pop_pintura", 1],
		[["pop_arena_r", 5], ["pop_carbon_r", 1],["pop_silicio", 5]],
		[0,""],
		20,
		1
	],



	[
		10, 
		1,
		["pop_oxigeno", 1],
		[["pop_botella", 1], ["pop_carbon_r", 1], ["pop_componentes", 5]],
		[0,""],
		20,
		1
	],
	[
		16,
		2,
		["pop_chaleco_carga", 1],
		[["pop_tela", 6]],
		[3,"art"],
		10,
		1
	],
	[
		17,
		2,
		["TAC_HSG_ABH_B", 1],
		[["pop_tela", 6]],
		[2,""],
		10,
		1
	],
	[
		19,
		2,
		["TAC_FS_FO_mL_B", 1],
		[["pop_hierro_r", 1],["pop_silicio",1],["pop_tela",3]],
		[2,""],
		30,
		1
	],
	
	[
		20,
		3,
		["A3L_BergenMurica", 1],
		[["pop_bamboo_i", 1],["pop_tela",1]],
		[0,""],
		10,
		1
	],
	
	[
		21,
		3,
		["mochila_mediana", 1],
		[["pop_bamboo_i",2],["pop_tela",2]],
		[1,"art"],
		15,
		1
	],
	
	[
		22,
		3,
		["mochila_grande", 1],
		[["pop_bamboo_i", 2],["pop_tela",3]],
		[2,"art"],
		20,
		1
	],

	[
		24,
		4,
		["TRYK_Kio_Balaclava", 1],
		[["pop_tela",3]],
		[4,""],
		10,
		1
	],
	[
		28,
		5,
		["k_cut_7", 1],
		[["pop_tela",4],["pop_bamboo_i",1],["pop_lingotehierro",1]],
		[6,""],
		45,
		1
	],
	
	[
		47,
		6,
		["U_C_Polo_Dalton", 1],
		[["pop_tela",1],["pop_bamboo_i",1]],
		[7,""],
		30,
		1
	],
	[
		48,
		6,
		["EF_suit_6", 1],
		[["pop_tela",2],["pop_bamboo_i",1]],
		[7,""],
		30,
		1
	],
	[
		49,
		6,
		["U_B_Wetsuit", 1],
		[["pop_tela",1],["pop_bamboo_i",1]],
		[7,""],
		30,
		1
	],
	[
		50,
		6,
		["V_RebreatherB", 1],
		[["pop_componentes",1],["pop_lingotehierro",1]],
		[7,""],
		30,
		1
	],
	[
		52,
		7,
		["pop_taladro", 1],
		[["pop_lingotehierro",2],["pop_componentes",7]],
		[8,""],
		30,
		1
	],
	[
		53,
		7,
		["O_IR_Grenade", 1],
		[["pop_componentes",3],["pop_lingotehierro",1],["pop_arena_r",1]],
		[8,""],
		30,
		1
	],
	/*
	[
		55,
		9,
		["POP_BandaClavos_i", 1],
		[["pop_lingotehierro",3],["pop_componentes",3]],
		[8,""],
		30,
		1
	],
	*/
	[
		62,
		8,
		["pop_c4", 1],
		[["pop_componentes",2],["pop_lingotehierro",3],["pop_silicio",3],["pop_polvora",1]],
		[9,""],
		60,
		1
	],
	
	[
		63,
		8,
		["pop_bisturi_item", 1],
		[["pop_lingotehierro",3],["pop_paneldecristal",2]],
		[9,""],
		60,
		1
	],
	
	[
		65,
		8,
		["pop_pociondeparkour", 1],
		[["pop_botella",2],["pop_polvora",2],["pop_r_monster",5]],
		[9,""],
		45,
		1
	]
];



arrCatCrafteos = [
	[1, "Materiales"],
//	[2, "Ropa"],
	[2, "Chalecos"],
	[3, "Mochilas"],
	[4, "Mascaras"],
//	[6, "Ladron"],
	[5, "Antibalas"],
	[6, "Ropa Especial"],
	[7, "Crimen"],
	[8,"Miscelaneo"]
];
	
	

	
	



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "menu") exitWith {
	
	disableSerialization;
	createDialog "Crafteo";
	_ui = uiNamespace getVariable "Crafteo";
	_lista1 = (_ui displayCtrl 5035);
	lbClear _lista1;
	
	{
		_lista1 lbAdd format [(arrCatCrafteos select _forEachIndex select 1)];
		_lista1 lbSetData [_forEachIndex,str(arrCatCrafteos select _forEachIndex select 0)];
	} forEach arrCatCrafteos
	
	
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza2") exitWith { // ver recetas
	
	disableSerialization;
	_ui = uiNamespace getVariable "Crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista3 = (_ui displayCtrl 5037);
	_idxLista1 = (lbCurSel 5035);
	_lista2 = (_ui displayCtrl 5036);
	lbClear _lista2;


	{
		if (_idxLista1 isEqualTo (arrCrafteos select _forEachIndex select 1) - 1) then {
			
			_nom = [arrCrafteos select _forEachIndex select 2 select 0] call ica_fnc_classToName;
			_lista2 lbAdd _nom;
			_lista2 lbsetvalue [(lbsize _lista2) - 1,_forEachIndex];
			_lista2 lbSetPicture [(lbsize _lista2) - 1 , [arrCrafteos select _forEachIndex select 2 select 0] call ica_fnc_classToPic];
			
		};
	} forEach arrCrafteos;



};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza3") exitWith { // ver ingredientes
	disableSerialization;
	_ui = uiNamespace getVariable "Crafteo";
	_lista3 = (_ui displayCtrl 5037);
	_boton = (_ui displayCtrl 5039);
	_multiplicador = parsenumber (ctrltext 5034);
	//_arrayMateriales = call compile (lbData [5036,(lbCurSel 5036)]);
	_arrayReceta = arrCrafteos select (((uiNamespace getVariable "Crafteo") displayCtrl 5036) lbvalue (lbcursel ((uiNamespace getVariable "Crafteo") displayCtrl 5036)));
	
	[] spawn {
	while {dialog && ((lbCurSel 5035) != -1)} do {
	_cosa = parsenumber (ctrltext 5034);
	sleep 0.5;
	if (dialog) then {if (_cosa != (parsenumber (ctrltext 5034))) exitwith {["actualiza3"] call ica_fnc_menucrafteo;hint "actualizado";sleep 0.3; hint ""}};
	};
	};
	lbClear _lista3;
	
	_arrayMateriales = (_arrayReceta select 3);
	arrayReceta = _arrayReceta;
	Materiales = _arrayMateriales;
	Tiempo = _arrayReceta select 5;
	for "_idx" from 0 to (count _arrayMateriales) - 1 do {
	
	_matActual = _arrayMateriales select _idx;
	
	_tengo = [_matActual select 0] call ica_fnc_tengo;
	_deboTener = _matActual select 1;
	
			if (_multiplicador == 0) then {_multiplicador = 1};
			if(_tengo < (_deboTener * _multiplicador) ) then {
				_lista3 lbAdd format ["%2 x %1", [_matActual select 0] call ica_fnc_classToName, (_matActual select 1) * _multiplicador];
				_lista3 lbSetColor [_idx, [0.73,0.24,0.11,1]];
			} else {
				_lista3 lbAdd format ["%2 x %1", [_matActual select 0] call ica_fnc_classToName, (_matActual select 1) * _multiplicador];
				_lista3 lbSetColor [_idx, [0.2, 1, 0.2, 1]];
			};
			_lista3 lbSetPicture [_idx, [_matActual select 0] call ica_fnc_classToPic];
	};
	
	_boton buttonSetAction '
	["craft"] spawn ica_fnc_menucrafteo
	';

};


if (_param isEqualto "craft") exitWith {
	if (!isNil {fuera}) exitWith {hint "Has cancelado el ultimo crafteo... Intentalo de nuevo en el proximo aviso.";};
	disableSerialization;
	_ui = uiNamespace getVariable "Crafteo";
	_lista3 = (_ui displayCtrl 5037);
	_boton = (_ui displayCtrl 5039);
	_barrita = (_ui displayCtrl 5038);
	_arrayReceta = arrayreceta;
	_materiales = Materiales;
	_t = tiempo;
	_fuera = false;
	_multiplicador = parsenumber (ctrltext 5034);
	if (_multiplicador < 0) exitWith {hint "¿Quieres craftear algo en negativo? ¿Quieres romper el universo?"};
	if (_multiplicador > 98) exitWith {hint "Madre mia... de donde sacas tu tanto material... Vamos poquito a poquito"};
	_uni = ((arrayreceta select 4) select 1) call ica_fnc_expToLevel;
	if (((arrayreceta select 4) select 1) != "" && _uni < ((arrayreceta select 4) select 0)) exitWith {hint "Aun no sabes hacer eso..."};
	puedo = 0;
	podercraftear = false;
	
	if (_multiplicador == 0) then {_multiplicador = 1};
	
	{
	if (([_x select 0] call ica_fnc_tengo) >= (_x select 1) * _multiplicador) then {puedo = puedo + 1};
	} forEach _materiales;

	
	if (puedo isEqualto (count _materiales)) then {podercraftear = true} else {podercraftear = false};
	
	if !(podercraftear) exitWith {Hint "No tienes suficientes materiales"};
	
	if (
		!(player canAdd [((_arrayReceta select 2) select 0),(((_arrayReceta select 2) select 1) * _multiplicador)]) AND
		((((_arrayReceta select 2) select 0) call ica_fnc_item) != "Bac") AND
		((((_arrayReceta select 2) select 0) call ica_fnc_item) != "Ves")
	) exitWith {hint "No tienes suficiente espacio"};
	
	_boton ctrlEnable false;
	
	/*
	[] spawn {
	while {dialog} do {
	if (!alive player) exitWith {fuera = true;[1,"Crafteo Cancelado"] spawn ica_fnc_barrita};
	if (isNull (findDisplay 19700)) exitWith {fuera = true;[1,"Crafteo Cancelado"] spawn ica_fnc_barrita};
	};
	};
	*/
	
	/*
	_frag = (100 / _t) / 100;
	while {true} do {
		if (_t <= 0) exitWith {_barrita progressSetPosition 0};
		if (!alive player) exitWith {fuera = true};
		if (isNull (findDisplay 19700)) exitWith {fuera = true};
		_barrita progressSetPosition ((progressPosition _barrita) + _frag);
		_t = _t - 1;
		sleep 1;
	};
	
	*/
	
	("icapa7" call BIS_fnc_rscLayer) cutRsc ["barrita","PLAIN"];

	disableSerialization;
	_barra = uiNameSpace getVariable "barrita";
	_progreso = _barra displayCtrl 5010;
	_tx = _barra displayCtrl 5011;
	_texto = format ["Creando %2 de %1",[((_arrayReceta select 2) select 0)] call ica_fnc_classToName,((_arrayReceta select 2) select 1) * _multiplicador];
	_tx ctrlSetText _texto;

	_largo = ctrlPosition _progreso select 2;
	_progreso ctrlSetPosition [ctrlPosition _progreso  select 0, ctrlPosition _progreso  select 1, 0, ctrlPosition _progreso  select 3];
	_progreso ctrlCommit 0;
	_progreso ctrlSetPosition [ctrlPosition _progreso  select 0, ctrlPosition _progreso  select 1, _largo, ctrlPosition _progreso  select 3];
	_progreso ctrlCommit _t;
	
	while {_t > 0} do {
	if (!alive player) exitWith {fuera = true};
	if (isNull (findDisplay 19700)) exitWith {fuera = true};
	_t = _t - 1 ;
	sleep 1;
	};
	
	_boton ctrlEnable true;
	if (!isNil {fuera}) exitWith {fuera = nil;[1,"Crafteo Cancelado"] spawn ica_fnc_barrita};
	
	

	
	{
	[_x select 0,-(_x select 1) * _multiplicador] call ica_fnc_item
	} forEach _materiales;

	
	("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	
	//[_tiempo * _multiplicador,format ["Creando %2 de %1. Tardara %3",[((_arrayReceta select 2) select 0)] call ica_fnc_classToName,((_arrayReceta select 2) select 1) * _multiplicador,[_tiempo * _multiplicador,"MM:SS"] call bis_fnc_secondstostring]] call ica_fnc_barrita;

	[((_arrayReceta select 2) select 0),((_arrayReceta select 2) select 1) * _multiplicador] call ica_fnc_item;
	
	Hint format ["Has crafteado %2 unidades de %1",[(_arrayReceta select 2) select 0] call ica_fnc_classToName,(((_arrayReceta select 2) select 1) * _multiplicador)];
	
	_boton ctrlEnable true;

};