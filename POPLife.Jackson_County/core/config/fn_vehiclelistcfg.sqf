#include <macro.h>

private ["_shop", "_return"];

_shop = [_this, 0, "", [""]] call BIS_fnc_param;
if (_shop == "") exitWith { []};
_return = [];
switch (_shop) do {
	case "dezzie_car": { // Vehiculos de competicion
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
	case "kart_shop": { // Tienda de karts
		_return = [
			["C_Kart_01_Blu_F", 45000],
			["C_Kart_01_Fuel_F", 45000]
		];
	};
	case "taxista_shop": { // Tienda taxista (No en uso)
		_return = [
			["v_p0_altea_XL_taxi", 30000]
		];
	};
	case "periodista_shop": { // POP TV Tienda (No en uso)
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
	case "med_shop": { // Vehiculos EMS
		_return = [
			sfp_wheelchair
			["sfp_wheelchair", 500],
			["sprinter_2016_ems", 2500],
			["sprinter_caja_ems", 2500],
			["mitsubishi_asx_ems", 3000],
			["POP_corbillard_c_noir", 2500],
			["pop_grua", 2500],
			["v_P0_Actros_DEP", 2500],
			["mercedes_atego_bomberos_ingame", 2500]
		];
	};
	case "med_air_hs": { // Helicopteros EMS
		_return = [
			["ec_135_ems", 1500]
		];
	};
	case "exo_car": { // Vehiculos de Lujo
		_return = [
			
			["v_p0_Zagato_Purple", 2070000],
			["v_p0_Zagato_Darkgreen", 2070000],
			["v_p0_Zagato_Green", 2070000],
			["v_p0_Zagato_Pink", 2070000],
			["v_p0_Zagato_Darkred", 2070000],
			["v_p0_Zagato_Red", 2070000],
			["v_p0_Zagato_Black", 2070000],
			["v_p0_Zagato_Orange", 2070000],
			["v_p0_Zagato_Silver", 2070000],
			["v_p0_Zagato_White", 2070000],
			["v_p0_Zagato_Blue", 2070000],
			["v_p0_Zagato_Yellow", 2070000],

			["v_p0_Audi_R8_VRS_Yellow", 172000],
			["v_p0_Audi_R8_VRS_Blue", 172000],
			["v_p0_Audi_R8_VRS_White", 172000],
			["v_p0_Audi_R8_VRS_Silver", 172000],
			["v_p0_Audi_R8_VRS_Orange", 172000],
			["v_p0_Audi_R8_VRS_Black", 172000],
			["v_p0_Audi_R8_VRS_Red", 172000],
			["v_p0_Audi_R8_VRS_Darkred", 172000],
			["v_p0_Audi_R8_VRS_Pink", 172000],
			["v_p0_Audi_R8_VRS_Green", 172000],
			["v_p0_Audi_R8_VRS_Darkgreen", 172000],
			["v_p0_Audi_R8_VRS_Purple", 172000],



			["v_p0_Chiron_Yellow", 500000],
			["v_p0_Chiron_Blue", 500000],
			["v_p0_Chiron_White", 500000],
			["v_p0_Chiron_Silver", 500000],
			["v_p0_Chiron_Orange", 500000],
			["v_p0_Chiron_Black", 500000],
			["v_p0_Chiron_Red", 500000],
			["v_p0_Chiron_Darkred", 500000],
			["v_p0_Chiron_Pink", 500000],
			["v_p0_Chiron_Green", 500000],
			["v_p0_Chiron_Darkgreen", 500000],


			["v_p0_F12_Yellow", 165000],
			["v_p0_F12_Blue", 165000],
			["v_p0_F12_White", 165000],
			["v_p0_F12_Orange", 165000],
			["v_p0_F12_Silver", 165000],
			["v_p0_F12_Black", 165000],
			["v_p0_F12_Red", 165000],
			["v_p0_F12_Darkred", 165000],
			["v_p0_F12_Pink", 165000],
			["v_p0_F12_Green", 165000],
			["v_p0_F12_Darkgreen", 165000],
			["v_p0_F12_Purple", 165000],


			["v_p0_Ferrari_488_Yellow", 1165000],
			["v_p0_Ferrari_488_Blue", 1165000],
			["v_p0_Ferrari_488_White", 1165000],
			["v_p0_Ferrari_488_Silver", 1165000],
			["v_p0_Ferrari_488_Orange", 1165000],
			["v_p0_Ferrari_488_Black", 1165000],
			["v_p0_Ferrari_488_Red", 1165000],
			["v_p0_Ferrari_488_Darkred", 1165000],
			["v_p0_Ferrari_488_Pink", 1165000],
			["v_p0_Ferrari_488_Green", 1165000],
			["v_p0_Ferrari_488_Darkgreen", 1165000],
			["v_p0_Ferrari_488_Purple", 1165000],

			
			["v_p0_Ferrari_488_Yellow", 320000],
			["v_p0_Ferrari_488_Blue", 320000],
			["v_p0_Ferrari_488_White", 320000],
			["v_p0_Ferrari_488_Silver", 320000],
			["v_p0_Ferrari_488_Orange", 320000],
			["v_p0_Ferrari_488_Black", 320000],
			["v_p0_Ferrari_488_Red", 320000],
			["v_p0_Ferrari_488_Darkred", 320000],
			["v_p0_Ferrari_488_Pink", 320000],
			["v_p0_Ferrari_488_Green", 320000],
			["v_p0_Ferrari_488_Darkgreen", 320000],
			["v_p0_Ferrari_488_Purple", 320000],


			["v_p0_Gallardo_Yellow", 140000],
			["v_p0_Gallardo_Blue", 140000],
			["v_p0_Gallardo_White", 140000],
			["v_p0_Gallardo_Silver", 140000],
			["v_p0_Gallardo_Orange", 140000],
			["v_p0_Gallardo_Black", 140000],
			["v_p0_Gallardo_Red", 140000],
			["v_p0_Gallardo_Darkred", 140000],
			["v_p0_Gallardo_Pink", 140000],
			["v_p0_Gallardo_Green", 140000],
			["v_p0_Gallardo_Darkgreen", 140000],
			["v_p0_Gallardo_Purple", 140000],


			["v_p0_Ghibli_Yellow", 285000],
			["v_p0_Ghibli_Blue", 285000],
			["v_p0_Ghibli_White", 285000],
			["v_p0_Ghibli_Silver", 285000],
			["v_p0_Ghibli_Orange", 285000],
			["v_p0_Ghibli_Black", 285000],
			["v_p0_Ghibli_Red", 285000],
			["v_p0_Ghibli_Darkred", 285000],
			["v_p0_Ghibli_Pink", 285000],
			["v_p0_Ghibli_Green", 285000],
			["v_p0_Ghibli_Darkgreen", 285000],
			["v_p0_Ghibli_Purple", 285000],


			["v_p0_Boxster_Yellow", 200000],
			["v_p0_Boxster_Blue", 200000],
			["v_p0_Boxster_White", 200000],
			["v_p0_Boxster_Silver", 200000],
			["v_p0_Boxster_Orange", 200000],
			["v_p0_Boxster_Black", 200000],
			["v_p0_Boxster_Red", 200000],
			["v_p0_Boxster_Darkred", 200000],
			["v_p0_Boxster_Pink", 200000],
			["v_p0_Boxster_Green", 200000],
			["v_p0_Boxster_Darkgreen", 200000],
			["v_p0_Boxster_Purple", 200000],

	
			["v_p0_Porsche_Yellow", 250000],
			["v_p0_Porsche_Blue", 250000],
			["v_p0_Porsche_White", 250000],
			["v_p0_Porsche_Silver", 250000],
			["v_p0_Porsche_Orange", 250000],
			["v_p0_Porsche_Black", 250000],
			["v_p0_Porsche_Red", 250000],
			["v_p0_Porsche_Darkred", 250000],
			["v_p0_Porsche_Pink", 250000],
			["v_p0_Porsche_Green", 250000],
			["v_p0_Porsche_Darkgreen", 250000],
			["v_p0_Porsche_Purple", 250000],

	
			["v_p0_Porsche_P_Yellow", 360000],
			["v_p0_Porsche_P_Blue", 360000],
			["v_p0_Porsche_P_White", 360000],
			["v_p0_Porsche_P_Silver", 360000],
			["v_p0_Porsche_P_Orange", 360000],
			["v_p0_Porsche_P_Black", 360000],
			["v_p0_Porsche_P_Red", 360000],
			["v_p0_Porsche_P_Darkred", 360000],
			["v_p0_Porsche_P_Pink", 360000],
			["v_p0_Porsche_P_Green", 360000],
			["v_p0_Porsche_P_Darkgreen", 360000],
			["v_p0_Porsche_P_Purple", 360000]

	        
		];
	};

    case "bus": { // Autobuses
		_return = [
			["pop_bus_p_grise", 60000]
		];
	};
	case "moto_chop": { // Motos
		_return = [
		
			["v_p0_Sanchez_Bob", 5000],
			["v_p0_Sanchez_Camo_Bleu", 5000],
			["v_p0_Sanchez_Camo_Gris", 5000],
			["v_p0_Sanchez_Camo_Orange", 5000],
			["v_p0_Sanchez_Camo_Rouge", 5000],
			["v_p0_Sanchez_Camo_Vert", 5000],
			["v_p0_Sanchez_Monstre", 5000],
			["v_p0_Sanchez_Goute", 5000],
			["v_p0_Sanchez_Ghost", 5000]
		];
	};

	case "dodge_car": { // Concesionario 4x4
		_return = [


			["v_p0_nissan_pathfinder_Yellow", 60000],
			["v_p0_nissan_pathfinder_Blue", 60000],
			["v_p0_nissan_pathfinder_White", 60000],
			["v_p0_nissan_pathfinder_Silver", 60000],				
			["v_p0_nissan_pathfinder_Orange", 60000],
			["v_p0_nissan_pathfinder_Black", 60000],
			["v_p0_nissan_pathfinder_Red", 60000],
			["v_p0_nissan_pathfinder_Darkred", 60000],
			["v_p0_nissan_pathfinder_Pink", 60000],
			["v_p0_nissan_pathfinder_Green", 60000],
			["v_p0_nissan_pathfinder_Darkgreen", 60000],
			["v_p0_nissan_pathfinder_Purple", 60000],


			["v_p0_nissan_qashqai_Yellow", 50000],
			["v_p0_nissan_qashqai_Blue", 50000],
			["v_p0_nissan_qashqai_White", 50000],
			["v_p0_nissan_qashqai_Silver", 50000],
			["v_p0_nissan_qashqai_Orange", 50000],
			["v_p0_nissan_qashqai_Black", 50000],
			["v_p0_nissan_qashqai_Red", 50000],			
			["v_p0_nissan_qashqai_Darkred", 50000],
			["v_p0_nissan_qashqai_Pink", 50000],
			["v_p0_nissan_qashqai_Green", 50000],
			["v_p0_nissan_qashqai_Purple", 50000],


			["v_p0_nissan_terrano_ii_Orange", 45000],			
			["v_p0_nissan_terrano_ii_Black", 45000],
			["v_p0_nissan_terrano_ii_Red", 45000],
			["v_p0_nissan_terrano_ii_Darkred", 45000],
			["v_p0_nissan_terrano_ii_Pink", 45000],
			["v_p0_nissan_terrano_ii_Silver", 45000],
			["v_p0_nissan_terrano_ii_White", 45000],
			["v_p0_nissan_terrano_ii_Blue", 45000],
			["v_p0_nissan_terrano_ii_Yellow", 45000],
			["v_p0_nissan_terrano_ii_Green", 45000],
			["v_p0_nissan_terrano_ii_Darkgreen", 45000],
			["v_p0_nissan_terrano_ii_Purple", 45000],


			["v_p0_nissan_xtrail_Darkgreen", 55000], 
			["v_p0_nissan_xtrail_Purple", 55000],
			["v_p0_nissan_xtrail_Green", 55000], 
			["v_p0_nissan_xtrail_Pink", 55000],		
			["v_p0_nissan_xtrail_Darkred", 55000], 
			["v_p0_nissan_xtrail_Red", 55000], 
			["v_p0_nissan_xtrail_Black", 55000], 
			["v_p0_nissan_xtrail_Orange", 55000], 
			["v_p0_nissan_xtrail_Silver", 55000], 
			["v_p0_nissan_xtrail_White", 55000], 
			["v_p0_nissan_xtrail_Blue", 55000], 
			["v_p0_nissan_xtrail_Yellow", 55000], 


			["v_p0_raptor_Yellow", 75000], 
			["v_p0_raptor_Blue", 75000],
			["v_p0_raptor_White", 75000], 
			["v_p0_raptor_Silver", 75000],		
			["v_p0_raptor_Orange", 75000], 
			["v_p0_raptor_Black", 75000], 
			["v_p0_raptor_Red", 75000], 
			["v_p0_raptor_Darkred", 75000], 
			["v_p0_raptor_Pink", 75000], 
			["v_p0_raptor_Green", 75000], 
			["v_p0_raptor_Darkgreen", 75000], 
			["v_p0_raptor_Purple", 75000], 


			["v_p0_toyota_prado_Yellow", 55000], 
			["v_p0_toyota_prado_Blue", 55000],
			["v_p0_toyota_prado_White", 55000], 
			["v_p0_toyota_prado_Silver", 55000],		
			["v_p0_toyota_prado_Orange", 55000], 
			["v_p0_toyota_prado_Black", 55000], 
			["v_p0_toyota_prado_Red", 55000], 
			["v_p0_toyota_prado_Darkred", 55000], 
			["v_p0_toyota_prado_Pink", 55000], 
			["v_p0_toyota_prado_Green", 55000], 
			["v_p0_toyota_prado_Purple", 55000]
		];
	};

	case "civ_car": { // Concesionario civil
		_return = [

		
			["v_p0_Q7_Yellow", 75000],
			["v_p0_Q7_Blue", 75000],
			["v_p0_Q7_White", 75000],
			["v_p0_Q7_Silver", 75000],
			["v_p0_Q7_Orange", 75000],
			["v_p0_Q7_Black", 75000],
			["v_p0_Q7_Red", 75000],
			["v_p0_Q7_Darkred", 75000],
			["v_p0_Q7_Pink", 75000],
			["v_p0_Q7_Green", 75000],
			["v_p0_Q7_Darkgreen", 75000],			
			["v_p0_Q7_Purple", 75000],

			["v_p0_M5_Blue", 45000],			
			["v_p0_M5_White", 45000],
			["v_p0_M5_Silver", 45000],
			["v_p0_M5_Orange", 45000],
			["v_p0_M5_Black", 45000],
			["v_p0_M5_Red", 45000],
			["v_p0_M5_Darkred", 45000],
			["v_p0_M5_Pink", 45000],
			["v_p0_M5_Green", 45000],
			["v_p0_M5_Darkgreen", 45000],
			["v_p0_M5_Purple", 45000],
			["v_p0_M5_Yellow", 45000],

			["v_p0_M5_2012_Yellow", 63000],
			["v_p0_M5_2012_Blue", 63000],
			["v_p0_M5_2012_White", 63000],
			["v_p0_M5_2012_Silver", 63000],
			["v_p0_M5_2012_Orange", 63000],
			["v_p0_M5_2012_Black", 63000],
			["v_p0_M5_2012_Red", 63000],
			["v_p0_M5_2012_Darkred", 63000],
			["v_p0_M5_2012_Pink", 63000],
			["v_p0_M5_2012_Green", 63000],
			["v_p0_M5_2012_Darkgreen", 63000],
			["v_p0_M5_2012_Purple", 63000],


			["p0_bmw_x6M_Yellow", 80000],
			["p0_bmw_x6M_Blue", 80000],
			["p0_bmw_x6M_White", 80000],
			["p0_bmw_x6M_Silver", 80000],
			["p0_bmw_x6M_Orange", 80000],
			["p0_bmw_x6M_Black", 80000],
			["p0_bmw_x6M_Red", 80000],
			["p0_bmw_x6M_Darkred", 80000],
			["p0_bmw_x6M_Pink", 80000],
			["p0_bmw_x6M_Green", 80000],
			["p0_bmw_x6M_Darkgreen", 80000],
			["p0_bmw_x6M_Purple", 80000],


			["v_p0_CCS_Yellow", 100000],
			["v_p0_CCS_Blue", 100000],
			["v_p0_CCS_White", 100000],
			["v_p0_CCS_Silver", 100000],
			["v_p0_CCS_Orange", 100000],
			["v_p0_CCS_Black", 100000],
			["v_p0_CCS_Red", 100000],
			["v_p0_CCS_Darkred", 100000],
			["v_p0_CCS_Pink", 100000],
			["v_p0_CCS_Green", 100000],
			["v_p0_CCS_Darkgreen", 100000],
			["v_p0_CCS_Purple", 100000],

			["v_p0_Focus_Civil_Pink", 50000],
			["v_p0_Focus_Civil_Green", 50000],
			["v_p0_Focus_Civil_Darkgreen", 50000],
			["v_p0_Focus_Civil_Purple", 50000],
			["v_p0_Focus_Civil_Darkred", 50000],
			["v_p0_Focus_Civil_Red", 50000],
			["v_p0_Focus_Civil_Black", 50000],
			["v_p0_Focus_Civil_Orange", 50000],
			["v_p0_Focus_Civil_Silver", 50000],
			["v_p0_Focus_Civil_White", 50000],
			["v_p0_Focus_Civil_Blue", 50000],
			["v_p0_Focus_Civil_Yellow", 50000],


			["v_p0_A45_AMG_Yellow", 125000],
			["v_p0_A45_AMG_Blue", 125000],
			["v_p0_A45_AMG_White", 125000],
			["v_p0_A45_AMG_Silver", 125000],
			["v_p0_A45_AMG_Orange", 125000],
			["v_p0_A45_AMG_Black", 125000],
			["v_p0_A45_AMG_Red", 125000],
			["v_p0_A45_AMG_Darkred", 125000],
			["v_p0_A45_AMG_Pink", 125000],
			["v_p0_A45_AMG_Green", 125000],
			["v_p0_A45_AMG_Darkgreen", 125000],
			["v_p0_A45_AMG_Purple", 125000],


			["v_p0_mitsubishi_asx_Yellow", 65000],
			["v_p0_mitsubishi_asx_Blue", 65000],
			["v_p0_mitsubishi_asx_White", 65000],
			["v_p0_mitsubishi_asx_Silver", 65000],
			["v_p0_mitsubishi_asx_Orange", 65000],
			["v_p0_mitsubishi_asx_Black", 65000],
			["v_p0_mitsubishi_asx_Red", 65000],
			["v_p0_mitsubishi_asx_Green", 65000],
			["v_p0_mitsubishi_asx_Darkgreen", 65000],
			["v_p0_mitsubishi_asx_Purple", 65000],


			["v_p0_opel_astra_j_Yellow", 30000],
			["v_p0_opel_astra_j_Blue", 30000],
			["v_p0_opel_astra_j_White", 30000],
			["v_p0_opel_astra_j_Silver", 30000],
			["v_p0_opel_astra_j_Orange", 30000],
			["v_p0_opel_astra_j_Black", 30000],
			["v_p0_opel_astra_j_Red", 30000],
			["v_p0_opel_astra_j_Darkred", 30000],
			["v_p0_opel_astra_j_Pink", 30000],
			["v_p0_opel_astra_j_Green", 30000],
			["v_p0_opel_astra_j_Darkgreen", 30000],
			["v_p0_opel_astra_j_Purple", 30000],


			["v_p0_peugeot_308_Yellow", 30000],
			["v_p0_peugeot_308_Blue", 30000],
			["v_p0_peugeot_308_White", 30000],
			["v_p0_peugeot_308_Silver", 30000],
			["v_p0_peugeot_308_Orange", 30000],
			["v_p0_peugeot_308_Black", 30000],
			["v_p0_peugeot_308_Red", 30000],
			["v_p0_peugeot_308_Darkred", 30000],
			["v_p0_peugeot_308_Pink", 30000],
			["v_p0_peugeot_308_Green", 30000],
			["v_p0_peugeot_308_Darkgreen", 30000],
			["v_p0_peugeot_308_Purple", 30000],


			["v_p0_Subaru_Purple", 87000],
			["v_p0_Subaru_Darkgreen", 87000],
			["v_p0_Subaru_Green", 87000],
			["v_p0_Subaru_Pink", 87000],
			["v_p0_Subaru_Darkred", 87000],
			["v_p0_Subaru_Red", 87000],
			["v_p0_Subaru_Black", 87000],
			["v_p0_Subaru_Orange", 87000],
			["v_p0_Subaru_Silver", 87000],
			["v_p0_Subaru_White", 87000],
			["v_p0_Subaru_Blue", 87000],
			["v_p0_Subaru_Yellow", 87000],


			["v_p0_PoloGTI_Yellow", 40000],
			["v_p0_PoloGTI_Blue", 40000],
			["v_p0_PoloGTI_White", 40000],
			["v_p0_PoloGTI_Silver", 40000],
			["v_p0_PoloGTI_Orange", 40000],
			["v_p0_PoloGTI_Black", 40000],
			["v_p0_PoloGTI_Red", 40000],
			["v_p0_PoloGTI_Darkred", 40000],
			["v_p0_PoloGTI_Pink", 40000],
			["v_p0_PoloGTI_Green", 40000],
			["v_p0_PoloGTI_Darkgreen", 40000],
			["v_p0_PoloGTI_Purple", 40000]
		];
	};
	case "skate_shop": {
		_return = [];
	};
	case "tienda_trasporte": { // Camiones de farmeo
		_return = [
			["POP_renaultmagnum1_f", 400000],
			["pop_Man_TGXsin_negro", 160000],
			["pop_volvo_camion_sin", 100000]
		];
	};
	case "civ_truck": { // Camiones y Furgonetas
		_return = [
			["v_p0_Sprinter_civ_Purple", 65000],
			["v_p0_Sprinter_civ_Darkgreen", 65000],
			["v_p0_Sprinter_civ_Green", 65000],
			["v_p0_Sprinter_civ_Pink", 65000],
			["v_p0_Sprinter_civ_Darkred", 65000],
			["v_p0_Sprinter_civ_Red", 65000],
			["v_p0_Sprinter_civ_Black", 65000],
			["v_p0_Sprinter_civ_Orange", 65000],
			["v_p0_Sprinter_civ_Silver", 65000],
			["v_p0_Sprinter_civ_White", 65000],
			["v_p0_Sprinter_civ_Blue", 65000],
			["v_p0_Sprinter_civ_Yellow", 65000],
			["v_p0_Sprinter_22_Purple", 95000],
			["v_p0_Sprinter_22_Darkgreen", 95000],
			["v_p0_Sprinter_22_Green", 95000],
			["v_p0_Sprinter_22_Pink", 95000],
			["v_p0_Sprinter_22_Darkred", 95000],
			["v_p0_Sprinter_22_Red", 95000],
			["v_p0_Sprinter_22_Black", 95000],
			["v_p0_Sprinter_22_Orange", 95000],
			["v_p0_Sprinter_22_Silver", 95000],
			["v_p0_Sprinter_22_White", 95000],
			["v_p0_Sprinter_22_Blue", 95000],
			["v_p0_Sprinter_22_Yellow", 95000],
			["v_p0_DAF_Euro6_Purple", 150000],              
			["v_p0_DAF_Euro6_Darkgreen", 150000],
			["v_p0_DAF_Euro6_Green", 150000],
			["v_p0_DAF_Euro6_Pink", 150000],
			["v_p0_DAF_Euro6_Darkred", 150000],
			["v_p0_DAF_Euro6_Red", 150000],
			["v_p0_DAF_Euro6_Black", 150000],
			["v_p0_DAF_Euro6_Orange", 150000],
			["v_p0_DAF_Euro6_Silver", 150000],
			["v_p0_DAF_Euro6_White", 150000],
			["v_p0_DAF_Euro6_Blue", 150000],
			["v_p0_Actros_Purple", 205000],
			["v_p0_Actros_Darkgreen", 205000],			
			["v_p0_Actros_Green", 205000],
			["v_p0_Actros_Pink", 205000],			
			["v_p0_Actros_Darkred", 205000],
			["v_p0_Actros_Red", 205000],
			["v_p0_Actros_Black", 205000],
			["v_p0_Actros_Orange", 205000],
			["v_p0_Actros_Silver", 205000],
			["v_p0_Actros_White", 205000],
			["v_p0_Actros_Blue", 205000],
			["v_p0_Actros_Yellow", 205000]
		];
	};
	case "med_ship": { // Barcos EMS
		_return = [
			["v_p0_DV15_Salvamento", 1000],

		];
	};
		case "cop_car": { // Policía
		_return = [
<<<<<<< HEAD
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
=======
			["citroen_c5_gc", 5000],
			[nissan_pathfinder_gc", 5000],
			["nissan_pathfinder_gc_frontera", 5000],
			["nissan_primastar_gc", 5000],
			["nissan_primastar_gc_frontera", 5000],
			["nissan_qashqai_cnp", 5000],
			["nissan_qashqai_cnp_front", 5000],
			["opel_astra_j_gc", 5000],
			["peugeot_expert", 5000],
			["peugeot_expert_cnp_frontera", 5000],
			["toyota_prado_gc", 5000]
>>>>>>> 7712d26e1b6f7983a6d1e770ffb45a5461ecd17f
		];
	};
	case "civ_air": { // helicópteros
		_return = [
			
			["pop_heli_Light_01_blue_F", 300000],
			["pop_heli_Light_01_red_F", 300000],
			["p0_v_ec_135_Darkgreen", 600000],
			["p0_v_ec_135_Darkred", 600000],
			["p0_v_ec_135_Black", 600000],
			["p0_v_ec_135_White", 600000],
			["p0_v_ec_135_Blue", 600000]
		];
	};
	case "cop_air": { // Helicópteros poli 1
		_return = [
			["ec_135_cnp", 5000],
			["ec_135_gc", 5000]
		];
	};
	case "cop_airhq": {// Helicópteros poli 2 - Usar la misma cfg que poli 1 pls :)
		_return = [
			["ec_135_cnp", 5000],
			["ec_135_gc", 5000]
		];
	};
	case "militar": { // Tienda militar (No en uso)
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
	case "militar_cazas": { // Cazas militares (No en uso)
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["ffaa_ar_harrier", 5000],
				["ffaa_ea_hercules_cargo", 5000],
				["ffaa_ea_hercules", 5000]
			];
		};
	};
	case "militar_coches": { // Coches militares (No en uso)
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
	case "militar_barcos": { // Barcos militares (No en uso)
		if(__GETC__(life_coplevel) > 7) then
       	{
			_return = [
				["ffaa_ar_zodiac_hurricane_long", 5000],
				["ffaa_ar_supercat", 5000],
				["ffaa_ar_zodiac_hurricane", 5000]
			];
		};
	};
	case "civ_ship": { // Barcos de civil
		_return = [
			
			["v_p0_Racer_Yellow", 10000],
			["v_p0_Racer_Blue", 10000],
			["v_p0_Racer_White", 10000],
			["v_p0_Racer_Darkred", 10000],
			["v_p0_Racer_Silver", 10000],
			["v_p0_Racer_Orange", 10000],
			["v_p0_Racer_Black", 10000],
			["v_p0_Racer_Red", 10000],
			["v_p0_Racer_Pink", 10000],
			["v_p0_Racer_Green", 10000],
			["v_p0_Racer_Darkgreen", 10000],
			["v_p0_Racer_Purple", 10000],
			["v_p0_Boat_Yacht_F", 30000],
			["v_p0_Speeder_Yellow", 20000],
			["v_p0_Speeder_Blue", 20000],
			["v_p0_Speeder_White", 20000],
			["v_p0_Speeder_Darkred", 20000],
			["v_p0_Speeder_Silver", 20000],
			["v_p0_Speeder_Orange", 20000],
			["v_p0_Speeder_Black", 20000],
			["v_p0_Speeder_Red", 20000],
			["v_p0_Speeder_Pink", 20000],
			["v_p0_Speeder_Green", 20000],
			["v_p0_Speeder_Darkgreen", 20000],
			["v_p0_Speeder_Purple", 20000]
		];
	};
	case "cop_ship": { // barcos de poli
		_return = [
			["v_p0_DV15_CNP", 5000]
		 ];
	};
	case "donator": { // donadores
		if(__GETC__(life_donator) > 0) then {
			_return = [
<<<<<<< HEAD
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
=======
			["v_p0_Actros_vip1", 175000],
			["v_p0_Actros_vip2", 175000],
			["v_p0_Actros_vip3", 150000],
			["v_p0_Actros_vip4", 150000],
			["v_p0_Sprinter_civ_vip1", 75000],
			["v_p0_Sprinter_civ_vip3", 75000],
			["v_p0_Sprinter_civ_vip4", 75000],
			["v_p0_Sprinter_civ_vip5", 75000],
			["v_p0_Sprinter_22_vip1", 105000],
			["v_p0_Sprinter_22_vip2", 105000],
			["v_p0_Sprinter_22_vip3", 105000],
			["v_p0_Sprinter_22_vip4", 105000],
			["v_p0_DAF_Euro6_vip1", 150000],
			["v_p0_DAF_Euro6_vip2", 150000],
			["v_p0_DAF_Euro6_vip3", 150000],
			["v_p0_DAF_Euro6_vip4", 150000],
			["v_p0_Zagato_vip1", 180000],
			["v_p0_Zagato_vip2", 180000],
			["v_p0_Zagato_vip3", 180000],
			["v_p0_Zagato_vip4", 180000],
			["v_p0_Q7_vip1", 50000],
			["v_p0_Q7_vip2", 50000],
			["v_p0_Q7_vip3", 50000],
			["v_p0_Q7_vip4", 50000],
			["v_p0_Audi_R8_VRS_vip1", 120000],
			["v_p0_Audi_R8_VRS_vip2", 120000],
			["v_p0_Audi_R8_VRS_vip3", 120000],
			["v_p0_Audi_R8_VRS_vip4", 120000],
			["v_p0_M5_vip1", 35000],
			["v_p0_M5_vip2", 35000],
			["v_p0_M5_vip3", 35000],
			["v_p0_M5_vip4", 35000],
			["v_p0_M5_2012_vip1", 55000],
			["v_p0_M5_2012_vip2", 55000],
			["v_p0_M5_2012_vip3", 55000],
			["v_p0_M5_2012_vip4", 55000],
			["p0_bmw_x6M_vip1", 65000],
			["p0_bmw_x6M_vip2", 65000],
			["p0_bmw_x6M_vip3", 65000],
			["p0_bmw_x6M_vip4", 65000],
			["v_p0_Chiron_vip1", 400000],
			["v_p0_Chiron_vip2", 400000],
			["v_p0_Chiron_vip3", 400000],
			["v_p0_Chiron_vip4", 400000],
			["v_p0_CCS_vip1", 75000],
			["v_p0_CCS_vip2", 75000],
			["v_p0_CCS_vip3", 75000],
			["v_p0_CCS_vip4", 75000],
			["v_p0_F12_vip1", 125000],
			["v_p0_F12_vip2", 125000],
			["v_p0_F12_vip3", 125000],
			["v_p0_F12_vip4", 125000],
			["v_p0_Focus_Civil_vip1", 35000],
			["v_p0_Focus_Civil_vip2", 35000],
			["v_p0_Focus_Civil_vip3", 35000],
			["v_p0_Focus_Civil_vip4", 35000],
			["v_p0_Gallardo_vip1", 105000],
			["v_p0_Gallardo_vip2", 105000],
			["v_p0_Gallardo_vip3", 105000],
			["v_p0_Gallardo_vip4", 105000],
			["v_p0_Ghibli_vip1", 245000],
			["v_p0_Ghibli_vip2", 245000],
			["v_p0_Ghibli_vip3", 245000],
			["v_p0_Ghibli_vip4", 245000],
			["v_p0_A45_AMG_vip1", 75000],
			["v_p0_A45_AMG_vip2", 75000],
			["v_p0_A45_AMG_vip3", 75000],
			["v_p0_A45_AMG_vip4", 75000],
			["v_p0_mitsubishi_asx_vip1", 65000],
			["v_p0_mitsubishi_asx_vip2", 65000],
			["v_p0_mitsubishi_asx_vip3", 65000],
			["v_p0_mitsubishi_asx_vip4", 65000],
			["v_p0_nissan_pathfinder_vip1", 60000],
			["v_p0_nissan_pathfinder_vip2", 60000],
			["v_p0_nissan_pathfinder_vip3", 60000],
			["v_p0_nissan_pathfinder_vip4", 60000],
			["v_p0_nissan_qashqai_vip1", 50000],
			["v_p0_nissan_qashqai_vip2", 50000],
			["v_p0_nissan_qashqai_vip3", 50000],
			["v_p0_nissan_qashqai_vip4", 50000],
			["v_p0_nissan_terrano_ii_vip2", 45000],
			["v_p0_nissan_terrano_ii_vip3", 45000],
			["v_p0_nissan_terrano_ii_vip4", 45000],
			["v_p0_nissan_xtrail_vip1", 55000],
			["v_p0_nissan_xtrail_vip2", 55000],
			["v_p0_nissan_xtrail_vip3", 55000],
			["v_p0_nissan_xtrail_vip4", 55000],
			["v_p0_opel_astra_j_vip1", 30000],
			["v_p0_opel_astra_j_vip2", 30000],
			["v_p0_opel_astra_j_vip3", 30000],
			["v_p0_opel_astra_j_vip4", 30000],
			["v_p0_peugeot_308_vip1", 30000],
			["v_p0_peugeot_308_vip2", 30000],
			["v_p0_peugeot_308_vip3", 30000],
			["v_p0_peugeot_308_vip4", 30000],
			["v_p0_Boxster_vip1", 150000],
			["v_p0_Boxster_vip2", 150000],
			["v_p0_Boxster_vip3", 150000],
			["v_p0_Boxster_vip4", 150000],
			["v_p0_Porsche_vip1", 305000],
			["v_p0_Porsche_vip2", 305000],
			["v_p0_Porsche_vip3", 305000],
			["v_p0_Porsche_vip4", 305000],
			["v_p0_Porsche_P_vip1", 315000],
			["v_p0_Porsche_P_vip2", 315000],
			["v_p0_Porsche_P_vip3", 315000],
			["v_p0_Porsche_P_vip4", 315000],
			["v_p0_raptor_vip1", 54000],
			["v_p0_raptor_vip2", 54000],
			["v_p0_raptor_vip3", 54000],
			["v_p0_raptor_vip4", 54000],
			["v_p0_Subaru_vip1", 75000],
			["v_p0_Subaru_vip2", 75000],
			["v_p0_Subaru_vip3", 75000],
			["v_p0_toyota_prado_vip1", 55000],
			["v_p0_toyota_prado_vip2", 55000],
			["v_p0_toyota_prado_vip3", 55000],
			["v_p0_toyota_prado_vip4", 55000],
			["v_p0_PoloGTI_vip1", 40000],
			["v_p0_PoloGTI_vip2", 40000],
			["v_p0_PoloGTI_vip3", 40000],
			["v_p0_PoloGTI_vip4", 40000],
			["v_p0_Ferrari_488_vip1", 265000],
			["v_p0_Ferrari_488_vip2", 265000],
			["v_p0_Ferrari_488_vip3", 265000],
			["v_p0_Ferrari_488_vip4", 265000],
			["v_p0_nissan_terrano_ii_vip1", 45000], 
			["p0_v_ec_135_vip1", 300000],


>>>>>>> 7712d26e1b6f7983a6d1e770ffb45a5461ecd17f
		];
		};
	};
};

_return;