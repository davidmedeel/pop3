
#include <macro.h>

/*
by: Icaruk
	["menu"] call ica_fnc_tiendaMafia;
*/

_param = param [0];

_tiendaLVL0 = [
	["Si no eres de la familia no eres bienvenido... fuera de aquí!", 0]
];
_tiendaLVL1 = [
	["----- Mascaras -----", 0],
	["H_AntmanMask", 1000 * Desc],
	["H_BobaMask", 1000 * Desc],
	["Masque_Dallas", 1000 * Desc],
	["Masque_Incendiaire", 1000 * Desc],
	["Masque_Chuck", 1000 * Desc],
	["Masque_forceAlpha", 1000 * Desc],
	["----- Ropa -----", 0],
	["TRYK_SUITS_BR_F", 2500 * Desc],
    ["TRYK_SUITS_BLK_F", 2500 * Desc],
	["TRYK_B_TRYK_OCP_D_T", 2500 * Desc],
	["TRYK_U_B_MTP_BLK_CombatUniform", 2500 * Desc],
	["TRYK_U_B_BLK_OD_Tshirt", 2500 * Desc],
	["TRYK_U_B_BLK3CD_Tshirt", 2500 * Desc],
	["TRYK_U_B_AOR2_OD_CombatUniform", 2500 * Desc],
	["TRYK_B_TRYK_3C_T", 2500 * Desc],
	["A3LJumperCIDBlack", 2500 * Desc],
	["A3LJumperCIDDigi", 2500 * Desc],
	["A3LJumperCIDGreen", 2500 * Desc],
	["A3LJumperUKBlack", 2500 * Desc],
	["A3LJumperUSBlack", 2500 * Desc],
	["TRYK_U_B_wood3c_CombatUniform", 2500 * Desc],
	["TRYK_U_B_GRYOCP_CombatUniform", 2500 * Desc],
	["TRYK_U_B_BLKTAN_CombatUniform", 2500 * Desc],
	["TRYK_U_B_Snow_CombatUniform", 2500 * Desc]
];
_tiendaLVL2 = [ // chalecos
	["----- Chalecos -----", 0],
	["V_TacVestIR_blk", 4000],
	["TRYK_V_Sheriff_BA_TB", 6000],
	["TRYK_V_Sheriff_BA_TC", 6000],
	["TRYK_V_Sheriff_BA_TB5", 6000],
	["TRYK_V_Sheriff_BA_TC5", 6000],
	["V_PlateCarrier_Kerry", 6000],
	["TAC_Ei_RRV24L_B", 6000],
	["TRYK_V_Sheriff_BA_T7", 6000],
	["TRYK_V_Sheriff_BA_T", 6000],
	["V_PlateCarrier2_rgr", 8000],
	["V_PlateCarrierSpec_rgr", 15000],
	["----- Mochilas -----", 0],
	["B_Parachute", 10000 * Desc],
	["mochila_pequena", 3000 * Desc],
	["mochila_mediana", 6000 * Desc]
];
_tiendaLVL3 = [ 
	["----- Pistolas -----", 0],
	["RH_m9", 28000],
	["RH_m9c", 28000],
	["RH_15Rnd_9x19_M9", 500 * Desc],
	["----------------------------------", 0],
	["RH_p226", 17500 * Desc],
	["RH_15Rnd_9x19_SIG", 500 * Desc],
	["----------------------------------", 0],
	["RH_kimber", 17000 * Desc],
	["RH_7Rnd_45cal_m1911", 500 * Desc],
	["----------------------------------", 0],
	["RH_fn57", 25000 * Desc],
	["RH_20Rnd_57x28_FN", 500 * Desc],
	["----------------------------------", 0],
	["RH_gsh18", 25000 * Desc],
	["RH_18Rnd_9x19_gsh", 500 * Desc],
	["----------------------------------", 0],
	["RH_g17", 19000 * Desc],
	["RH_17Rnd_9x19_g17", 500 * Desc],
	["----------------------------------", 0],
	["RH_g18", 38000 * Desc],
	["RH_19Rnd_9x19_g18", 500 * Desc],
	["RH_33Rnd_9x19_g18", 1000 * Desc],
	["----------------------------------", 0],
	["RH_mak", 20000 * Desc],
	["RH_8Rnd_9x18_Mak", 500 * Desc],
	["----------------------------------", 0],
	["RH_sw659", 18000 * Desc],
	["RH_14Rnd_9x19_sw", 500],
	["----------------------------------", 0],
	["RH_mk2", 15000 * Desc],
	["RH_10Rnd_22LR_mk2", 500 * Desc],
	["----------------------------------", 0],
	["RH_bull", 45000 * Desc],
	["RH_6Rnd_454_Mag", 500 * Desc],
	["----------------------------------", 0],
	["RH_tec9", 32000 * Desc],
	["RH_32Rnd_9x19_tec", 500 * Desc],
	["----------------------------------", 0],
	["hgun_007_SW_M10_gold", 15000 * Desc],
	["6Rnd_45ACP_Cylinder", 500 * Desc],
	["----------------------------------", 0],
	["RH_Deagleg", 42000 * Desc],
	["RH_Deagles", 42000 * Desc],
	["RH_Deaglem", 42000 * Desc],
	["RH_deagle", 42000 * Desc],
	["RH_7Rnd_50_AE", 500 * Desc],
	["optic_Yorris", 2000 * Desc],
	["----------------------------------", 0],
	["RH_vp70", 45000 * Desc],
	["RH_18Rnd_9x19_VP", 500 * Desc]
];
_tiendaLVL4 = [
	["----- Subfusiles Nº1 -----", 0],
	["RH_muzi", 50000 * Desc],
	["RH_30Rnd_9x19_UZI", 700 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp5k", 55000 * Desc],
	["hlc_30Rnd_9x19_B_MP5", 700 * Desc],
	["RH_LTdocterl", 3200 * Desc],
	["hlc_muzzle_Tundra", 3200 * Desc],
	["----------------------------------", 0],
	["pop_thomson",50000 * Desc],
	["pop_thomson_45",700 * Desc],
	["pop_thomson_9x19",700 * Desc],
	["----------------------------------", 0],
	["hlc_smg_mp510", 55000],
	["hlc_30Rnd_10mm_B_MP5", 700],
	["hlc_30Rnd_10mm_JHP_MP5", 700]
];
_tiendaLVL5 = [
	["----- Subfusiles Nº2 -----", 0],
	["C1987_MP7_ucp", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_folded2", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["C1987_MP7_nwu", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 800 * Desc],
	["----------------------------------", 0],
	["AG_MP9_peq", 75000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 800 * Desc],
	["----------------------------------", 0],
	["AG_MP9_wcam", 75000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 800 * Desc],
	["----------------------------------", 0],
	["chakFNP90_50rnd_skin1", 68000 * Desc],
	["chakFNP90_57x28_B_skin1", 800 * Desc]
];
_tiendaLVL6 = [
	["----- Vehículos -----", 0],
	["Mercedes_Pullman_negra", 830000 * Desc],
	["POP_jeep_blinde_negro", 678000 * Desc],
	["POP_jeep_blinde_negro_mate", 800000 * Desc],
	["pop_lincoln_negro", 835000 * Desc],
	["pop_Chrysler_n", 50000 * Desc],
	["pop_Chrysler_b", 50000 * Desc]
];
_tiendaLVL7 = [
	["----- Carabinas -----", 0],
	["hlc_rifle_ak12", 89000 * Desc],
	["hlc_rifle_aek971worn", 91000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 900 * Desc],
	["----------------------------------", 0],
	["R3F_Famas_surb_HG", 92000 * Desc],
	["R3F_Famas_G2", 98000 * Desc],
	["R3F_30Rnd_556x45_FAMAS", 900 * Desc],
	["R3F_30Rnd_556x45_TRACER_HK416", 1200 * Desc]
];
_tiendaLVL8 = [
	["----- Fusiles de asalto -----", 0],
	["RH_Hk416", 120000 * Desc],
	["RH_M4m", 122000 * Desc],
	["RH_M4sbr", 125000 * Desc],
	["RH_M4sbr_g", 121000 * Desc],
	["RH_M4_moe", 125000 * Desc],
	["RH_m4_des", 120000 * Desc],
	["RH_m4_tg", 121000 * Desc],
	["RH_m4_wdl", 125000 * Desc],
	["RH_30Rnd_556x45_M855A1", 900],
	["R3F_BIPIED_HK417", 20000], // Bipode
	["----------------------------------", 0],
	["hlc_rifle_aks74", 127000 * Desc],
	["hlc_rifle_aks74u", 128000 * Desc],
	["hlc_rifle_aku12", 130000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 900 * Desc],
	["----------------------------------", 0],
	["RH_M16A4", 134000 * Desc],
	["RH_30Rnd_556x45_M855A1", 900 * Desc],
	["----------------------------", 0],
	["R3F_HK417M", 150000], // HK 417
	["R3F_20Rnd_762x51_HK417", 800], // HK Mag
	["R3F_20Rnd_762x51_TRACER_HK417", 1000], // HK Mag Trazadoras
	["R3F_BIPIED_HK417", 20000], // Bipode
	["----- Accesorios -----", 0],
	["acc_flashlight"            , 10000],
	["acc_pointer_IR"            , 10000],
	["bipod_01_F_snd"            , 10000],
	["bipod_01_F_khk"            , 10000],
	["bipod_01_F_mtp"            , 10000],
	["bipod_01_F_blk"            , 10000],
	["bipod_03_F_oli"            , 10000],
	["bipod_03_F_blk"            , 10000],
	["bipod_02_F_blk"            , 10000],
	["bipod_02_F_tan"            , 10000],
	["bipod_02_F_hex"            , 10000],
	["optic_Aco"                 , 10000],
	["optic_Aco_grn"             , 10000],
	["optic_Aco_smg"             , 10000],
	["optic_Holosight_smg"       , 10000],
	["optic_Holosight_smg_blk_F" , 10000],
	["optic_Holosight"           , 10000],
	["optic_Holosight_khk_F"     , 10000],
	["optic_Holosight_blk_F"     , 10000],
	["RH_eotech553mag"    	     , 25000],
	["optic_hamr"    		     , 25000]
];

_tiendaLVLdonadores = [
	["----- Donadores -----", 0],
	["mochila_grande", 8000 * Desc],
	["pop_chaleco_carga", 6000 * Desc],
	["chakFNP90_50rnd_skin5", 60000 * Desc],
	["chakFNP90_50rnd_skin20", 60000 * Desc],
	["chakFNP90_50rnd_skin23", 60000 * Desc],
	["chakFNP90_50rnd_skin28", 60000 * Desc],
	["chakFNP90_50rnd_skin48", 60000 * Desc],
	["chakFNP90_50rnd_skin49", 60000 * Desc],
	["chakFNP90_50rnd_skin52", 60000 * Desc],
	["chakFNP90_50rnd_skin53", 60000 * Desc],
	["chakFNP90_50rnd_skin54", 60000 * Desc],
	["chakFNP90_57x28_B_skin1", 500 * Desc]
];

_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "maf" call ica_fnc_expToLevel;
	_bd = call mafia;

	if (_bd == 0)    then { _arrayTienda append _tiendaLVL0 };
	if ((_nivel >= 1) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL1 };
	if ((_nivel >= 2) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL2 };
	if ((_nivel >= 3) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL3 };
	if ((_nivel >= 4) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL4 };
	if ((_nivel >= 5) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL5 };
	if ((_nivel >= 5) and !(_bd == 0) and (license_civ_donator)) then { _arrayTienda append _tiendaLVLdonadores };
	if ((_nivel >= 6) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL6 };
	if ((_nivel >= 7) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL7 };
	if ((_nivel >= 8) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL8 };
	//if (license_civ_donator) then { _arrayTienda append _tiendaLVLdonadores };

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


	// _lista lbSetCurSel 0;
};

if (_param isEqualTo "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaMafia;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	private "_fuera";
	if (_cosa isEqualto "Si no eres de la familia no eres bienvenido... fuera de aquí!") exitWith {hint "¿Que intentas comprar? Ya te he dicho que te largues.";closeDialog 0;};
	if (_precio > medel_din) exitWith {hint "No tienes suficiente dinero."; };

	/* // va raro
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; _fuera = true; };
	};
	if (!isNil {_fuera}) exitWith {};
	*/

	medel_din = medel_din - _precio;

	if (getNumber (configFile >> "CfgVehicles" >> _cosa >> "maxspeed") > 0) then {
		private "_mrk";
		_mrk = ["mrkmafia1","mrkmafia1_1", "mrkmafia2", "mrkmafia3", "mrkmafia4", "mrkmafia5", "mrkmafia6", "mrkmafia1_2"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil {_veh}};
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
		_veh setVariable ["matricula", call ica_fnc_creaMatricula, true];

		life_vehicles pushBack _veh;
		[getPlayerUID player,playerSide, _veh, 1] remoteexeccall ["TON_fnc_keyManagement",2];
		[(getPlayerUID player),playerSide, _veh, 0] remoteexeccall ["TON_fnc_vehicleCreate",2];
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
	} else {
		[_cosa] call ica_fnc_item;
	};

	hint parsetext format["<t color='#ffffff' size='2'>PoP Life</t><br/><br/><img shadown='false' size='6' image=''/><br/><br/>Has comprado %2 por %1€", _precio, [_cosa] call ica_fnc_classToName];
	[format ["- %1€", _precio]] call ica_fnc_infolog;
	[format ["+ 1 %1", [_cosa] call ica_fnc_classToName]] call ica_fnc_infolog;
	if (_cosa isEqualTo "A3L_SuicideVest") then {[] spawn life_fnc_comprarChalecoBomba};
	["Money Log",format [
	"%1 - (%2) ha comprado %6 por %3  - Dinero en banco : %4 - Dinero en mano %5 (Tienda mafia)",
	profileName,
	(getPlayerUID player),
	_precio,
	medel_atmdin,
	medel_din,
	_cosa
	]
	] remoteexeccall ["ica_fnc_customlog",2];
};
