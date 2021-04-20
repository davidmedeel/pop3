
#include <macro.h>

private ["_shop", "_return"];

_shop = [_this, 0, "", [""]] call BIS_fnc_param;
if (_shop == "") exitWith { []};
_return = [];
switch (_shop) do {
	case "dezzie_car": {
		_return = [
			["shounka_f430_spider_gris", 1500000],	
			["458_civ", 1165000],
			["A45lu_civ_civilgris", 795000],
			["POP_Ferrari_Enzo_rojo", 1800000],
			["pop_laferrari_D",1500000],			
			["f12lu_civ", 1165000],
			["FFlu_civ", 1165000],
			["V250_noir", 105000],
			["Warrior_gris", 295000],
			["GT3lu_civ_noir", 1195000],	
			["pop_mustang_GT15_gris", 353000],	
			["pop_porsche911", 1100000],	
			["pop_LamborghiniVeneno_gris", 1500000],		
			["pop_LamborghiniVeneno_grafiti3", 1800000],
			["pop_megane_GT_1", 1500000],
			["quiet_Bugatti_blanche_f",1500000],
		    ["mrshounka_huracan_c_rose", 1500000],
			["pop_mp4", 1500000],
			["pop_agera_p", 1200000],
			["pop_panamera_naranja", 1200000],
			["pop_gt_noir", 1200000],
			["pop_pagani_c", 1200000],
			["pop_lykan_Hypersport_violeta", 1200000],
			["pop_bmw_1series", 220000],
			["tal_maserati_pink", 600000],
			["Jonzie_Quattroporte", 1000000],
			["Quiet_v2_r8plus_rouge_f",750000],
			["IVORY_R8",650000],
			["ADM_Monte_Carlo", 750000],
		    ["ivory_gt500",290000],
		    ["ivory_lfa",1250000],
			["ivory_lp560",1250000],
			["ivory_c",750000],
			["shounka_limo_civ_orange",500001],
			["Jonzie_Viper", 1100000],
			["pop_ford_gt402", 600000],
			["pop_amg_GT_rojo", 600000],
			["pop_furai", 800000],
			["pop_mp1_D", 800000],
			["pop_chevrolet_azul", 650005],
			["pop_zonda_s1", 700000],
			["pop_r8MP_4", 700000],
			["pop_mono", 700000],
			["pop_Caterham_2", 700000],
			["pop_GT3", 600000],
			["pop_lola_1", 600000]	
		];
	};
	case "kart_shop": {
		_return = [
			["C_Kart_01_Blu_F", 45000],
			["C_Kart_01_Fuel_F", 45000]
		];
	};
	case "taxista_shop": {
		_return = [
			["POP_Opel_Insignia_taxi", 30000],
			["pop_peugeot508_taxi_civ", 30000]
		];
	};
	case "periodista_shop": {
		_return = [
			["Speed_Touareg_kr_tv", 20000],
			["pop_sprinter_poptv2", 25000],
			["pop_sprinter_poptv1", 25000],
			["pop_nissan_qashqai_2016_poptv1", 20000],
			["gazelle_civil_3", 35000],
			["ec135_popnews_F", 45000],
			["pop_nissan_qashqai_2016_poptv2", 20000]
		];
	};
	case "med_shop": {
		_return = [
			["pop_ford_transit_amb1", 2500],
			["pop_renault_master_amb1", 2500],
			["pop_sprinter_corta_amb1", 2500],
			["pop_sprinter_amb1", 2500],
			["pop_sprinter_caja_amb1", 2500],
			["pop_sprinter_2016_amb1", 2500],
			["pop_mitsubishi_asx_ems1", 2500],		
			["pop_fiat_bravo_ems1", 2500],
			["POP_corbillard_c_noir", 2500],
			["pop_grua", 2500],
			["mercedes_atego_bomberos_ingame", 2500],
			["ec135_ems_F", 2500],
			["gazelle_civil_4", 2500]
		];
	};
	case "med_air_hs": {
		_return = [
			["ec135_ems_F", 2500],
			["gazelle_civil_4", 2500]
		];
	};
	case "exo_car": {
		_return = [
			["458_civ", 1165000],
	        ["ivory_wrx",350000],
            ["IVORY_R8SPYDER",500000],
			["pop_chevrolet_camaro_azul", 650005],
			["pop_bmwm6_gris", 250000],		
			["pop_bmwm4_D", 241000],			
			["pop_nissan_skyline", 175000],
			["pop_nissan_silvia", 325000],
			["pop_c63_2015_rose_t", 325000],
			["pop_c63_2015_rose", 290000],
			["Quiet_1969charger_bleu_f", 250000],
			["Quiet_dodge_15_rouge_f", 250000],
			["pop_mercedes_190_p_civ", 140000],
			["shounka_a3_rs5_civ_noir", 200000],
			["pop_a3_308_rcz_bleufonce", 68000],
			["pop_subaru08_amarillo", 69000],
			["pop_clk_jaune", 250000],
			["pop_toyota_gt86_Blanco", 211000],
			["pop_cayenne_p_naranja", 295000],
			["pop_dodge15_civ_rosa_t", 225000],
			["pop_gtr_azul", 295000],
			["pop_lincoln_rojo", 205000],
			["pop_mustang_naranja", 240000],
			["quiet_Ford_shelbyGT500_rouge_f", 245000],
			["pop_transam_orange", 295000],
			["pop_hotrod_civ", 345000],	
			["pop_rs4_civ_azul", 195000],			
			["Jonzie_30CSL", 155000],
			["ADM_1964_Impala", 395000],
			["ADM_1969_Camaro", 395000],
			["ADM_1969_Charger", 395000],
			["Jonzie_Datsun_Z432", 225000],
			["Jonzie_STI", 350000],
			["PKE_92_civ_bleufonce", 440000],
			["pop_evox_bleufonce", 110000],
			["pop_300c_r", 410000],		
			["pop_MustangMach1Jet1969", 423000],
			["pop_BMW750il_r", 380000],
			["pop_Chrysler_r", 500000],
			["pop_caymanS_z_noir", 500000],
			["pop_lotus_GTE", 500000],
			["pop_afla_4C_azul", 500000],
			["pop_370Z_rojo", 209000],
			["pop_MaybachLaundet57", 500000],
			["pop_chevroletc7_amarillo", 420000],
			["pop_regera_azul", 430000],
			["pop_bmw507_d3", 440000],
			["pop_lambo_miura_d", 500000],
			["pop_bmw8_rojo", 500000],
			["pop_m300sl1", 470000],
			["pop_Viper_08_n",500000],
			["pop_RollsRoyce011_b",700000],
			["pop_NissanGTR_n",362000],
			["pop_Charger_12_r",361000],
			["pop_porche918", 533000],
			["POP_veneno_azul", 502000],
			["pop_opel_insignia_gris", 191000],
			["pop_toyota_camry_gris", 197000]
		];
	};

    case "bus": {
		_return = [
			["pop_bus_p_grise", 60000]
		];
	};
	case "moto_chop": {
		_return = [
			["shounka_harley_a3", 5000],
			["pop_moto_sidecar", 5000],
			["pop_moto_1_azul", 5000],
			["pop_honda_bizz_Roja", 5000],
			["pop_bmw_1200_rt_azul", 5000],
			["pop_yamaha_xt660r_azul", 5000],
			["pop_yamaha_p", 26000]
		];
	};

	case "dodge_car": {
		_return = [
			["pop_hummer_civ", 415000],
			["pop_h2_violet", 425000],
			["pop_HummerH2_a", 435000],
			["pop_HummerH1", 435000],				
			["pop_Suburban2015_r", 350000],
			["pop_nissan_pathfinder", 425000],
			["pop_ranger_rover", 375000],
			["pop_avalanche_violeta", 445000],
			["pop_monsteur_gris", 530000],
			["POP_jeep_blinde_rojo", 678000],
			["POP_Landrover_Defender", 275000],
			["Quiet_ford_raptor_bleu_f", 425000],
			["Quiet_c65amg_blanche_f", 500000],
			["pop_raptor_naranja", 415000],
			["pop_UAZ_Patriot_negro", 315000],
			["pop_cherokee_negro_violeta", 205000],
			["POP_Qashqai_rosado", 85000],
			["Quiet_Cadillac_noir_f", 295000],
			["quiet_sub2015_rouge_f", 295000],			
			["pop_smart_supercharge_civ_azul", 105000],
			["shounka_buggy_grise", 245000],
			["pop_a3_audiq7_bleu", 206000],
			["pop_FordTransiSupervan_civ_violeta", 260000],
			["pop_mitsubishi_asx_gris", 243000],			
			["pop_nissan_qashqai_2016_azul", 232000],
			["pop_mitsubishi_montero_blanco", 242000],
			["pop_land_rover_freelander_azul", 245000],
			["pop_nissan_patrol_azul", 246000],
			["pop_nissan_patrol_corto", 85000],
			["pop_toyota_prado_rojo", 244000],
			["pop_JeepWrangler_b", 105000],
			["pop_volvo2", 130000],
			["pop_dacia_naranja", 150000],
			["pop_hyundai_x352", 150000],
			["pop_rover_evo_amarillo", 155000],
			["pop_GMCSerriaLarge_r", 185000], // 240 510
			["pop_toyota_FJCruiser3", 235000],
			["pop_lexus_gx4602", 235000], // 250km f 309
			["pop_jeep_grandcherokee3", 495000],		
			["pop_Youkun2015_b", 212000], // 250 510
			["pop_landcruiser", 242000], // 250 510
			["pop_AudiQ7_r", 215000], // 250 510
			["pop_13G65_r", 215000], // 250 510
			["pop_F350_r", 215000], // 250 510
			["pop_F150_r", 245000], // 250 510 
			["pop_Explorer_r", 215000], // 250 510
			["pop_MercedesBenz6x6_r", 215000], // 250 590
			["pop_S331_r", 195000], // 260 510
			["pop_bmw_x52", 215000],    // 285 350
			["pop_hyundai_veloster2", 165000],
			["pop_tahoe_r", 215000], // 331 350
			["pop_escalade", 215000], // 173km 310 900 maletero
			["pop_insurgent_v1", 1110000],
			["pop_insurgent_vELN", 1110000],
			["pop_InsurgentCivil", 1045000]
		];
	};

	case "civ_car": {
		_return = [
			["chcitan_civ", 45000],
			["POP_207_naranja", 25000],
			//["pop_renault_megane", 35000],
			["pop_golfvi_violet", 28000],
			["pop_astra_RS", 28000],
			["pop_seat_ibiza_blanco", 22000],
			["pop_ford_focusrs_negro", 28000],
			["pop_308_azul", 28000],
			["pop_twingo_p", 15000],
			["pop_Alfa_Romeo_Naranga", 25000],
			["pop_alfa_romeo_159_azul", 18000],			
			["pop_c4_p_rojo", 25000],
			["pop_c4_picasso_p_rojo", 25000],			
			["pop_ds3_negro", 25000],
			["pop_ds4_naranja", 25000],
			["pop_r5_violeta", 25000],
			["pop_rs_gris", 25000],
			["pop_rs4_civ_azul", 20000],
			["pop_rs6_violeta", 45000],
			["POP_smart_rojo", 25000],
			["pop_peugeot508_civ", 30000],
			["Jonzie_Mini_Cooper_R_spec", 45000],
			["Jonzie_Mini_Cooper", 30000],
			["Jonzie_Corolla", 25000],
			["Jonzie_Datsun_510", 25000],
			["Jonzie_Ceed", 25000],
			["IVORY_PRIUS", 42000],
			["pop_clio_civ_orange", 25000],
			["pop_peugeot_406_gris", 25000],
			["pop_citroen_c4_picasso_gris", 30000],
			["pop_citroen_c4_picasso_2016_azul", 30000],
			["pop_ford_mondeo_gris", 30000],
			["pop_ford_mondeo_azul", 30000],
			["pop_ford_mondeo_negro", 30000],
			["pop_ford_mondeo_blanco", 30000],
			["pop_ford_mondeo_rojo", 30000],
			["pop_citroen_xsara_picasso_azul", 50000],
			["pop_peugeot_407_azul", 30000],
			["pop_fiat_bravo_rojo", 30000],
			["pop_seat_leon_rojo", 33000],
			["pop_AudiA1_blanco", 55000],
			["pop_Caprice1968_r", 50000],
			["pop_69Charger_r", 52000],
			["pop_opel_astra_h_gris", 30000],
			["pop_opel_astra_j_gris", 52000]
		];
	};
	case "skate_shop": {
		_return = [];
	};
	case "tienda_trasporte": {
		_return = [
			["POP_renaultmagnum1_f", 400000],
			["pop_Man_TGXsin_negro", 160000],
			["pop_volvo_camion_sin", 100000]
		];
	};
	case "civ_truck": {
		_return = [
			["POP_renaultmagnum_f", 400000],
			["pop_Vandura_civ_equipoa", 150000],
			["pop_Man_TGX_negro", 350000],
			["tw_raptor_black", 205000],
			["pop_volvo_camion", 460000],
			["Jonzie_Transit", 150000],
			["pop_nemo", 150000],
			["ADM_Ford_F100", 55000],
			["pop_iveco_f", 350000],
			["C_Van_01_fuel_F", 50000],
			["Volvo_Cisterna_1", 100000],
			["pop_mercedes_benz_vito_gris", 70000],
			["pop_dafxf_euro6_gris", 400000],			
			["pop_ford_transit_gris", 285000],
			["pop_sprinter_2016_gris", 285000],			
			["pop_sprinter_gris", 320000],
			["pop_mercedes_vito", 320000],
			["pop_renault_master", 200000],
			["pop_Vandura_civ_gris", 400000],
			["shounka_a3_spr_civ_grise", 405000],
			["midlum_red", 300000],
			["pop_scania_r6202", 450000],
			["shounka_ivceco_grise", 470000],
			["pop_opel_vivaro_negro", 282500],
			["dikeman_haulier2", 530000]
		];
	};
	case "med_ship": {
		_return = [
			["POP_Lancha_EMS", 10000],
			["O_Lifeboat", 2500],
			["C_Boat_Civil_01_rescue_F", 2500]

		];
	};
		case "cop_car": {
		_return = [
			["c4_picasso_16_cnp", 5000],
			["c4_picasso_08_cnp", 5000],
			["nissan_qashqai_2016_cnp", 5000],
			["nissan_xtrail_cnp", 5000],
			["peugeot_expert_cnp", 5000],
			["altea_xl_cnp", 5000],
			["ford_kuga_cnp", 5000],
			["toyota_prius_cnp", 5000],
			["alfa_romeo_159_ATGC", 5000],
			["citroen_c5_ATGC", 5000],
			["ford_mondeo_2016_atgc", 5000],
			["ford_mondeo_2016_atgc2", 5000],
			["mercedes_sprinter_corta_gc", 5000],
			["nissan_pathfinder_gc", 5000],
			["peugeot_308_gc", 5000],
			["ford_kuga_gc", 5000],
			["toyota_prado_atgc", 5000],
			["nissan_xtrail_2015_gc", 5000],
			["toyota_prado_gc", 5000],
			["toyota_prado_gar", 5000],
			["nissan_pathfinder_gar", 5000],
			["POP_Mercedes_Sprinter_gc", 5000],
			["renault_trafic_ATGC", 5000],
			["nissan_pathfinder_atgc", 5000],
			["pop_a3_audiq7_camuflado", 5000],
			["pop_c63_2015_camuflado", 5000],
			["pop_mitsubishi_asx_camuflado", 5000],
			["pop_peugeot_406_camuflado", 5000],
			["pop_land_rover_freelander_camuflado", 5000],
			["pop_hummer_geo_camuflado", 5000],
			["MrShounka_Suburban_2017_GIGN_haras_f", 5000],
			["Vamtac_GEO_Asalto", 5000],
			["Vamtac_Policia", 5000],
			["Vamtac_GEO",5000],
			["cnp_Iveco_UIP",5000],
			["cnp_Iveco_GOIT",5000],
			["UR_416_Cargo",5000],
			["ffaa_gc_lince_m2", 5000],
			["ffaa_gc_vamtac", 5000],
			["pop_vamtac_cnp", 5000],
			["cnp_quadbike",5000]
		];
	};
	case "civ_air": {
		_return = [
			["pop_heli_Light_01_blue_F", 300000],
			["pop_heli_Light_01_red_F", 300000],
			["ivory_b206", 700000],
			["ec135_civil_rojo", 600000],
			["ec135_civil_Negro", 600000],
			["pop_cessna_1", 100000],
			["gazelle_civil_2", 400000],
			["frogger_civil_1", 500000],
			["frogger_civil_3", 500000],
			["frogger_civil_2", 500000]
		];
	};
	case "cop_air": {
		_return = [
			["ec135_policia_f", 5000],
			["ec135_guardiacivil_F", 5000],
			["bo_105_policia_F", 5000],
			["bo_105_guardiacivil_F", 5000]
		];
	};
	case "militar": {
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["SAS_AH99_W", 5000],
				["ffaa_famet_ch47_mg", 5000],
				["ffaa_famet_cougar", 5000],
				["ffaa_famet_tigre", 5000],
				["ffaa_nh90_tth_transport", 5000]
			];
		};
	};
	case "militar_cazas": {
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["ffaa_ar_harrier", 5000],
				["ffaa_ea_hercules_cargo", 5000],
				["ffaa_ea_hercules", 5000]
			];
		};
	};
	case "militar_coches": {
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["ffaa_et_lince_m2", 5000],
				["ffaa_et_vamtac_trans_blind", 5000],
				["ffaa_et_vamtac_trans", 5000],
				["ffaa_et_pegaso_carga", 5000],
				["ffaa_et_anibal", 5000],
				["ffaa_et_vamtac_lag40", 5000],
				["ffaa_et_vamtac_ume", 5000],
				["ffaa_et_lince_ambulancia", 5000],
				["ffaa_et_m250_combustible_blin", 5000],
				["ffaa_et_m250_recuperacion_blin", 5000],
				["ffaa_et_rg31_samson", 5000],
				["ffaa_et_pegaso_carga_lona", 5000],
				["ffaa_et_vamtac_crows", 5000]
			];
		};
	};
	case "militar_barcos": {
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["ffaa_ar_zodiac_hurricane_long", 5000],
				["ffaa_ar_supercat", 5000],
				["ffaa_ar_zodiac_hurricane", 5000]
			];
		};
	};
	case "cop_airhq": {
		_return = [
			["ec135_policia_f", 5000],
			["ec135_guardiacivil_F", 5000],
			["bo_105_policia_F", 5000],
			["bo_105_guardiacivil_F", 5000]
		];
	};
	case "civ_ship": {
		_return = [
			["C_Rubberboat", 10000],
			["C_Scooter_Transport_01_F", 7500],
			["POP_Lancha_civil", 25000],
			["POP_pesca_f", 3500],
			["POP_Speed_yatch", 150000]
		];
	};
	case "cop_ship": {
		_return = [
			["POP_Lancha_policia", 5000],
			["predator_gc", 5000],
			["CNP_Boat_police_F",5000],
			["Zodiac_GEO_F",5000]
		 ];
	};
	case "donator": {
		if(__GETC__(life_donator) > 0) then {
			_return = [
			["shounka_f430_spider_gris", 1400000],
			["458_civ", 1065000],
			["A45lu_civ_civilgris", 695000],			
			["POP_Ferrari_Enzo_rojo", 1700000],
			["pop_laferrari_D",1400000],			
			["f12lu_civ", 1065000],
			["FFlu_civ", 1065000],
			["V250_noir", 105000],
			["Warrior_gris", 195000],
			["GT3lu_civ_noir", 1095000],	
			["pop_mustang_GT15_gris", 253000],	
			["pop_porsche911", 1000000],	
			["pop_LamborghiniVeneno_gris", 1400000],		
			["pop_LamborghiniVeneno_grafiti3", 1700000],
			["pop_megane_GT_1", 1400000],
			["quiet_Bugatti_blanche_f",1400000],
		    ["mrshounka_huracan_c_rose", 1400000],
			["pop_mp4", 1400000],
			["pop_agera_p", 1000000],
			["pop_panamera_naranja", 1000000],
			["pop_gt_noir", 1000000],
			["pop_pagani_c", 1000000],
			["pop_lykan_Hypersport_violeta", 1000000],
			["pop_bmw_1series", 200000],
			["tal_maserati_pink", 500000],
			["Jonzie_Quattroporte", 100000],
			["Quiet_v2_r8plus_rouge_f",650000],
			["IVORY_R8",550000],
			["ADM_Monte_Carlo", 650000],
		    ["ivory_gt500",190000],
		    ["ivory_lfa",1200000],
			["ivory_lp560",1050000],
			["ivory_c",650000],
			["shounka_limo_civ_orange",400001],
			["Jonzie_Viper", 1000000],
			["pop_ford_gt402", 500000],
			["pop_amg_GT_rojo", 500000],
			["pop_furai", 700000],
			["pop_mp1_D", 700000],
			["pop_chevrolet_azul", 550005],
			["pop_zonda_s1", 600000],
			["pop_r8MP_4", 600000],
			["pop_mono", 600000],
			["pop_Caterham_2", 600000],
			["pop_GT3", 500000],
			["pop_lola_1", 500000],
//
			["POP_renaultmagnum_f", 300000],
			["pop_Vandura_civ_equipoa", 140000],
			["pop_Man_TGX_negro", 340000],
			["tw_raptor_black", 105000],
			["pop_volvo_camion", 430000],
			["Jonzie_Transit", 100000],
			["pop_nemo", 100000],
			["ADM_Ford_F100", 45000],
			["pop_iveco_f", 250000],
			["C_Van_01_fuel_F", 40000],
			["Volvo_Cisterna_1", 100000],
			["pop_mercedes_benz_vito_gris", 60000],
			["pop_dafxf_euro6_gris", 300000],			
			["pop_ford_transit_gris", 185000],
			["pop_sprinter_2016_gris", 185000],			
			["pop_sprinter_gris", 220000],
			["pop_mercedes_vito", 220000],
			["pop_renault_master", 100000],
			["pop_Vandura_civ_gris", 300000],
			["shounka_a3_spr_civ_grise", 305000],
			["midlum_red", 200000],
			["pop_scania_r6202", 350000],
			["shounka_ivceco_grise", 370000],
			["pop_opel_vivaro_negro", 182500],
			["dikeman_haulier2", 430000],
//
			["POP_renaultmagnum1_f", 300000],
			["pop_Man_TGXsin_negro", 100000],
			["pop_volvo_camion_sin", 100000],
//
			["chcitan_civ", 55000],
			["POP_207_naranja", 25000],
			//["pop_renault_megane", 25000],
			["pop_golfvi_violet", 28000],
			["pop_astra_RS", 38000],
			["pop_seat_ibiza_blanco", 22000],
			["pop_ford_focusrs_negro", 28000],
			["pop_308_azul", 28000],
			["pop_twingo_p", 15000],
			["pop_Alfa_Romeo_Naranga", 25000],
			["pop_alfa_romeo_159_azul", 18000],			
			["pop_c4_p_rojo", 25000],
			["pop_c4_picasso_p_rojo", 25000],			
			["pop_ds3_negro", 25000],
			["pop_ds4_naranja", 25000],
			["pop_r5_violeta", 25000],
			["pop_rs_gris", 25000],
			["pop_rs4_civ_azul", 20000],
			["pop_rs6_violeta", 45000],
			["POP_smart_rojo", 25000],
			["pop_peugeot508_civ", 30000],
			["Jonzie_Mini_Cooper_R_spec", 45000],
			["Jonzie_Mini_Cooper", 30000],
			["Jonzie_Corolla", 25000],
			["Jonzie_Datsun_510", 25000],
			["Jonzie_Ceed", 25000],
			["IVORY_PRIUS", 32000],
			["pop_clio_civ_orange", 25000],
			["pop_peugeot_406_gris", 25000],
			["pop_citroen_c4_picasso_gris", 30000],
			["pop_citroen_c4_picasso_2016_azul", 30000],
			["pop_ford_mondeo_gris", 30000],
			["pop_ford_mondeo_azul", 30000],
			["pop_ford_mondeo_negro", 30000],
			["pop_ford_mondeo_blanco", 30000],
			["pop_ford_mondeo_rojo", 30000],
			["pop_citroen_xsara_picasso_azul", 50000],
			["pop_peugeot_407_azul", 30000],
			["pop_fiat_bravo_rojo", 30000],
			["pop_seat_leon_rojo", 33000],
			["pop_AudiA1_blanco", 55000],
			["pop_Caprice1968_r", 50000],
			["pop_69Charger_r", 52000],
			["pop_opel_astra_h_gris", 30000],
			["pop_opel_astra_j_gris", 52000],
//
			["pop_hummer_civ", 315000],
			["pop_h2_violet", 325000],
			["pop_HummerH2_a", 335000],
			["pop_HummerH1", 335000],				
			["pop_Suburban2015_r", 250000],
			["pop_nissan_pathfinder", 325000],
			["pop_ranger_rover", 275000],
			["pop_avalanche_violeta", 345000],
			["pop_monsteur_gris", 430000],
			["POP_jeep_blinde_rojo", 578000],
			["POP_Landrover_Defender", 175000],
			["Quiet_ford_raptor_bleu_f", 325000],
			["Quiet_c65amg_blanche_f", 400000],
			["pop_raptor_naranja", 315000],
			["pop_UAZ_Patriot_negro", 215000],
			["pop_cherokee_negro_violeta", 105000],
			["POP_Qashqai_rosado", 75000],
			["Quiet_Cadillac_noir_f", 195000],
			["quiet_sub2015_rouge_f", 195000],			
			["pop_smart_supercharge_civ_azul", 100000],
			["shounka_buggy_grise", 145000],
			["pop_a3_audiq7_bleu", 106000],
			["pop_FordTransiSupervan_civ_violeta", 160000],
			["pop_mitsubishi_asx_gris", 143000],			
			["pop_nissan_qashqai_2016_azul", 132000],
			["pop_mitsubishi_montero_blanco", 142000],
			["pop_land_rover_freelander_azul", 145000],
			["pop_nissan_patrol_azul", 146000],
			["pop_nissan_patrol_corto", 75000],
			["pop_toyota_prado_rojo", 224000],
			["pop_JeepWrangler_b", 100000],
			["pop_volvo2", 120000],
			["pop_dacia_naranja", 120000],
			["pop_hyundai_x352", 120000],
			["pop_rover_evo_amarillo", 125000],
			["pop_GMCSerriaLarge_r", 165000], // 240 510
			["pop_toyota_FJCruiser3", 135000],
			["pop_lexus_gx4602", 135000], // 250km f 309
			["pop_jeep_grandcherokee3", 395000],		
			["pop_Youkun2015_b", 112000], // 250 510
			["pop_landcruiser", 142000], // 250 510
			["pop_AudiQ7_r", 115000], // 250 510
			["pop_13G65_r", 115000], // 250 510
			["pop_F350_r", 115000], // 250 510
			["pop_F150_r", 145000], // 250 510 
			["pop_Explorer_r", 115000], // 250 510
			["pop_MercedesBenz6x6_r", 115000], // 250 590
			["pop_S331_r", 105000], // 260 510
			["pop_bmw_x52", 115000],    // 285 350
			["pop_hyundai_veloster2", 165000],
			["pop_tahoe_r", 115000], // 331 350
			["pop_escalade", 115000], // 173km 310 900 maletero
			["pop_insurgent_v1", 1000000],
			["pop_insurgent_vELN", 1000000],
			["pop_InsurgentCivil", 1000000],
//
			["shounka_harley_a3", 10000],
			["pop_moto_sidecar", 10000],
			["pop_moto_1_azul", 10000],
			["pop_honda_bizz_Roja", 10000],
			["pop_bmw_1200_rt_azul", 10000],
			["pop_yamaha_xt660r_azul", 10000],	
			["pop_yamaha_p", 26000],
//
            ["pop_bus_p_grise", 50000],
//
			["458_civ", 1000000],
	        ["ivory_wrx",250000],
            ["IVORY_R8SPYDER",400000],
			["pop_chevrolet_camaro_azul", 450005],
			["pop_bmwm6_gris", 150000],		
			["pop_bmwm4_D", 141000],			
			["pop_nissan_skyline", 105000],
			["pop_nissan_silvia", 225000],
			["pop_c63_2015_rose_t", 205000],
			["pop_c63_2015_rose", 200000],
			["Quiet_1969charger_bleu_f", 200000],
			["Quiet_dodge_15_rouge_f", 200000],
			["pop_mercedes_190_p_civ", 100000],
			["shounka_a3_rs5_civ_noir", 100000],
			["pop_a3_308_rcz_bleufonce", 58000],
			["pop_subaru08_amarillo", 59000],
			["pop_clk_jaune", 150000],
			["pop_toyota_gt86_Blanco", 111000],
			["pop_cayenne_p_naranja", 195000],
			["pop_dodge15_civ_rosa_t", 125000],
			["pop_gtr_azul", 195000],
			["pop_lincoln_rojo", 105000],
			["pop_mustang_naranja", 140000],
			["quiet_Ford_shelbyGT500_rouge_f", 245000],
			["pop_transam_orange", 195000],
			["pop_hotrod_civ", 245000],	
			["pop_rs4_civ_azul", 125000],			
			["Jonzie_30CSL", 105000],
			["ADM_1964_Impala", 295000],
			["ADM_1969_Camaro", 295000],
			["ADM_1969_Charger", 295000],
			["Jonzie_Datsun_Z432", 125000],		
			["Jonzie_STI", 250000],
			["PKE_92_civ_bleufonce", 340000],
			["pop_evox_bleufonce", 100000],
			["pop_300c_r", 310000],		
			["pop_MustangMach1Jet1969", 323000],
			["pop_BMW750il_r", 280000],
			["pop_Chrysler_r", 400000],
			["pop_caymanS_z_noir", 400000],
			["pop_lotus_GTE", 400000],
			["pop_afla_4C_azul", 400000],
			["pop_370Z_rojo", 109000],
			["pop_MaybachLaundet57", 400000],
			["pop_chevroletc7_amarillo", 320000],
			["pop_regera_azul", 330000],
			["pop_bmw507_d3", 340000],
			["pop_lambo_miura_d", 400000],
			["pop_bmw8_rojo", 400000],
			["pop_m300sl1", 370000],
			["pop_Viper_08_n",400000],
			["pop_RollsRoyce011_b",600000],
			["pop_NissanGTR_n",262000],
			["pop_Charger_12_r",261000],
			["pop_porche918", 433000],
			["POP_veneno_azul", 402000],
			["pop_opel_insignia_gris", 151000],
			["pop_toyota_camry_gris", 157000],
//
			["C_Kart_01_Blu_F", 35000],
			["C_Kart_01_Fuel_F", 35000],
//
			["POP_Opel_Insignia_taxi", 20000],
			["pop_peugeot508_taxi_civ", 20000]
		];
		};
	};
};

_return;
