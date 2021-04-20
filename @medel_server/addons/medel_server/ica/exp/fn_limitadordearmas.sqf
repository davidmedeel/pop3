
/*
por: Icaruk
	call ica_fnc_limitadorDeArmas
	player addmagazines ["CUP_30Rnd_9x19_EVO", 3]; player addweapon "r3f_mp5a5";
	player addmagazines ["RH_16Rnd_9x19_cz", 3]; player addweapon "RH_cz75";
*/

if ((player getVariable "brazos") >= 50) exitWith {
	puedoDisparar = nil;
	hint "Tienes los brazos rotos, no puedes aguantar un arma";
};
if ((player getVariable "invisible")) exitWith {
	puedoDisparar = nil;
	hint "No puedes disparar siendo invisible";
};

_listaSMGs = ["rh_muzi","r3f_mp5a5","cup_evo_acr","c1987_mp7_ucp","cl987_mp7","c1987_mp7_folded2","c1987_mp7_nwu","ag_mp9_peq","ag_mp9_wcam",
"ffaa_armas_ump","ffaa_armas_sdassc","cup_bizon","pop_thomson","hlc_smg_mp510", "chakFNP90_50rnd_skin1", "chakFNP90_50rnd_skin5", "chakFNP90_50rnd_skin20", "chakFNP90_50rnd_skin23", "chakFNP90_50rnd_skin28", "chakFNP90_50rnd_skin48", "chakFNP90_50rnd_skin49", "chakFNP90_50rnd_skin52", "chakFNP90_50rnd_skin53", "chakFNP90_50rnd_skin54", "chakFNP90_57x28_B_skin1"];
_listaCarabinas = ["cup_arifle_aks74","cup_arifle_aks74u","hlc_rifle_ak12","hlc_rifle_aek971worn","cup_m1014"];
_listafusiles = ["cup_arifle_ak107","cup_arifle_akm","cup_arifle_mk16_cqc","cup_arifle_mk16_sv","cup_arifle_aks_gold","RH_Hk416c","RH_M4m","RH_M4sbr","RH_M4sbr_g","RH_M4_moe","RH_m4_des","RH_m4_tg","RH_m4_wdl","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aku12","R3F_Famas_surb_HG","R3F_Famas_G2","R3F_HK416M_HG_DES","RH_M16A4","RH_m4",
"cup_arifle_g36c","cup_arifle_l85a2","cup_arifle_cz805_b","cup_arifle_cz805_b_gl","CUP_arifle_Mk16_STD_FG", "R3F_HK417L"];
_listaFrancotiradores = ["r3f_tac50","r3f_pgm_hecate_ii","r3f_frf2_des",
"cup_srifle_m24_des_leupoldmk4lrt","pop_winchester", "srifle_LRR_F"];

_mirC = ["cha_cobradot_sight","optic_aco_grn","r3f_aimpoint_des","optic_aco_red","r3f_eotech","optic_Holosight_smg","c1987_zeiss_aim_wcam"];
_mirM = ["cha_1p78_sight","optic_hamr","optic_nvs","r3f_j4","optic_mrco","optic_arco","ffaa_optic_holografico", "RH_eotech553mag"];
_mirL = ["cha_pso_sight","optic_ams_snd","optic_ams_khk","r3f_j8_mildot_des","optic_dms","r3f_j8","r3f_nf","ffaa_optic_leopol","cup_optic_leupoldmk4_10x40_lrt_desert"];

_arma = toLower (currentWeapon player);
_visor = toLower (player weaponAccessories _arma select 2);

_lvl = "tir" call ica_fnc_expToLevel;
puedoDisparar = true;

switch (true) do {
	case (_arma in _listaSMGs): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 1) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaCarabinas): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 2) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaFusiles): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 3) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
	case (_arma in _listaFrancotiradores): {
		switch (true) do {
			case (_visor in _mirC): {
				if (_lvl >= 4) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirM): {
				if (_lvl >= 6) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
			case (_visor in _mirL): {
				if (_lvl >= 7) exitWith {};
				hint "No sabes utilizar este tipo de visor.";
				puedoDisparar = nil;
			};
		};
		if (_lvl >= 5) exitWith {};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;
	};
};

_arma spawn {
	if (isNil {esperandoCambioDeArma}) then {
		esperandoCambioDeArma = true;
		waitUntil {sleep 1; currentWeapon player != _this};
		puedoDisparar = nil;
		esperandoCambioDeArma = nil;
	};
};

_visor spawn {
	if (isNil {esperandoCambioDevisor}) then {
		esperandoCambioDevisor = true;
		waitUntil {sleep 1; player weaponAccessories currentweapon player select 2 != _this};
		puedoDisparar = nil;
		esperandoCambioDevisor = nil;
	};
};

/*
EHLA = player addEventHandler ["Fired", {
	if (armaAntigua != currentWeapon player) then {
		puedoDisparar = nil;
		if (inputAction "DefaultAction") then {
			false
		};
	};
}];

if (isNil {puedoDisparar}) then {false} else {true};

// playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _this select 0];
