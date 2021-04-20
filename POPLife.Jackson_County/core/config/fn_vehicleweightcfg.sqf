/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{

	case "max_H3": {45};
	case "max_H3_black": {10};
	case "max_H3_yellow": {45};

	case "I_Truck_02_covered_F": {175};
	case "A3L_EvoXBlack": {10};
	case "A3L_EvoXWhite": {35};
	case "A3L_EvoXRed": {35};

	case "IVORY_PRIUS": {25};

	case "S_Vantage_Red": {25};
	case "S_Vantage_Blue": {25};
	case "S_Vantage_Yellow": {25};
	case "S_Vantage_Black": {25};
	case "S_Vantage_LightBlue": {25};
	case "S_Vantage_Purple": {25};
	case "S_Vantage_White": {25};

	case "A3L_ChargerUC": {25};
	case "A3L_ChargerUCWhite": {25};

	case "A3L_CVWhite": {25};
	case "A3L_CVBlack": {25};
	case "A3L_CVGrey": {25};
	case "A3L_CVRed": {25};
	case "A3L_CVPink": {25};
	case "A3L_CVBlue": {25};

	case "A3L_CVPILBFD": {25};

	case "A3L_CVPIUC": {25};
	case "A3L_CVPIUCBlack": {25};
	case "A3L_CVPIUCWhite": {25};
	case "A3L_CVPIUCGrey": {25};
	case "A3L_CVPIUCRed": {25};
	case "A3L_CVPIUCPink": {25};
	case "A3L_CVPIUCBlue": {25};

	case "Jonzie_Mini_Cooper": {25};

	case "S_McLarenP1_Black": {25};
	case "S_McLarenP1_Blue": {25};
	case "S_McLarenP1_Orange": {25};
	case "S_McLarenP1_White": {25};
	case "S_McLarenP1_Yellow": {25};
	case "S_McLarenP1_Silver": {25};

	case "S_PorscheRS_Black": {25};
	case "S_PorscheRS_Yellow": {25};
	case "S_PorscheRS_White": {25};

	case "IVORY_REV": {25};
	case "IVORY_R8SPYDER": {25};
	case "IVORY_R8": {25};

	case "A3L_GrandCaravanUC": {25};
	case "A3L_GrandCaravanUCBlack": {25};

	case "A3L_Bus": {30};

	case "A3L_TaurusFPBLBPD": {25};
	case "A3L_TaurusFPBLBCSO": {25};
	case "A3L_TaurusFPBPD": {25};
	case "A3L_TaurusFPBPDGM": {25};
	case "A3L_TaurusFPBCSO": {25};
	case "A3L_TaurusUCBlack": {25};
	case "A3L_TaurusUCGrey": {25};
	case "A3L_TaurusUCWhite": {25};
	case "A3L_TaurusUCBlue": {25};

	case "A3L_CVPIFPBPD": {25};
	case "A3L_CVPIFPBCSO": {25};
	case "A3L_CVPIFPBFG": {25};
	case "A3L_CVPIFPBLBPD": {25};
	case "A3L_CVPIFPBLBFG": {25};

	case "A3L_TahoeUCPB": {25};
	case "A3L_TahoeUC": {25};
	case "A3L_TahoeUCGMPB": {25};
	case "A3L_TahoeCSOLBPB": {25};

	case "A3L_jailBus": {25};

	case "A3L_Suburban": {25};
	case "A3L_SuburbanCSO": {25};
	case "A3L_SuburbanFG": {25};

	case "A3L_AmberLamps": {25};
	case "A3L_Laddertruck": {25};

	case "A3L_Karts": {5};
	case "A3L_Towtruck": {0};
	case "M1030": {25};

	case "A3L_Escort": {25};
	case "A3L_EscortTaxi": {25};
	case "A3L_EscortBlue": {25};
	case "A3L_EscortWhite": {25};
	case "A3L_EscortPink": {25};

	case "A3L_PuntoRed": {35};
	case "A3L_PuntoBlack": {35};
	case "A3L_PuntoWhite": {35};
	case "A3L_PuntoGrey": {35};

	case "A3L_FordKaBlue": {35};
	case "A3L_FordKaRed": {35};
	case "A3L_FordKaBlack": {35};
	case "A3L_FordKaWhite": {35};
	case "A3L_FordKaGrey": {35};

	case "A3L_RegalBlack": {35};
	case "A3L_RegalBlue": {35};
	case "A3L_RegalOrange": {35};
	case "A3L_RegalRed": {35};
	case "A3L_RegalWhite": {35};

	case "A3L_JeepWhiteBlack": {35};
	case "A3L_JeepGreenBlack": {35};
	case "A3L_JeepRedTan": {35};
	case "A3L_JeepRedBlack": {35};
	case "A3L_JeepGrayBlack": {35};

	case "A3L_SuburbanWhite": {45};
	case "A3L_SuburbanBlue": {45};
	case "A3L_SuburbanRed": {45};
	case "A3L_SuburbanBlack": {45};
	case "A3L_SuburbanGrey": {45};
	case "A3L_SuburbanOrange": {45};

	case "A3L_TahoeWhite": {45};
	case "A3L_TahoeRed": {45};
	case "A3L_TahoeBlue": {45};

	case "A3L_Camaro": {55};

	case "A3L_Taurus": {35};
	case "A3L_TaurusBlack": {35};
	case "A3L_TaurusBlue": {35};
	case "A3L_TaurusRed": {35};
	case "A3L_TaurusBlue": {35};

	case "A3L_Challenger": {35};
	case "A3L_ChallengerGreen": {35};
	case "A3L_ChallengerRed": {35};
	case "A3L_ChallengerWhite": {35};
	case "A3L_ChallengerBlack": {35};
	case "A3L_ChallengerBlue": {35};

	case "A3L_ChargerBlack": {45};
	case "A3L_ChargerWhit": {45};
	case "A3L_ChargerCstm": {45};

	case "A3L_VolksWagenGolfGTired": {35};
	case "A3L_VolksWagenGolfGTiblack": {35};
	case "A3L_VolksWagenGolfGTiblue": {35};
    case "A3L_VolksWagenGolfGTiwhite": {35};

	case "A3L_AMC": {35};
	case "A3L_AMXRed": {35};
	case "A3L_AMXWhite": {35};
	case "A3L_AMXBlue": {35};
	case "A3L_AMXGL": {35};

	case "A3L_VolvoS60RBlack": {35};
	case "A3L_VolvoS60Rred": {35};

	case "S_Skyline_Red": {35};
	case "S_Skyline_Blue": {35};
	case "S_Skyline_Black": {35};
	case "S_Skyline_Yellow": {35};
	case "S_Skyline_Purple": {35};
	case "S_Skyline_White": {35};


	case "A3L_Cooper_concept_blue": {25};
	case "A3L_Cooper_concept_black": {25};
	case "A3L_Cooper_concept_red": {25};
	case "A3L_Cooper_concept_white": {25};

	case "A3L_Ferrari458black": {25};
	case "A3L_Ferrari458white": {25};
	case "A3L_Ferrari458blue": {25};

	case "A3L_GrandCaravan": {25};
	case "A3L_GrandCaravanBlk": {25};
	case "A3L_GrandCaravanBlue": {25};
	case "A3L_GrandCaravanGreen": {25};
	case "A3L_GrandCaravanRed": {25};
	case "A3L_GrandCaravanPurple": {25};


	case "Jonzie_Viper": {50};
	case "A3L_F350Black": {85};
	case "A3L_F350Blue": {85};
	case "A3L_F350Red": {85};
	case "A3L_F350White": {85};
	case "A3L_Dumptruck": {150};

	//CL3 Coches

	case "cl3_lamborghini_gt1_2tone1": {30};
	case "cl3_lamborghini_gt1_2tone2": {30};
	case "cl3_lamborghini_gt1_2tone3": {30};
	case "cl3_lamborghini_gt1_2tone4": {30};
	case "cl3_lamborghini_gt1_2tone5": {30};
	case "cl3_lamborghini_gt1_black": {30};
	case "cl3_lamborghini_gt1_blue": {30};
	case "cl3_lamborghini_gt1_red": {30};
	case "cl3_lamborghini_gt1_white": {30};
	case "cl3_lamborghini_gt1_camo": {30};
	case "cl3_lamborghini_gt1_camo_urban": {30};
	case "cl3_lamborghini_gt1_flame": {30};
	case "cl3_lamborghini_gt1_flame1": {30};
	case "cl3_lamborghini_gt1_flame2": {30};
	case "cl3_lamborghini_gt1_gold": {30};
	case "cl3_batmobile": {60};
	case "cl3_reventon_lime": {30};
	case "cl3_lamborghini_gt1_silver": {30};
	case "cl3_lamborghini_gt1_babyblue": {30};
	case "cl3_lamborghini_gt1_babypink": {30};
	case "cl3_lamborghini_gt1_lime": {30};
	case "cl3_reventon_2tone2": {30};
	case "cl3_reventon_2tone3": {30};
	case "cl3_reventon_2tone5": {30};
	case "cl3_reventon_flame": {30};
	case "cl3_reventon_flame1": {30};
	case "cl3_reventon_flame2": {30};
	case "cl3_reventon_gold": {30};
	case "cl3_reventon_lime": {30};
	case "cl3_murcielago_2tone2": {30};
	case "cl3_murcielago_2tone3": {30};
	case "cl3_murcielago_2tone4": {30};
	case "cl3_murcielago_2tone5": {30};
	case "cl3_murcielago_black": {30};
	case "cl3_murcielago_blue": {30};
	case "cl3_murcielago_red": {30};
	case "cl3_murcielago_camo": {30};
	case "cl3_murcielago_camo_urban": {30};
	case "cl3_murcielago_flame": {30};
	case "cl3_murcielago_flame1": {30};
	case "cl3_murcielago_flame2": {30};
	case "cl3_murcielago_gold": {30};
	case "cl3_murcielago_silver": {30};
	case "cl3_murcielago_lavander": {30};
	case "cl3_z4_2008_black": {30};
	case "cl3_z4_2008_blue": {30};
	case "cl3_z4_2008_silver": {30};
	case "cl3_z4_2008_red": {30};
	case "cl3_z4_2008_white": {30};
	case "cl3_z4_2008_lime": {30};
	case "cl3_z4_2008_camo": {30};
	case "cl3_z4_2008_camo_urban": {30};
	case "cl3_z4_2008_lavander": {30};
	case "cl3_z4_2008_yellow": {30};
	case "cl3_z4_2008_orange": {30};
	case "cl3_z4_2008_gold": {30};
	case "cl3_z4_2008_babyblue": {30};
	case "cl3_z4_2008_babypink": {30};
	case "cl3_z4_2008_sand": {30};
	case "cl3_r8_spyder_flame": {30};
	case "cl3_r8_spyder_flame1": {30};
	case "cl3_r8_spyder_flame2": {30};
	case "cl3_r8_spyder_2tone2": {30};
	case "cl3_r8_spyder_2tone3": {30};
	case "cl3_r8_spyder_2tone4": {30};
	case "cl3_r8_spyder_2tone5": {30};
	case "cl3_r8_spyder_lime": {30};
	case "cl3_r8_spyder_agua": {30};
	case "cl3_458_2tone1": {30};
	case "cl3_458_2tone2": {30};
	case "cl3_458_2tone3": {30};
	case "cl3_458_2tone4": {30};
	case "cl3_458_2tone5": {30};
	case "cl3_458_agua": {30};
	case "cl3_458_babyblue": {30};
	case "cl3_458_babypink": {30};
	case "cl3_458_black": {30};
	case "cl3_458_blue": {30};
	case "cl3_458_burgundy": {30};
	case "cl3_458_camo": {30};
	case "cl3_458_camo_urbam": {30};
	case "cl3_458_cardinal": {30};
	case "cl3_458_dark_green": {30};
	case "cl3_458_flame": {30};
	case "cl3_458_flame2": {30};
	case "cl3_458_gold": {30};
	case "cl3_458_green": {30};
	case "cl3_458_lavander": {30};
	case "cl3_458_lime": {30};
	case "cl3_458_red": {30};
	case "cl3_458_sand": {30};
	case "cl3_458_silver": {30};
	case "cl3_458_white": {30};
	case "cl3_carrera_gt_aqua": {30};
	case "cl3_carrera_gt_black": {30};
	case "cl3_carrera_gt_blue": {30};
	case "cl3_carrera_gt_camo": {30};
	case "cl3_carrera_gt_camo_urban": {30};
	case "cl3_carrera_gt_gold": {30};
	case "cl3_carrera_gt_lavander": {30};
	case "cl3_carrera_gt_orange": {30};
	case "cl3_carrera_gt_silver": {30};
	case "cl3_carrera_gt_white": {30};
	case "cl3_carrera_gt_yelow": {30};
	case "cl3_suv_taxi": {30};
	case "cl3_dbs_volante_black": {30};
	case "cl3_dbs_volante_blue": {30};
	case "cl3_dbs_volante_red": {30};
	case "cl3_dbs_volante_white": {30};
	case "cl3_dbs_volante_silver": {30};
	case "cl3_dbs_volante_lime": {30};
	case "cl3_dbs_volante_flame": {30};
	case "cl3_dbs_volante_flame2": {30};
	case "cl3_dbs_volante_orange": {30};
	case "cl3_dbs_volante_babypink": {30};
	case "cl3_dbs_volante_yellow": {30};
	case "cl3_dbs_volante_lavander": {30};
	case "cl3_dbs_volante_green": {30};
	case "cl3_dbs_volante_sand": {30};
	case "cl3_e60_m5_blue": {50};
	case "cl3_e60_m5_camo": {50};
	case "cl3_e60_m5_camo_urban": {50};
	case "cl3_e60_m5_gold": {50};
	case "cl3_e60_m5_lime": {50};
	case "cl3_e60_m5_babyblue": {50};
	case "cl3_e60_m5_babypink": {50};
	case "cl3_e60_m5_orange": {50};
	case "cl3_e60_m5_purple": {50};
	case "cl3_e60_m5_black": {50};
	case "cl3_e63_amg_blue": {50};
	case "cl3_e63_amg_red": {50};
	case "cl3_e63_amg_silver": {50};
	case "cl3_e63_amg_white": {50};
	case "cl3_e63_amg_camo": {50};
	case "cl3_e63_amg_camo_urban": {50};
	case "cl3_e63_amg_line": {50};
	case "cl3_e63_amg_orange": {50};
	case "cl3_e63_amg_purple": {50};
	case "cl3_e63_amg_babypink": {50};
	case "cl3_golf_learner_white": {60};
	case "cl3_golf_mk2_black": {60};
	case "cl3_golf_mk2_blue": {60};
	case "cl3_golf_mk2_camo": {60};
	case "cl3_golf_mk2_babypink": {60};
	case "cl3_golf_mk2_babyblue": {60};
	case "cl3_golf_mk2_red": {60};
	case "cl3_golf_mk2_gold": {60};
	case "cl3_golf_mk2_lavander": {60};
	case "cl3_golf_mk2_lime": {60};
	case "cl3_golf_mk2_sand": {60};
	case "cl3_golf_mk2_white": {60};
	case "cl3_insignia_black": {60};
	case "cl3_insignia_blue": {60};
	case "cl3_insignia_red": {60};
	case "cl3_insignia_silver": {60};
	case "cl3_insignia_orange": {60};
	case "cl3_insignia_camo": {60};
	case "cl3_insignia_babyblue": {60};
	case "cl3_insignia_babypink": {60};
	case "cl3_insignia_sand": {60};
	case "cl3_insignia_white": {60};
	case "cl3_polo_gti_black": {60};
	case "cl3_polo_gti_blue": {60};
	case "cl3_polo_gti_red": {60};
	case "cl3_polo_gti_silver": {60};
	case "cl3_polo_gti_white": {60};
	case "cl3_polo_gti_babypink": {60};
	case "cl3_polo_gti_babyblue": {60};
	case "cl3_polo_gti_camo": {60};
	case "cl3_polo_gti_gold": {60};
	case "cl3_polo_gti_purple": {60};
	case "cl3_q7_black": {60};
	case "cl3_q7_blue": {60};
	case "cl3_q7_red": {60};
	case "cl3_q7_silver": {60};
	case "cl3_q7_camo": {60};
	case "cl3_q7_camo_urban": {60};
	case "cl3_q7_clpd": {60};
	case "cl3_q7_green": {60};
	case "cl3_q7_gold": {60};
	case "cl3_q7_lime": {60};
	case "cl3_q7_babyblue": {60};
	case "cl3_q7_babypink": {60};
	case "cl3_veyron_red_red": {60};
	case "cl3_dodge_charger_f_black": {60};
	case "cl3_dodge_charger_f_blue": {60};
	case "cl3_dodge_charger_f_camo": {60};
	case "cl3_dodge_charger_f_lime": {60};
	case "cl3_dodge_charger_f_red": {60};
	case "cl3_dodge_charger_f_pink": {60};
	case "cl3_dodge_charger_o_black": {60};
	case "cl3_dodge_charger_o_blue": {60};
	case "cl3_dodge_charger_o_red": {60};
	case "cl3_dodge_charger_o_camo": {60};
	case "cl3_dodge_charger_o_lime": {60};
	case "cl3_dodge_charger_o_pink": {60};
	case "cl3_dodge_charger_s_black": {60};
	case "cl3_dodge_charger_s_blue": {60};
	case "cl3_dodge_charger_s_camo": {60};
	case "cl3_dodge_charger_s_green": {60};
	case "cl3_dodge_charger_s_red": {60};
	case "cl3_dodge_charger_s_lime": {60};
	case "cl3_dodge_charger_s_pink": {60};
	case "cl3_dodge_chargerum_f_black": {60};
	case "cl3_dodge_chargerum_f_red": {60};
	case "cl3_dodge_chargerum_f_blue": {60};
	case "cl3_dodge_chargerum_f_camo": {60};
	case "cl3_dodge_chargerum_f_camo_urban": {60};
	case "cl3_dodge_chargerum_f_silver": {60};
	case "cl3_dodge_chargerum_f_orange": {60};
	case "cl3_dodge_chargerum_f_lime": {60};
	case "cl3_dodge_chargerum_f_pink": {60};
	case "cl3_dodge_chargerum_f_purple": {60};
	case "cl3_dodge_chargerum_s_black": {60};
	case "cl3_dodge_chargerum_s_blue": {60};
	case "cl3_dodge_chargerum_s_red": {60};
	case "cl3_dodge_chargerum_s_white": {60};
	case "cl3_dodge_chargerum_s_camo": {60};
	case "cl3_dodge_chargerum_s_green": {60};
	case "cl3_dodge_chargerum_s_pink": {60};
	case "cl3_volha_black": {60};
	case "cl3_volha_grey": {60};
	case "cl3_lada_red": {60};
	case "cl3_lada_white": {60};
	case "cl3_defender_110_cammo": {70};
	case "cl3_defender_110_red": {70};
	case "cl3_defender_110_yellow": {70};
	case "cl3_civic_vti_aqua": {60};
	case "cl3_civic_vti_babypink": {60};
	case "cl3_civic_vti_blue": {60};
	case "cl3_civic_vti_camo": {60};
	case "cl3_civic_vti_camo_urban": {60};
	case "cl3_civic_vti_gold": {60};
	case "cl3_civic_vti_green": {60};
	case "cl3_civic_vti_grey": {60};
	case "cl3_civic_vti_lime": {60};
	case "cl3_civic_vti_orange": {60};
	case "cl3_civic_vti_red": {60};
	case "cl3_civic_vti_white": {60};
	case "cl3_civic_vti_silver": {60};
	case "cl3_civic_vti_yellow": {60};
	case "cl3_transit_aqua": {80};
	case "cl3_transit_black": {80};
	case "cl3_transit_blue": {80};
	case "cl3_transit_silver": {80};
	case "cl3_transit_red": {80};
	case "cl3_transit_camo": {80};
	case "cl3_transit_babypink": {80};
	case "cl3_transit_lime": {80};
	case "cl3_transit_grey": {80};
	case "cl3_f150repo_blue": {60};
	case "cl3_f150repo_black": {60};
	case "cl3_f150repo_grey": {60};
	case "cl3_f150repo_orange": {60};
	case "cl3_f150repo_red": {60};
	case "CL3_Van_01_box_F_GreenCamo": {50};
	case "CL3_Van_01_box_F_red": {50};
	case "CL3_Van_01_box_F_white": {50};
	case "CL3_Van_01_transport_F_GreenCamo": {60};
	case "CL3_Van_01_transport_F_red": {60};
	case "CL3_Van_01_transport_F_white": {60};
	case "CL3_bus_cl_black": {60};
	case "CL3_bus_cl_blue": {60};
	case "CL3_bus_cl_grey": {60};
	case "CL3_bus_cl_purple": {60};
	case "CL3_bus_cl_yellow": {60};
	case "cl3_xr_1000_police": {20};
	case "cl3_enduro_police": {20};
	case "tcg_hrlycop": {20};

	//Motos CL3 y otros
	case "cl3_enduro_yellow": {10};
	case "cl3_enduro_black": {10};
	case "cl3_enduro_blue": {10};
	case "cl3_enduro_aqua": {10};
	case "cl3_enduro_babypink": {10};
	case "cl3_enduro_red": {10};
	case "cl3_enduro_burgundy": {10};
	case "cl3_enduro_cardinal": {10};
	case "cl3_enduro_dark_green": {10};
	case "cl3_enduro_gold": {10};
	case "cl3_enduro_green": {10};
	case "cl3_enduro_lavender": {10};
	case "cl3_enduro_flame": {10};
	case "cl3_enduro_flame1": {10};
	case "cl3_enduro_flame2": {10};
	case "cl3_chopper_gold": {10};
	case "Icl3_chopper_blue": {10};
	case "cl3_chopper_green": {10};
	case "cl3_chopper_red": {10};
	case "cl3_chopper_silver": {10};
	case "cl3_xr_1000_yellow": {10};
	case "cl3_xr_1000_black": {10};
	case "cl3_xr_1000_babypink": {10};
	case "cl3_xr_1000_burgundy": {10};
	case "cl3_xr_1000_red": {10};
	case "cl3_xr_1000_cardinal": {10};
	case "cl3_xr_1000_dark_green": {10};
	case "cl3_xr_1000_gold": {10};
	case "cl3_xr_1000_camo_urban": {10};
	case "cl3_xr_1000_white": {10};
	case "cl3_xr_1000_violet": {10};
	case "cl3_xr_1000_flame": {10};
	case "cl3_xr_1000_flame1": {10};
	case "cl3_xr_1000_flame2": {10};
	case "cl3_xr_1000_camo": {10};
	case "cl3_xr_1000_silver": {10};
	case "cl3_xr_1000_lime": {10};
	case "tcg_aprilia_black": {10};
	case "tcg_hrly_coco": {10};
	case "TT650_Ins": {10};
	case "M1030": {10};
	case "cl3_458_aqua": {30};
	case "cl3_458_orange": {30};
	case "cl3_carrera_gt_lime": {30};
	case "cl3_carrera_gt_red": {30};
	case "cl3_dbs_volante_lavender": {30};
	case "cl3_e63_amg_black": {50};
	case "cl3_e63_amg_lime": {50};
	case "cl3_insignia_lime": {60};
	case "C_Hatchback_01_F": {50};
	case "Jonzie_Mini_Cooper_R_spec": {50};
	case "S_Rangerover_Black": {60};
	case "cl3_civic_vti_black": {60};
	case "A3L_ChargerRed": {40};
	case "A3L_ChargerBlue": {40};


	// adds
	case "C_SUV_01_F": {30};
	case "C_Offroad_01_F": {40};
	case "HMMWV_M1035": {45};
	case "O_MRAP_02_F": {30};
	case "DAR_LHS_16": {400};
	case "ivory_b206": {95};
	case "O_Truck_02_box_F": {5};
	case "ivory_b206_rescue": {10};
	case "A3L_RX7_Black": {30};
	case "A3L_RX7_Blue": {30};
	case "A3L_RX7_Red": {30};
	case "A3L_RX7_White": {30};
	case "B_Truck_01_fuel_F": {100};
	case "B_Truck_01_transport_F": {10};
	case "cl3_mackr_del_forest_camo": {450};
	case "cl3_mackr_del_brown_camo": {450};
	case "cl3_mackr_del_american": {450};
	case "cl3_mackr_del_black_white": {450};
	case "A3L_SchoolBus": {30};


	// reb
	case "max_H3_urbancamo": {55};
	case "max_H3_vegeta": {55};
	case "HMMWV": {70};

	//helis

	case "ARMSCor_A109LUH_B": {60};
	case "ivory_b206_police": {60};
	case "IVORY_BELL512_POLICE": {60};
	case "ivory_b206": {60};
	case "ASL_AS350_1": {60};
	case "ARMSCor_A109_Civ": {60};
	case "Orel_Heli_Light_Samu": {60};
	
	// default
	case "B_G_Offroad_01_F": {45};
	case "B_Quadbike_01_F": {25};
	case "C_Hatchback_01_sport_F": {45};
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {150};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "CL3_Basic_Fishing_yellow": {58};
	case "CL3_Basic_Fishing_blue": {58};
	case "CL3_Basic_Fishing_green": {58};
	case "CL3_Basic_Fishing_grey": {58};
	case "CL3_Basic_Fishing_red": {58};
	case "O_Truck_03_transport_F": {200};
	case "B_Heli_Light_01_F": {90};
	case "O_Heli_Light_02_unarmed_F": {150};
	case "I_Heli_Transport_02_F": {150};
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {150};
	case "B_Boat_Armed_01_minigun_F": {150};
	case "I_Boat_Armed_01_minigun_F": {150};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "B_Truck_01_mover_F": {250};
	case "B_Truck_01_box_F": {300};
	case "O_Truck_03_ammo_F": {400};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {400};
	default {-1};
};