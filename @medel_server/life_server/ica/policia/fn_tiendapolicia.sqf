
/*
by: Icaruk
	["menu"] call ica_fnc_tiendaPolicia;
*/

_param = param [0];

if (playerSide != WEST) exitWith {hint "No veo tu placa, ¡fuera de aqui!"};
_tiendaLVL0 = [
	["No eres policía, ¿qué haces aquí?", 0]
];

_tiendaComun = [
	["----- Equipamiento Básico -----", 0],
	["Taser_26",1000],
	["26_cartridge",50],
	["Orel_Matraque",500],
	["pop_linterna",500],
	["Binocular",500]
];

_tiendaLVL1 = [
	["----- Recluta/Cadete -----", 0],
	["RH_SFM952V", 500],
	["RH_X300",500],
	["RH_M6X",500],
	["----------------------------", 0],
	["RH_m9", 2000], // Beretta M9
	["RH_15Rnd_9x19_M9", 50], // Beretta M9 Mag
	["----------------------------", 0],
	["RH_g17", 2000], // Glock 17
	["RH_17Rnd_9x19_g17", 50], // Glock 17 Mag
	["----------------------------", 0],
	["RH_cz75", 2000], // CZ 75
	["RH_16Rnd_9x19_CZ", 50] // CZ 75 Mag
];

_tiendaLVL2 = [
	["----- CNP/GC -----", 0],
	["POP_BandaClavos_i",50], // Banda de Clavos
	["----------------------------", 0],
	["RH_SFM952V", 500],
	["RH_X300", 500],
	["RH_M6X", 500],
	["----------------------------", 0],
	["RH_bullb", 2000], // Taurus
	["RH_6Rnd_454_Mag", 50], // Taurus Mag
	["----------------------------", 0],
	["RH_fn57", 2000], // FN Five-Seven
	["RH_20Rnd_57x28_FN", 50], // FN Five-Seven Mag
	["----------------------------", 0],
	["RH_fnp45", 2000], // FNP45 Tactical
	["RH_15Rnd_45cal_fnp", 50], // FNP45 Tactical Mag
	["----------------------------", 0],
	["RH_g19", 2000], // Glock 19
	["RH_19Rnd_9x19_g18", 50], // Glock 18 Mag
	["----------------------------", 0],
	["RH_gsh18", 2000], // Glock 19
	["RH_18Rnd_9x19_gsh", 50], // Glock 18 Mag
	["----------------------------", 0],
	["RH_uspm", 2000], // USP40 Match
	["RH_16Rnd_40cal_usp", 50], // USP40 Match Mag
	["----------------------------", 0],
	["RH_sw659", 2000], // SW 659
	["RH_14Rnd_9x19_sw", 50], // SW 659 Mag
	["----------------------------", 0],
	["RH_m9", 2000], // Beretta M9
	["RH_15Rnd_9x19_M9", 50], // Beretta M9 Mag
	["----------------------------", 0],
	["RH_g17", 2000], // Glock 17
	["RH_17Rnd_9x19_g17", 50], // Glock 17 Mag
	["----------------------------", 0],
	["RH_cz75", 2000], // CZ 75
	["RH_16Rnd_9x19_CZ", 50], // CZ 75 Mag
	["----------------------------", 0],
	["RH_p226", 2000], // Sig P226
	["RH_15Rnd_9x19_SIG", 50] // Sig P226 Mag
];

_tiendaLVL3 = [
	["----- Agrupación de Tráfico -----", 0],
	["pop_tetrapodo_i",50],
	["pop_tetrapodo_x3_i",50],
	["pop_tetrapodo_x5_i",50],
	["pop_tetrapodo_x7_i",50],
	["POP_banda_i",50],
	["POP_electroflare_i",50],
	["POP_senal_alcoholemiagc_i",50],
	["POP_senal_control_policia_i",50],
	["POP_senal_izquierda_i",50],
	["POP_senal_derecha_i",50],
	["POP_senal_stop_i",50],
	["POP_senal_estrechamiento_i",50],
	["POP_senal_velocidad20_i",50],
	["POP_senal_velocidad40_i",50],
	["POP_BandaClavos_i",50]
];

_tiendaLVL4 = [
	["----- Subfusiles -----", 0],
	["RH_barska_rds", 1500], // Barska
	["----------------------------", 0],
	["hlc_smg_mp510", 4000], // HK MP5/10
	["hlc_30Rnd_10mm_B_MP5", 250], // HK MP5/10 Ball Mag
	["hlc_30Rnd_10mm_JHP_MP5", 250], // HK MP5/10 Hydra-Shok Mag
	["----------------------------", 0],
	["hlc_smg_mp5a3", 4000], // HK MP5A3
	["hlc_30Rnd_9x19_B_MP5", 250], // HK MP5A3 Ball Mag
	["hlc_30Rnd_9x19_SD_MP5", 250], // HK MP5A3 Subsonic Mag
	["----------------------------", 0],
	["C1987_MP7", 4000], // MP7 Grip Folded
	["C1987_40Rnd_46x30_mp7", 250], // MP7 Mag
	["----------------------------", 0],
	["chakFNP90_50rnd_skin28",4000],
	["chakFNP90_57x28_B_skin1",250],
	["RH_eotech553", 1000] // Eotech 553
];

_tiendaLVL5 = [
	["----- Fusiles -----", 0],
	["optic_Hamr", 1500], // RCO
	["----------------------------", 0],
	["RH_sbr9", 10000], // SBR9 (M4 Recortada)
	["RH_32Rnd_9mm_M822", 500], // SBR9 Mag
	["----------------------------", 0],
	["RH_M4sbr_b", 10000], // Vitor SBR (M4)
	["RH_30Rnd_556x45_M855A1", 500], // Vitor SBR Mag
	["----- Acuatica -----", 0],
	["arifle_SDAR_F", 7000], // SDAR (Acuatica)
	["30Rnd_556x45_Stanag", 500] // SDAR Mag
];

_tiendaLVL6 = [
	["----- Equipamiento UDEV -----", 0],
	["TRYK_U_B_BLK_T_BK", 1000],
	["TRYK_U_B_Denim_T_BK", 1000],
	["TRYK_U_denim_jersey_blk", 1000],
	["TRYK_U_denim_hood_blk", 1000],
	["TRYK_U_B_Denim_T_WH", 1000],
	["TRYK_U_denim_jersey_blu", 1000],
	["LOGOPOP_Pop", 1000],
	["CHAQUETANEGRA_Pop", 1000],
	["CHAQUETAMARRON_Pop", 1000],
	["CHAQUETAROJA_Pop", 1000],
	["CHAQUETAAZUL_Pop", 1000],
	["CHAQUETALEOPARDO_Pop", 1000],
	["U_C_Travello1", 1000],
	["TRYK_shirts_DENIM_WH_Sleeve", 1000],
	["pop_gorra_lakers", 50],
	["pop_mexicano", 50],
	["pop_cowboy_brown", 50],
	["TRYK_R_CAP_BLK", 50]
];

_tiendaLVL7 = [
	["----- Equipamiento GEO -----", 0],
	["SUPER_flash", 500], // Flashbang
	["SmokeShell", 500], // Humo
	["SmokeShellBlue", 500], // Humo Azúl
	["RH_accupoint", 1500], // Trijicon
	["optic_Hamr", 1500], // RCO
	["RH_barska_rds", 1500], // Barska
	["RH_eotech553mag", 1500], // Eotech X3
	["RH_leu_mk4", 1500], // Leupold
	["optic_DMS", 1500], // DMS
	["----- Escudo GEO -----", 0],
	["CSW_FN57_Ballistic_Shield", 4000], // Five Seven (Escudo GEO)
	["RH_20Rnd_57x28_FN", 50], // FN Five-Seven Mag
	["CSW_FN57_Shield_P", 2000], // Escudo GEO
	["----- Acuatica GEO -----", 0],
	["arifle_SDAR_F", 7000], // SDAR (Acuatica)
	["30Rnd_556x45_Stanag", 500], // SDAR Mag
	["----- Subfusiles GEO -----", 0],
	["hlc_smg_mp510", 4000], // HK MP5/10
	["hlc_30Rnd_10mm_B_MP5", 250], // HK MP5/10 Ball Mag
	["hlc_30Rnd_10mm_JHP_MP5", 250], // HK MP5/10 Hydra-Shok Mag
	["----------------------------", 0],
	["hlc_smg_mp5a3", 4000], // HK MP5A3
	["hlc_30Rnd_9x19_B_MP5", 250], // HK MP5A3 Ball Mag
	["hlc_30Rnd_9x19_SD_MP5", 250], // HK MP5A3 Subsonic Mag
	["----------------------------", 0],
	["C1987_MP7", 4000], // MP7 Grip Folded
	["C1987_40Rnd_46x30_mp7", 250], // MP7 Mag
	["C1987_o_suppressor", 1000], // MP7 Silenciador
	["----- Fusiles GEO -----", 0],
	["RH_M4_ris_m", 10000], // M4A1
	["RH_30Rnd_556x45_M855A1", 500], // M4A1 Mag
	["RH_qdss_nt4", 1000], // M4A1 Silenciador
	["RH_HBLM", 1500], // M4A1 Bipode
	["----------------------------", 0],
	["RH_sbr9", 10000], // SBR9 (M4 Recortada)
	["RH_32Rnd_9mm_M822", 250], // SBR9 Mag
	["----------------------------", 0],
	["RH_M4sbr_b", 10000], // Vitor SBR (M4)
	["RH_30Rnd_556x45_M855A1", 500], // Vitor SBR Mag
	["----------------------------", 0],
	["R3F_Famas_G2_HG", 10000], // FAMAS
	["R3F_30Rnd_556x45_FAMAS", 500], // FAMAS Mag
	["R3F_SILENCIEUX_FAMAS", 1000], // FAMAS Silenciador
	["R3F_LAMPE_SURB", 700], // FAMAS Linterna
	["----------------------------", 0],
	["RH_SAMR", 10000], // SAM-R
	["RH_30Rnd_556x45_Mk262", 500], // SAM-R Mag
	["----------------------------", 0],
	["RH_hb_b", 10000], // Honey Badger
	["RH_30Rnd_762x35_FMJ", 500], // Honey Badger Mag
	["RH_hbsd", 1000], // Honey Badger Silenciador
	["----------------------------", 0],
	["srifle_LRR_F", 15000], // M320
	["7Rnd_408_Mag", 500], // M320 Mag
	["optic_LRPS", 500], // MPLD
	["----------------------------", 0],
	["R3F_HK417L", 15000], // HK 417
	["R3F_20Rnd_762x51_HK417", 500], // HK Mag
	["R3F_20Rnd_762x51_TRACER_HK417", 500], // HK Mag Trazadoras
	["optic_LRPS", 500], // MPLD
	["R3F_SILENCIEUX_HK417", 500], // Silenciador
	["R3F_BIPIED_HK417", 500] // Bipode
];

_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	ctrlSetText [5005, "\pop_iconos\paa\tiendaPolicia.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call life_coplevel;

	if (_nivel >= 1) then {
		_arrayTienda append _tiendaComun;
	};

	switch (_nivel) do {
		case 0: {
			_arrayTienda append _tiendaLVL0;
		};
		case 1: {
			_arrayTienda append _tiendaLVL1;
		};
		case 2: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
		};
		case 3: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
		};
		case 4: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
		};
		case 5: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
		};
		case 6: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
		};
		case 7: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaLVL7;
		};
		case 8: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaLVL7;
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
