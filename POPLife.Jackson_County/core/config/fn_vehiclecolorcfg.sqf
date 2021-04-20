/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = param [0,"",[""]];
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{

	case "ivory_wrx_cop_marked": {
		_path = "\ivory_wrx\data\";
		_ret =
		[
			[_path + "pd.paa","cop"],
			[_path + "sert.paa","cop"],
			[_path + "so.paa","cop"],
			[_path + "st.paa","cop"]
		];
	};
	case "ivory_wrx_cop_unmarked": {
		_path = "\ivory_wrx\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","cop","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,0.95,CA)"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","cop","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,0.95,CA)"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","cop","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,0.95,CA)"]
		];
	};
	case "ivory_wrx_cop_slicktop": {
		_path = "\ivory_wrx\data\";
		_ret =
		[
			[_path + "pd.paa","cop"],
			[_path + "sert.paa","cop"],
			[_path + "so.paa","cop"],
			[_path + "st.paa","cop"]
		];
	};
	case "ivory_wrx_med_ems": {
		_path = "\ivory_wrx\data\";
		_ret =
		[
			[_path + "ems.paa","med"]
		];
	};
	case "ivory_wrx": {
		_path = "\ivory_wrx\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["##(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "redblack.paa","civ"],
			[_path + "bluecamo.paa","civ"],
			[_path + "nyan.paa","civ"],
			[_path + "blackgray.paa","civ"],
			[_path + "rpd.paa","civ"],
			[_path + "monster.paa","civ"],
			[_path + "graystripe.paa","civ"],
			[_path + "candy.paa","civ"],
			[_path + "sportorange.paa","civ"],
			[_path + "doritos.paa","civ"],
			["#(argb,8,8,3)color(0,0,0.545098,1.0,CO)","civ","#(argb,8,8,3)color(0.501961,0.501961,0,1.0,CO)"],
			["#(argb,8,8,3)color(0.411765,0.721569,0.819608,1.0,CO)","civ","#(argb,8,8,3)color(0.411765,0.721569,0.819608,1.0,CO)","#(argb,8,8,3)color(0,0,0,0.95,CA)"]
		];
	};
	case "ivory_gt500": {
		_path = "\ivory_gt500\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "bodyBG.paa","civ"],
			[_path + "bodyGB.paa","civ"],
			[_path + "bodyRW.paa","civ"],
			[_path + "bodyWB.paa","civ"]
		];
	};
	case "ivory_c": {
		_path = "\ivory_c\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "bentley_con_livery01.paa","civ"],
			[_path + "bentley_con_livery02.paa","civ"],
			[_path + "bentley_con_livery03.paa","civ"],
			[_path + "bentley_con_livery04.paa","civ"],
			[_path + "gee.paa","civ"],
			[_path + "race.paa","civ"],
			[_path + "goldee.paa","civ"],
			[_path + "camo.paa","civ"],
			[_path + "velvet.paa","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ","#(argb,8,8,3)color(1,1,1,1.0,CO)","#(argb,8,8,3)color(0,0,0,0.85,CA)"]
		];
	};

	case "ivory_lfa": {
		_path = "\ivory_lfa\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "sports1.paa","civ"],
			[_path + "sports2.paa","civ"],
			[_path + "sports3.paa","civ"],
			[_path + "sports4.paa","civ"],
			[_path + "sports5.paa","civ"],
			[_path + "wtf.paa","civ"],
			[_path + "monty.paa","civ"],
			[_path + "nyan.paa","civ"],
			[_path + "deuce.paa","civ"],
			[_path + "woodland.paa","civ"],
			[_path + "neon.paa","civ"],
			[_path + "tokyo.paa","civ"],
			[_path + "supreme.paa","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"]
		];
	};


	case "IVORY_PRIUS": {
		_path = "\IVORY_Prius\data\";
		_ret =
		[
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,1,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.501961,1,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.25098,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.541176,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,1,1.0,CO)","civ"],
			[_path + "tex_sports1_co.paa","civ"],
			[_path + "tex_sports2_co.paa","civ"],
			[_path + "tex_sports3_co.paa","civ"],
			[_path + "tex_sports4_co.paa","civ"],
			[_path + "tex_taxi1_co.paa","civ"]

		];
	};

	case "IVORY_R8SPYDER": {
		_path = "\IVORY_R8SPYDER\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "audi_r8_livery01_hr.paa","civ"],
			[_path + "audi_r8_livery02_hr.paa","civ"],
			[_path + "audi_r8_livery03_hr.paa","civ"],
			[_path + "audi_r8_livery04_hr.paa","civ"]
		];
	};

	case "IVORY_R8": {
		_path = "\IVORY_R8SPYDER\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "audi_r8_livery01_hr.paa","civ"],
			[_path + "audi_r8_livery02_hr.paa","civ"],
			[_path + "audi_r8_livery03_hr.paa","civ"],
			[_path + "audi_r8_livery04_hr.paa","civ"]

		];


	};

	case "IVORY_REV": {
		_path = "\IVORY_REV\data\";
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.027451,0.211765,0.972549,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.843137,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0.501961,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.501961,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0.411765,0.705882,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0.501961,0,0.501961,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,0,0,1.0,CO)","civ"],
			["#(argb,8,8,3)color(0,0.333333,0.290196,1.0,CO)","civ"],
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","civ"],
			[_path + "lamborghini_reventon_livery01_hr.paa","civ"],
			[_path + "lamborghini_reventon_livery02_hr.paa","civ"],
			[_path + "lamborghini_reventon_livery03_hr.paa","civ"],
			[_path + "lamborghini_reventon_livery04_hr.paa","civ"]
		];
	};

	case "O_Heli_Transport_04_F": {
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","cop","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,1.0,CO)"]
		];
	};

	case "O_Heli_Transport_04_covered_F": {
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","cop","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,1.0,CO)","#(argb,8,8,3)color(0,0,0,1.0,CO)"]
		];
	};
	case "O_Heli_Transport_04_medevac_F": {
		_ret =
		[
			["#(argb,8,8,3)color(1,1,1,1.0,CO)","cop","#(argb,8,8,3)color(1,1,1,1.0,CO)","#(argb,8,8,3)color(1,1,1,1.0,CO)","#(argb,8,8,3)color(1,1,1,1.0,CO)"]
		];
	};
	case "I_Heli_light_03_unarmed_F": {
		_ret =
		[
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","cop"]

		];
	};

	// Default Cars

	case "C_SUV_01_F":
	{
		_ret =
		[
            ["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"]
		];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","cop",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			["#(argb,8,8,3)color(0,0,0,1.0,CO)","cop"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"]
		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["#(argb,8,8,3)color(0.89,0.03,0,1)","med"]
		];
	};

	case "C_Heli_Light_01_civil_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["#(argb,8,8,3)color(0.89,0.03,0,1)","med"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["#(argb,8,8,3)color(0.89,0.03,0,1)","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};

	case "O_Heli_Attack_02_black_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
};

_ret;
