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


		];
		};
	};
};

_return;