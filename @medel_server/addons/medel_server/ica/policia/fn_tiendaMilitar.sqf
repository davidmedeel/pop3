
/*
by: Medel
	["menu"] call ica_fnc_tiendaMilitar;
*/

_param = param [0];

if (playerSide != WEST) exitWith {hint "No veo tu placa, ¡fuera de aqui!"};
_tiendaLVL0 = [
	["No eres Militar, ¿qué haces aquí?", 0]
];

_tiendaLVL1 = [
	["----- Equipamiento Militar -----", 0],
	["SUPER_flash", 100], // Flashbang
	["SmokeShell", 100], // Humo
	["SmokeShellBlue", 100], // Humo Azúl
	["ffaa_acc_puntero_ir", 1500], // punto rojo
	["optic_Hamr", 1500], // 
	["RH_barska_rds", 1500], // 
	["RH_eotech553mag", 1500], // 
	["RH_leu_mk4", 1500], // 
	["----- Pistolas Militares -----", 0],
	["RH_m9", 2000], // Beretta M9
	["RH_15Rnd_9x19_M9", 50], // Beretta M9 Mag
	["ffaa_armas_p226", 1500], // sig sauer p226
	["ffaa_armas_usp", 1500], // hk usp
	["ffaa_armas_fnp9", 1500], // fnp9
	["ffaa_9x19_pistola", 100], //  cargador
	["muzzle_snds_L", 1500], // silenciador 
	["----- Fusiles Militares -----", 0],
	["ffaa_armas_hkg36e_normal", 10000], // G36E
	["ffaa_armas_hkg36e", 1000], // G36E (EMPUÑADURA)
	["ffaa_armas_hkg36k_normal", 1000], // G36K
	["ffaa_armas_hkg36e", 1000], // G36k (empuñadura)
	["ffaa_556x45_g36", 100], // G36E MAG
	["RH_fa556", 100], // G36E SILENCIADOR
	["RH_reflex", 100], // G36E MIRA
	["ffaa_bipod_G36", 100], // G36E BIPODE
	["----- SubFusiles Militares -----", 0],
	["ffaa_armas_hkmp510a3", 10000], // HK MP5 SD6
	["ffaa_9x19_mp5", 100], // HK MP5 SD6 MAG
	["RH_reflex", 100], // G36E MIRA
	["----- Francotiradores Militares -----", 0],
	["ffaa_armas_aw", 10000], // franco
	["ffaa_optic_5x25x56", 100], // franco mag 
	["ffaa_762x51_accuracy", 100], // franco mira
	["ffaa_optic_Mk4_v2", 100], // franco mira 
	["----------------------------", 0],
	["ffaa_armas_m95", 10000], // franco
	["ffaa_127x99_ap", 100], // franco mag
	["----------------------------", 0],
	["ffaa_armas_aw50", 10000], // franco
	["ffaa_127x99_ap", 100] // franco mag
];

_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	ctrlSetText [5005, "medel\imagenes\tiendaMilitar.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call life_coplevel;

	switch (_nivel) do {
		case 0: {
			_arrayTienda append _tiendaLVL0;
		};
		case 1: {
			_arrayTienda append _tiendaLVL0;
		};
		case 2: {
			_arrayTienda append _tiendaLVL0;
		};
		case 3: {
			_arrayTienda append _tiendaLVL0;
		};
		case 4: {
			_arrayTienda append _tiendaLVL0;
		};
		case 5: {
			_arrayTienda append _tiendaLVL0;
		};
		case 6: {
			_arrayTienda append _tiendaLVL0;
		};
		case 7: {
			_arrayTienda append _tiendaLVL0;
		};
		case 8: {
			_arrayTienda append _tiendaLVL1;
		};
	};

	private ["_nom", "_pre"];
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {

		// Hallo su nombre visual
		_nom = [_arrayTienda select _idx select 0] call ica_fnc_classToName;
		_pic = [_arrayTienda select _idx select 0] call ica_fnc_classToPic;

		// Hallo su precio
		_precio = (_arrayTienda select _idx select 1); // pillo el precio
		if (_precio != 0) then { // si es 0, es un espaciador
			_pre = format ["(%1€)", ([_precio, 3] call ica_fnc_numToStr)];
		} else {_pre = ""; };

		// Creo cada elemento de la lista
		_lista lbAdd format ["%1 %2", _nom, _pre];
		_lista lbSetPicture [_idx, _pic];
		_lista lbSetData [_idx, (_arrayTienda select _idx select 0)];
		_lista lbSetValue [_idx, (_arrayTienda select _idx select 1)];
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};
};

if (_param isEqualTo "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaPolicia;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = param [1];
	_precio = param [2];

	if (_precio > medel_din) exitWith {hint "No hay nada gratis."; };
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; fuera = true; };
	};
	if (!isNil {fuera}) exitWith {fuera = nil};

	medel_din = medel_din - _precio;
	if (isNil {medel_din}) then {medel_din = 0};

	if (isClass (configFile >> "CfgVehicles" >> _cosa)) then {
		private "_mrk"; // ¿qué marcador tengo más cerca?
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[_veh,1] remoteexeccall ["life_fnc_colorVehicle",-2];
		[_veh] call life_fnc_clearVehicleAmmo;
		[_veh,"trunk_in_use",false,true] remoteexeccall ["TON_fnc_setObjVar",2];
		[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteexeccall ["TON_fnc_setObjVar",2];
		_veh disableTIEquipment true;
		_veh allowDamage true;

		life_vehicles pushBack _veh;
		[getPlayerUID player,playerSide, _veh, 1] remoteexeccall ["TON_fnc_keyManagement",2];
		[(getPlayerUID player),playerSide, _veh, 0] remoteexeccall ["TON_fnc_vehicleCreate",2];
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
		hint parsetext format["<t color='#ffffff' size='2'>PoP Life</t><br/><br/><img shadown='false' size='6' image=''/><br/><br/>Has comprado %2 por %1€", _precio, [_cosa] call ica_fnc_classToName];
	    [format ["- %1€", _precio]] call ica_fnc_infolog;
	    [format ["+ 1 %1", [_cosa] call ica_fnc_classToName]] call ica_fnc_infolog;
	} else {
		[_cosa] call ica_fnc_item;
	};
};