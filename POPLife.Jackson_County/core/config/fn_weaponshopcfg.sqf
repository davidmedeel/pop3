#include <macro.h>
/*
        File: fn_weaponShopCfg.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Master configuration file for the weapon shops.

        Return:
        String: Close the menu
        Array:
        [Shop Name,
        [ //Array of items to add to the store
                [classname,Custom Name (set nil for default),price]
        ]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
    case "med_basic":
    {
        if (playerSide != independent) then  {
        "No eres un medico de las EMS";
     	} else {
                ["Hospital EMS Shop",
                    [

						["itemRadio",nil,500 * Desc],
                        ["ItemGPS",nil,500 * Desc],
                        ["Binocular",nil,350 * Desc],
                        ["ToolKit",nil,1500 * Desc],
                        ["EMTRM_uni",nil,250 * Desc],
						["B_Carryall_cbr",nil,100 * Desc],
						["EMTRM_uni",nil,5000 * Desc],
						["emt_Uni1",nil,5000 * Desc],
						["emt_Uni3",nil,5000 * Desc],
						["emsoff_uni",nil,5000 * Desc],
						["fire_uni1",nil,5000 * Desc],
						["fire_uni2",nil,5000 * Desc],
						["fireoff_uni",nil,5000 * Desc],
						["H_Orel_FireFighter",nil,850 * Desc],
						["H_Orel_FireFighter_Gaz",nil,850 * Desc],
						["firehat",nil,850 * Desc],
						["V_TacVestIR_blk",nil,300 * Desc],
						["V_TacVest_blk",nil,300 * Desc],
						["V_RebreatherB",nil,300 * Desc],
						["V_Firefighter",nil,300 * Desc],
						["B_FieldPack_ocamo",nil,300 * Desc],
						["B_Carryall_oucamo",nil,300 * Desc],
						["B_TacticalPack_blk",nil,300 * Desc],
						["U_B_Wetsuit",nil,2000 * Desc],
						["G_Diving",nil,500 * Desc],
						["V_RebreatherB",nil,5000 * Desc],
						["tf_anprc152",nil,5000 * Desc]
                    ]
                ];
        };
    };


	case "cop_basic":
	{
		if (playerSide != west) then {
			"No eres un policia!";
		}else{
		       _tiendanombre = "Armeria Policia";
			   _array = [
						["Taser_26",nil,200 * Desc],
						["26_cartridge",nil,50 * Desc],
						["CUP_hgun_BallisticShield_Armed",nil,1500 * Desc],
						["Binocular",nil,150 * Desc],
						["ItemGPS",nil,100 * Desc],
						["FHQ_optic_HWS_G33",nil,100 * Desc],
						["ToolKit",nil,250 * Desc],
						["acc_flashlight",nil,250 * Desc],
						["g36_mag",nil,250 * Desc],
						["RH_eothhs1",nil,250 * Desc],
						["prpl_benelli_muzzle_break",nil,250 * Desc],
						["prpl_benelli_rail",nil,2500 * Desc],
						["O_IR_Grenade",nil,500 * Desc],
						["Orel_Matraque",nil,500 * Desc],
						["hlc_muzzle_556NATO_KAC",nil,500 * Desc],
						["RH_usp", nil, 2000 * Desc],
						["RH_12Rnd_45cal_usp", nil, 200 * Desc],
						["SmokeShell", nil, 200 * Desc],
						["iansky_nfbeast", nil, 200 * Desc],
						["cl_plastic_shield", nil, 200 * Desc],
						["hlc_20rnd_762x51_b_G3", nil, 200 * Desc],
						["acc_flashlight", nil, 200 * Desc],
						["CUP_15Rnd_9x19_M9", nil, 200 * Desc],
						["hlc_muzzle_snds_M14", nil, 200 * Desc],
						["RH_15Rnd_9x19_M9", nil, 200 * Desc],
						["RH_eotech553mag", nil, 200 * Desc],
						["RH_15Rnd_9x19_M9", nil, 200 * Desc],
						["pop_tetrapodo_i",nil,500 * Desc],
						["hlc_30rnd_556x45_b_HK33",nil,500 * Desc],
						["hlc_rifle_m14sopmod",nil,5000 * Desc],
						["G36K",nil,5000 * Desc],
						["RH_m9",nil,5000 * Desc],
						["CUP_hgun_BallisticShield_Armed",nil,5000 * Desc],
						["franchi",nil,5000 * Desc],
						["hlc_rifle_hk53RAS",nil,5000 * Desc],
						["RH_hk416c_tg",nil,5000 * Desc],
						["hlc_rifle_PSG1A1_RIS",nil,5000 * Desc],
						["6Rnd_12Gauge_Pellets",nil,500 * Desc],
						["acc_flashlight",nil,500 * Desc],
						["pop_tetrapodo_x3_i",nil,500 * Desc],
						["hlc_20Rnd_762x51_B_M14",nil,500 * Desc],
						["pop_tetrapodo_x5_i",nil,500 * Desc],
						["RH_qdss_nt4",nil,500 * Desc],
						["pop_tetrapodo_x7_i",nil,500 * Desc],
						["hlc_30Rnd_9x19_B_MP5",nil,500 * Desc],
						["RH_eotech553mag",nil,500 * Desc],
						["acc_flashlight",nil,500 * Desc],
						["cl_speedgun",nil,500 * Desc],
						["POP_banda_i",nil,500 * Desc],
						["POP_electroflare_i",nil,500 * Desc],
						["POP_senal_alcoholemiagc_i",nil,500 * Desc],
						["POP_senal_control_policia_i",nil,500 * Desc],
						["POP_senal_izquierda_i",nil,500 * Desc],
						["CUP_hgun_BallisticShield_Armed",nil,500 * Desc],
						["POP_senal_derecha_i",nil,500 * Desc],
						["POP_senal_stop_i",nil,500 * Desc],
						["POP_senal_estrechamiento_i",nil,500 * Desc],
						["POP_senal_velocidad20_i",nil,500 * Desc],
						["POP_senal_velocidad40_i",nil,500 * Desc],
						["hlc_smg_mp5k_PDW",nil,5000 * Desc],
						["FHQ_optic_HWS",nil,200 * Desc],
						["RH_15Rnd_9x19_M9",nil,200 * Desc],
						["Acc_flashlight",nil,200 * Desc],
					    // Apartir de LVL 1 y LVL 3
						["RH_m9",nil,200 * Desc],
						// Apartir de LVL 2 y LVL 4
						["RH_m9L",nil,200 * Desc],
						// Solo LVL 3 y 4
						["ffaa_armas_sdassc",nil,2500 * Desc],
						["ffaa_cal12_escopeta",nil,500* Desc],
						["ffaa_optic_holografico",nil,2500 * Desc],
                        // solo LVL 4
                        ["ffaa_armas_sdass",nil,2500 * Desc],
						["ffaa_armas_ump",nil,2500 * Desc],
						["ffaa_9x19_ump",nil,200 * Desc],
						// Solo LVL 5
						["CUP_arifle_G36C",nil,2500 * Desc],
						["CUP_30Rnd_556x45_G36",nil,500 * Desc],
						["CUP_arifle_L85A2",nil,2500 * Desc],
						["CUP_30Rnd_556x45_Stanag",nil,500 * Desc],
						// Solo LV 6 o mas
						["RH_m9",nil,2500 * Desc],
						["CUP_bizon",nil,2500 * Desc],
						["CUP_64Rnd_9x19_Bizon_M",nil,500 * Desc],
						["CUP_srifle_M24_des_LeupoldMk4LRT",nil,2500 * Desc],
						["CUP_5Rnd_762x51_M24",nil,500 * Desc],
						["CUP_arifle_CZ805_B_GL",nil,2500 * Desc],
						["CUP_30Rnd_556x45_Stanag",nil,500 * Desc],
						["SUPER_flash",nil,200 * Desc],
						["ffaa_optic_leopol",nil,500 * Desc]
						];
				if (__GETC__(life_coplevel) == 1) then {
					_array resize 24;
				};
				if (__GETC__(life_coplevel) == 2) then {
					_array deleteAt 25;
					_array resize 24;
				};
				if (__GETC__(life_coplevel) == 3) then {
					_array deleteAt 26;
					_array resize 27;
				};
				if (__GETC__(life_coplevel) == 4) then {
					_array deleteAt 25;
					_array deleteAt 26;
					_array resize 30;
				};
				if ((__GETC__(life_coplevel) == 5) || (__GETC__(life_coplevel) == 7)) then {
					_array deleteRange [25,32];
	                _array resize 27;
				};
				[_tiendanombre,[ _array]];
			};

	}; // case cop basica


	case "taxista_tienda":
	{
			["Tienda de Taxista",
					[
					    ["itemRadio",nil,1500 * Desc],
						["Binocular",nil,1500 * Desc],
						["ItemGPS",nil,1000 * Desc],
						["ToolKit",nil,2500 * Desc]
					]
			];
	};

	case "periodista_tienda":
	{
			["Tienda de Periodista",
					[
					    ["itemRadio",nil,1500 * Desc],
						["Press_Mic_AAN_F",nil,1500 * Desc],
						["Press_Cam_F",nil,3000 * Desc],
						["Press_Mic_CNN_F",nil,1500 * Desc],
						["ItemGPS",nil,1000 * Desc],
						["ToolKit",nil,2500 * Desc],
						["POPTV_Pop",nil,3000 * Desc],
						["H_Cap_press",nil,3000 * Desc],
						["V_Press_F",nil,3000 * Desc],
						["cl3_civ_tacticalbelt_black",nil,3000 * Desc]
					]
			];
	};

	case "genstore":
	{
				["Altis General Store",
					[
						["itemRadio",nil,1500 * Desc],
						["Binocular",nil,1500 * Desc],
						["ItemGPS",nil,1000 * Desc],
						["ToolKit",nil,2500 * Desc],
						["FirstAidKit",nil,1500 * Desc],
						["Chemlight_red",nil,3000 * Desc],
						["Chemlight_yellow",nil,3000 * Desc],
						["Chemlight_green",nil,3000 * Desc],
						["Chemlight_blue",nil,3000 * Desc]
				]
			];
	};
};
