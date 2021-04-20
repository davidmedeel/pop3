
_cosa = param [0];
_modo = param [1]; // true precio de compra, false de venta

private "_n";

if (_modo) then { // compra
	_n = switch (_cosa) do {
		case "pop_P_Barbacoa": {20};
		case "pop_P_Clasica": {20};
		case "pop_P_Oliva": {20};
		case "pop_P_Originales": {20};
		case "pop_P_Queso": {20};
		case "pop_G_Ahoy": {15};
		case "pop_G_Chocolate": {25};
		case "pop_G_Oreo": {20};
		case "pop_R_Pepsi": {15};
		case "pop_R_Naranja": {15};
		case "pop_R_7up": {15};
		case "pop_R_Superstar": {20};
		case "pop_R_monster": {20};
		case "pop_R_Pepper": {20};
		case "pop_pringles": {20};
		case "pop_H_Fresa": {15};
		case "pop_H_vainilla": {15};
		case "pop_H_Napolitana": {15};
		case "pop_cheseburge": {25};
		case "pop_pizza": {25};
		case "pop_tostada": {15};
		case "pop_pistacho": {20};
		case "pop_kiwi": {50};
		case "pop_banana": {22};
		case "pop_apple": {22};
		
		case "tf_anprc152": {500};
		case "cl_shovel": {1000};

		case "pop_alcohol": {2750};

		case "pop_esposas": {250};
		case "pop_Ganzua": {250};

		//case "cl3_fingerprintscanner": {1000};
		//case "cl_speedgun": {1000};

		case "RH_cz75": {40000};
		case "RH_16Rnd_9x19_cz": {500};
		case "RH_g17": {45000};
		case "RH_17Rnd_9x19_g17": {500};
		case "RH_gsh18": {50000};
		case "RH_18Rnd_9x19_gsh": {500};
		case "RH_kimber_nw": {30000};
		case "RH_7Rnd_45cal_m1911": {500};
		case "RH_mak": {30000};
		case "RH_8Rnd_9x18_Mak": {500};
		case "RH_mk2": {30000};
		case "RH_10Rnd_22LR_mk2": {500};

		case "pop_vendas": {10};
		case "pop_vendas_c": {10};
		case "pop_morfina": {10};
		case "pop_epinefrina": {10};
		case "pop_tramadol": {10};
		case "pop_desfibrilador": {5000};
		case "pop_bolsadesangre": {10};
		case "pop_oxigeno": {100};
		case "pop_jarabe": {100};
		case "pop_aguaoxigenada": {100};
		case "pop_cajademedicamentos": {100};
		case "pop_yodo": {100};
		case "pop_csi": {100};
		case "pop_bisturi_item": {5000};
		case "CL_extinguisher": {1500};

		case "pop_armariog": {80000};
		case "pop_armariop": {80000};

		case "pop_rabano_s": {45};
		case "pop_trigo_s": {45};
		case "pop_algodon_s": {55};
		case "pop_maiz_s": {55};
		case "pop_bamboo_s": {55};
		case "pop_cannabis_s": {250};
		case "pop_girasol_s": {55};

		case "pop_linterna": {100};
		case "pop_pico": {1500};
		case "pop_hacha": {1500};
		case "pop_pala": {1500};
		case "ItemRadio": {100};
		case "ToolKit": {300};
		case "ItemMap": {100};
		case "pop_note": {250};
		case "Binocular": {750};
		case "pop_iphone": {500};
		case "pop_nokia": {250};
		case "ItemGPS": {150};
		case "pop_llaves": {150};
		case "pop_portatil": {1500};
		case "cl_picket_rtp": {250};
		case "cl_picket_mlnw": {250};
		case "cl_picket_ftp": {250};
		//case "tf_fadak": {50000};
		//case "tf_anprc152": {50000};
		//case "tf_anprc148jem": {50000};
		case "cl_axe": {250};
		case "cl_pick_axeweap": {250};
		case "POP_senal_cuadrada_i": {250};
		case "POP_senal_alcoholemiagc_i": {250};
		case "POP_senal_control_policia_i": {250};
		case "POP_senal_stop_i": {250};
		case "POP_senal_derecha_i": {250};
		case "POP_senal_izquierda_i": {250};
		case "POP_senal_estrechamiento_i": {250};
		case "POP_senal_velocidad20_i": {250};
		case "POP_senal_velocidad40_i": {250};
		case "POP_banda_i": {250};
		case "POP_tetrapodo_i": {250};
		case "POP_tetrapodo_x3_i": {250};
		case "POP_tetrapodo_x5_i": {250};
		case "POP_tetrapodo_x7_i": {250};
		case "POP_electroflare_i": {250};
		case "optic_Arco": {25000};
		//case "NVGoggles": {60000};

		case "Press_Mic_AAN_F": {2500};
		case "Press_Mic_CNN_F": {2000};
		case "POPTV_Pop": {2500};
		case "H_Cap_press": {2000};
		case "V_Press_F": {2000};
		case "Tv_Camera": {2000};

		case "pop_correos": {5500};
	};
	_n = round (_n * desc); // aplicamos descuento, si lo hubiese
} else { // venta
	_n = switch (_cosa) do {
		case "pop_coca_b": {700};
		case "pop_efedrina_b": {800};
		case "pop_opio_b": {800};
		case "pop_cannabis_i": {750};
		case "pop_cocaina_f": {4000};
		case "pop_metanfetamina_f": {4000};
		case "pop_heroina_f": {4000};
		case "pop_marihuana_f": {4000};
		case "pop_basura_item":{150};

        case "pop_ojos_item": {10000};
		case "pop_corazon_item": {25000};
		case "pop_estomago_item": {50000};

		case "pop_pez":{650};
		case "pop_pez2":{700};
		case "pop_pez3":{600};
		case "pop_pez4":{750};
		case "pop_tiburon":{1200};
	};
  };

// Por si acaso
if (isNil {_n}) exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};
if ((typeName _n) != "SCALAR") exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};

round _n