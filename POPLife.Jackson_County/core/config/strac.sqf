/*
Archivo: STrAC.sqf
Autor: Stirgoy
Para: Comunidad Gamer Polenizadores
Descripcion: Echa a los **** CHEATERS del servidor
AutoBlackList, Autokick.
antiDEvCon, NilVars, camera group, anti va y va2,var BL,antistrac, pbo BL, vgarage, contador de addon
*/
if ( isServer ) exitWith {};
//Funciones
private "_cargado";
_cargado = false;
stirgoYbaneAmancoS = { [[0,format["Lamentable %1 es un tramposo y utiliza cheats/hacks.", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;["pilladoh",false,true] call BIS_fnc_endMission; [99]call SOCK_fnc_updatePartial; };
waitUntil {!isnull player && player == player};
systemChat "STrAC Esperando al jugador...";
waitUntil { !(isNil "life_adminLevel" ) };

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__DeVcOn=
{
	private "_STrAC_DC";
	_STrAC_DC = true;
	while {_STrAC_DC} do
		{
			if !isNull (findDisplay 316000 ) then
			{
				["pilladoh",false,true] call BIS_fnc_endMission;
				[[0,format["STrAC: %2 · %1 se ha kickeado a si mismo: La consola de depuracion es solo para desarrollo.", name player,getPlayerUid player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[["spy_log",[" Consola de depuracion | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
				closeDialog 0;
				_STrAC_DC = false;
			};
	};
};


StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__NiLvArSdIn=
{
	private "_STrACN_NV";
	_STrACN_NV = true;
	while {_STrACN_NV} do
		{
			waitUntil { isNil "royal_din" OR isNil "royal_atm"};
				if ( isNil "royal_din" ) then
					{
						royal_din = 1;
					};
				if ( isNil "royal_atm" ) then
					{
						royal_atm = 1;
					};
				[["spy_log",[" Variables Nil . | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
			hint "ALGO VA MAL!!!! Avisa a un administrador o perderas todos los datos de tu cuenta. Puede que no estes guardando los datos en DB";
			sleep 1;
			_STrACN_NV = true;
		};
};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__GrOuPcAmErAoFf=
	{
		private "_STrAC_NC";_STrAC_NC = true;
		while {_STrAC_NC}do
			{
				waitUntil { (cameraView == "GROUP") };
				player switchCamera "EXTERNAL";
				sleep 0.3;
				 systemChat "STrAC · Camara no permitida";
				_STrAC_NC = true;
		};
	};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVaV1=
	{
		private "_STrAC_VA}";
		_STrAC_VA = true;
		while {_STrAC_VA}do
			{
				if  !(isnull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])) then
					{
						royal_din = -9999999;royal_atm = -9999999;
						[6]call SOCK_fnc_updatePartial;
						[99]call SOCK_fnc_updatePartial;
						["mancova",false,true] call BIS_fnc_endMission;
						[[0,format["STrAC: %2 · %1 se ha baneado a si mismo por usar: Virtual Arsenal.", name player,getPlayerUid player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
						[["spy_log",[" AntiVA | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;_STrAC_VA = false;
					};
					sleep 2;
			};
		};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVaV2=
	{
		private "_STrAC_VA2}";
		_STrAC_VA2 = true;
			while { _STrAC_VA2 } do
				{
					if (!isNull (uiNamespace getVariable ["RscDisplayArsenal",displayNull])) then
						{
							royal_din = -9999999;
							royal_atm = -9999999;
							[6]call SOCK_fnc_updatePartial;
							[99]call SOCK_fnc_updatePartial;
							["mancova",false,true] call BIS_fnc_endMission;
							[[0,format["STrAC: %2 · %1 se ha baneado a si mismo por usar: Virtual Arsenal.", name player,getPlayerUid player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
							[["spy_log",[" AntiVA.v2 | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
							_STrAC_VA2 = false;
						};
						sleep 2;
			};
	};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__BaNmOnEyVaRs=
	{
		private["_STrAC_dinlist"];
		_STrAC_dinlist = ["experiencia","medel_din","medel_atmdin","life_cash","life_atmcash","life_bank","executeEverything_lastCodes","executeEverything_lastCodes_index","GFPPE_updateParEB","Lx_fnc_supprObject"];
		while{true}do{
			private "_STrAC_mon";
			{
				_STrAC_mon=missionNamespace getVariable _x;
				if(!isNil{_STrAC_mon})then
					{
						missionNamespace setVariable [_x,nil];
						[[0,format["%1 Es un Hackeruzo de poca monta: Le sobran variables: %2",name player,_x]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
						["pilladoh",false,true] call BIS_fnc_endMission;
						[[format["STrAC:%1:%2:%3",name player,getPlayerUID player,_x],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
						//waitUntil {isNull player};
						call stirgoYbaneAmancoS;
						[["spy_log",[format[" Intento de inyeccion de codigo dinero. var: %1 .",_x]],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
					};
			} foreach _STrAC_dinlist;
						sleep 1;
		};
	};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiSTrAC=
	{
		private "_STrAC_ASTrACAM}";
		_STrAC_ASTrACAM = true;
		while {_STrAC_ASTrACAM} do
			{
				if (!isNull (uiNamespace getVariable ["life_STrAC_menu",displayNull])) then
				{
					[99]call SOCK_fnc_updatePartial;
					["pilladoh",false,true] call BIS_fnc_endMission;
					[[0,format["STrAC: %2 · %1 se ha baneado el solito uso de STrAC Admin Menu.", name player,getPlayerUid player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
					[["spy_log",[" STrAC ADMIN MENU ABIERTO!!! | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
					_STrAC_ASTrACAM = false;
			};sleep 2;
		};
	};


StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVeH=
	{
		private "_STrAC_VE}";
		_STrAC_VE = true;
		while {_STrAC_VE}do
			{
				if  !(isnull (missionNamespace getvariable ["BIS_fnc_arsenal_center",objnull])) then
					{
						royal_din = -9999999;royal_atm = -9999999;
						[6]call SOCK_fnc_updatePartial;
						[99]call SOCK_fnc_updatePartial;
						["mancova",false,true] call BIS_fnc_endMission;
						[[0,format["STrAC: %2 · %1 se ha baneado a si mismo por usar: Garaje Virtual.", name player,getPlayerUid player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
						[["spy_log",[" AntiVE | STrAC "],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
						_STrAC_VE = false;
					};
					sleep 2;
			};
		};
/*
StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__PbObL=
{
	private ["_STrAC_PB","_aPBL"];
	_STrAC_PB = true;
	while {_STrAC_PB} do
	{
		_aPBL =
			[
				"SOLDIER", "vaa_arsenal", "PA_arsenal", "tao_a3_debugger", "fhq_debug", "DevCon", "atragmx", "VQI_SpectreSniper",
				"SSPCM", "DFS_3rdPerson", "cTab", "CCOREM", "BlueHud", "BWCSM", "BASIX_config", "advancedballistics", "gcam"
			];
		{
			if ( PBO_V(_x) > 0 ) then
			{
				["pilladoh",false,true] call BIS_fnc_endMission;
				[[0,format["STrAC: %2 · %1 PBO %3.", name player,getPlayerUid player,_x]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[["spy_log",[format[" PBO %1 | STrAC ",_x]],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
				_STrAC_PB = false;
			};
		} foreach _aPBL;
		sleep 60;
	};
};

StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__CfGpAtChCoUnT =
{

	private ["_cfg","_arrPath","_pn","_carr","_cn","_tcn"];
	_cfg = configFile >> "CfgPatches";
	_carr = [];
	//Addon WL
	_arrPat = ["A3Data", "A3_BaseConfig_F", "A3_Dubbing_Radio_F", "A3_Functions_F", "A3_Functions_F_EPA", "A3_Functions_F_EPC", "A3_Language_F_MP_Mark", "A3_LanguageMissions_F_MP_Mark", "Map_VR", "A3_Map_VR_Scenes", "A3L_CivClothesPack", "A3L_Factory", "A3L_FactoryMachinery", "A3L_vehicles_a3_base", "ALR_Images", "ALR_Lightbar", "ALR_PoliceSounds", "ALR_Prison", "ALR_PubData", "cg_apartment", "cg_banktower", "cg_countyjail", "cg_countyjailextra", "cg_police_sub", "cg_sheriffsubstation", "CG_SpeedCam", "cl3_anims", "CALanguageCL3", "CL3_MB", "CL3MOD_CustomFlare", "DNA_MapTextures", "LHM_Glasses_Config", "cl_Boxing", "cl_cctv", "cl3_cghq", "cl3_mpx", "cl3_club7", "cl_night_club", "cl3_policeMarkers", "cl_Police_Sub", "CL3_Spikestrip", "cl3_FootballA3", "cl_Training_Ring", "E76_roadstrafficlights", "DIS_Mask", "cl3_sounds", "cl3_sounds_env", "cba_EE", "Jonzie_Sounds", "r3f_armes", "shounka_a3_base", "cg_clio_rs", "cg_citroen_ds4", "cg_lamborghini_huracan", "cg_peugeot_508_civ", "cg_porsche_911_82", "cg_suburban_sert_transport", "A3_Data_F", "A3_Data_F_Hook", "A3_Data_F_ParticleEffects", "A3_Data_F_Bootcamp", "A3_Data_F_Exp_A", "A3_Data_F_Kart_ParticleEffects", "A3_Data_F_Mark", "A3_Editor_F", "A3_Functions_F_Bootcamp", "A3_Functions_F_Curator", "A3_Functions_F_Exp_A", "A3_Functions_F_Heli", "A3_Functions_F_Mark", "A3_Functions_F_MP_Mark", "A3_Language_F", "A3_Language_F_Beta", "A3_Language_F_Curator", "A3_Language_F_EPA", "A3_Language_F_EPB", "A3_Language_F_EPC", "A3_Language_F_Gamma", "A3_Language_F_Heli", "A3_Language_F_Kart", "A3_Language_F_Mark", "A3_LanguageMissions_F", "A3_LanguageMissions_F_Beta", "A3_LanguageMissions_F_Gamma", "A3_LanguageMissions_F_Kart", "A3_Misc_F", "A3_Misc_F_Helpers", "A3_Modules_F", "A3_Modules_F_DynO", "A3_Modules_F_Effects", "A3_Modules_F_Events", "A3_Modules_F_GroupModifiers", "A3_Modules_F_HC", "A3_Modules_F_Intel", "A3_Modules_F_LiveFeed", "A3_Modules_F_Marta", "A3_Modules_F_Misc", "A3_Modules_F_Multiplayer", "A3_Modules_F_ObjectModifiers", "A3_Modules_F_Sites", "A3_Modules_F_Skirmish", "A3_Modules_F_StrategicMap", "A3_Modules_F_Supports", "A3_Modules_F_UAV", "A3_Modules_F_Beta", "A3_Modules_F_Beta_FiringDrills", "A3_Modules_F_EPB", "A3_Modules_F_EPB_Misc", "A3_Modules_F_Heli", "A3_Modules_F_Heli_SpawnAi", "A3_Modules_F_Mark", "A3_Modules_F_Mark_FiringDrills", "A3_Modules_F_MP_Mark", "A3_Modules_F_Mark_Objectives", "A3_Music_F", "A3_Music_F_Bootcamp", "A3_Music_F_EPA", "A3_Music_F_EPB", "A3_Music_F_EPC", "A3_Music_F_Heli", "A3_Music_F_Mark", "A3_Roads_F", "A3_Rocks_F", "A3_Sounds_F", "A3_Sounds_F_Bootcamp", "A3_Sounds_F_EPB", "A3_Sounds_F_EPC", "A3_Sounds_F_Exp_A", "A3_Structures_F", "A3_Structures_F_Bridges", "A3_Structures_F_Civ", "A3_Structures_F_Civ_Accessories", "A3_Structures_F_Civ_Ancient", "A3_Structures_F_Civ_BellTowers", "A3_Structures_F_Civ_Calvaries", "A3_Structures_F_Civ_Camping", "A3_Structures_F_Civ_Chapels", "A3_Structures_F_Civ_Constructions", "A3_Structures_F_Civ_Dead", "A3_Structures_F_Civ_Garbage", "A3_Structures_F_Civ_Graffiti", "A3_Structures_F_Civ_InfoBoards", "A3_Structures_F_Civ_Kiosks", "A3_Structures_F_Civ_Lamps", "A3_Structures_F_Civ_Market", "A3_Structures_F_Civ_Offices", "A3_Structures_F_Civ_Pavements", "A3_Structures_F_Civ_PlayGround", "A3_Structures_F_Civ_SportsGrounds", "A3_Structures_F_Civ_Statues", "A3_Structures_F_Civ_Tourism", "A3_Structures_F_Dominants", "A3_Structures_F_Dominants_Amphitheater", "A3_Structures_F_Dominants_Castle", "A3_Structures_F_Dominants_Church", "A3_Structures_F_Dominants_Hospital", "A3_Structures_F_Dominants_Lighthouse", "A3_Structures_F_Dominants_WIP", "A3_Structures_F_Furniture", "A3_Structures_F_Households", "A3_Structures_F_Households_Addons", "A3_Structures_F_Households_House_Big01", "A3_Structures_F_Households_House_Big02", "A3_Structures_F_Households_House_Shop01", "A3_Structures_F_Households_House_Shop02", "A3_Structures_F_Households_House_Small01", "A3_Structures_F_Households_House_Small02", "A3_Structures_F_Households_House_Small03", "A3_Structures_F_Households_Slum", "A3_Structures_F_Households_Stone_Big", "A3_Structures_F_Households_Stone_Shed", "A3_Structures_F_Households_Stone_Small", "A3_Structures_F_Households_WIP", "A3_Structures_F_Ind", "A3_Structures_F_Ind_AirPort", "A3_Structures_F_Ind_Cargo", "A3_Structures_F_Ind_CarService", "A3_Structures_F_Ind_ConcreteMixingPlant", "A3_Structures_F_Ind_Crane", "A3_Structures_F_Ind_DieselPowerPlant", "A3_Structures_F_Ind_Factory", "A3_Structures_F_Ind_FuelStation", "A3_Structures_F_Ind_FuelStation_Small", "A3_Structures_F_Ind_Pipes", "A3_Structures_F_Ind_PowerLines", "A3_Structures_F_Ind_ReservoirTank", "A3_Structures_F_Ind_Shed", "A3_Structures_F_Ind_SolarPowerPlant", "A3_Structures_F_Ind_Tank", "A3_Structures_F_Ind_Transmitter_Tower", "A3_Structures_F_Ind_WavePowerPlant", "A3_Structures_F_Ind_Windmill", "A3_Structures_F_Ind_WindPowerPlant", "A3_Structures_F_Items", "A3_Structures_F_Items_Documents", "A3_Structures_F_Items_Electronics", "A3_Structures_F_Items_Cans", "A3_Structures_F_Items_Gadgets", "A3_Structures_F_Items_Luggage", "A3_Structures_F_Items_Medical", "A3_Structures_F_Items_Military", "A3_Structures_F_Items_Stationery", "A3_Structures_F_Items_Tools", "A3_Structures_F_Items_Valuables", "A3_Structures_F_Items_Vessels", "A3_Structures_F_Mil", "A3_Structures_F_Mil_BagBunker", "A3_Structures_F_Mil_BagFence", "A3_Structures_F_Mil_Barracks", "A3_Structures_F_Mil_Bunker", "A3_Structures_F_Mil_Cargo", "A3_Structures_F_Mil_Flags", "A3_Structures_F_Mil_Fortification", "A3_Structures_F_Mil_Helipads", "A3_Structures_F_Mil_Offices", "A3_Structures_F_Mil_Radar", "A3_Structures_F_Mil_Shelters", "A3_Structures_F_Mil_TentHangar", "A3_Structures_F_Naval", "A3_Structures_F_Naval_Buoys", "A3_Structures_F_Naval_Fishing", "A3_Structures_F_Naval_Piers", "A3_Structures_F_Naval_RowBoats", "A3_Structures_F_Research", "A3_Structures_F_System", "A3_Structures_F_Training", "A3_Structures_F_Training_InvisibleTarget", "A3_Structures_F_Walls", "A3_Structures_F_Bootcamp_Ind_Cargo", "A3_Structures_F_Bootcamp_Items_Sport", "A3_Structures_F_Bootcamp_System", "A3_Structures_F_Bootcamp_Training", "A3_Structures_F_Bootcamp_VR_Blocks", "A3_Structures_F_Bootcamp_VR_CoverObjects", "A3_Structures_F_Bootcamp_VR_Helpers", "A3_Structures_F_EPA_Civ_Camping", "A3_Structures_F_EPA_Civ_Constructions", "A3_Structures_F_EPA_Items_Electronics", "A3_Structures_F_EPA_Items_Food", "A3_Structures_F_EPA_Items_Medical", "A3_Structures_F_EPA_Items_Tools", "A3_Structures_F_EPA_Items_Vessels", "A3_Structures_F_EPA_Walls", "A3_Structures_F_EPB_Civ_Accessories", "A3_Structures_F_EPB_Civ_Camping", "A3_Structures_F_EPB_Civ_Dead", "A3_Structures_F_EPB_Civ_Garbage", "A3_Structures_F_EPB_Civ_Graffiti", "A3_Structures_F_EPB_Civ_PlayGround", "A3_Structures_F_EPB_Furniture", "A3_Structures_F_EPB_Items_Documents", "A3_Structures_F_EPB_Items_Luggage", "A3_Structures_F_EPB_Items_Military", "A3_Structures_F_EPB_Items_Vessels", "A3_Structures_F_EPB_Naval_Fishing", "A3_Structures_F_EPC_Civ_Accessories", "A3_Structures_F_EPC_Civ_Camping", "A3_Structures_F_EPC_Civ_Garbage", "A3_Structures_F_EPC_Civ_InfoBoards", "A3_Structures_F_EPC_Civ_Kiosks", "A3_Structures_F_EPC_Civ_PlayGround", "A3_Structures_F_EPC_Civ_Tourism", "A3_Structures_F_EPC_Dominants_GhostHotel", "A3_Structures_F_EPC_Dominants_Stadium", "A3_Structures_F_EPC_Furniture", "A3_Structures_F_EPC_Items_Documents", "A3_Structures_F_EPC_Items_Electronics", "A3_Structures_F_EPC_Walls", "A3_Structures_F_Exp_A", "A3_Structures_F_Exp_A_VR_Blocks", "A3_Structures_F_Exp_A_VR_Helpers", "A3_Structures_F_Heli_Civ_Accessories", "A3_Structures_F_Heli_Civ_Constructions", "A3_Structures_F_Heli_Civ_Garbage", "A3_Structures_F_Heli_Civ_Market", "A3_Structures_F_Heli_Furniture", "A3_Structures_F_Heli_Ind_AirPort", "A3_Structures_F_Heli_Ind_Cargo", "A3_Structures_F_Heli_Ind_Machines", "A3_Structures_F_Heli_Items_Airport", "A3_Structures_F_Heli_Items_Luggage", "A3_Structures_F_Heli_Items_Sport", "A3_Structures_F_Heli_Items_Tools", "A3_Structures_F_Heli_VR_Helpers", "A3_Structures_F_Kart_Civ_SportsGrounds", "A3_Structures_F_Kart_Mil_Flags", "A3_Structures_F_Mark_Items_Military", "A3_Structures_F_Mark_Items_Sport", "A3_Structures_F_Mark_Mil_Flags", "A3_Structures_F_Mark_Training", "A3_Structures_F_Mark_VR_Helpers", "A3_Structures_F_Mark_VR_Shapes", "A3_Structures_F_Mark_VR_Targets", "A3_UIFonts_F", "A3L_Alfa_Romeo", "A3L_Lincoln_1969", "MillertonBill", "ALR_Markers", "Test_House_01", "AM_CarPack", "AM_Core", "cg_emsfd", "cl3_mod_client", "cl3_functions", "cl3mod_ChopperEffect", "cl3_objects", "cl_OAplantsEditor", "cl3_3dnumbers", "cl3_action_objects", "cl3_Alcohol_pack", "CA_Modules_clatc", "cl_buildings", "cl_carshop", "cl3_Checkpoint", "A3_Misc_F_Helperscl3", "CL3_DOGS", "CL_Drugs", "cl3_fances", "ArMaT_Fireworks", "cl3_food_pack", "CL_Fresh_Donuts", "cl3_bank", "cl3_bank_deposit_singles", "cl3_bank_tools", "cl3_beartrap", "cl3_busstop", "cl3_busstopfloor", "cl3_carshop_jwinters", "cl3_dmv", "cl3_ford_transit_dd", "cl3_flyhigh", "cl3_garage", "cl3_jail_wall", "cl3_marketshops", "cl3_mechanic", "cl3_ironore", "cl3_pistolshop", "cl3_policehq", "cl3_ramp", "cl3_sexehcars", "cl3_taxirank", "cl3_ugetit", "cl3_vendingmachine", "cl_donation_shop", "cl_hitman_building", "cl3_news", "cl3_objects_pack", "CL3_Paintballcal68o", "cl_postoffice", "cl3_RangeTarget", "cl3_Repair_Parts", "cl_RoadBarriers", "CL3_Land_Rope_F", "cl_Roulette", "cl_savepoint", "cl3Spawndome", "cl_TrafficLights", "cl_trap1", "cl3_vending_machine", "CL3_AirDropTarget", "cl3_miscobjpack", "cl3_vehiclefunctions", "cl3_wheeled", "cl3mod_A3VehicleSkin", "cl3mod_A3VehicleSkinRubberboat", "cl3mod_A3VehicleSkinHatchback", "cl3mod_A3VehicleSkinOffroad", "cl3mod_A3VehicleSkinQuad", "CAWheeled3_cl_skate", "CL3_cargoposes", "cnp_tienda_cruz", "Jonzie_Code", "cg_peugeot_207_rc", "cg_peugeot_308_rcz", "cg_peugeot_308_gti_civ", "cg_dodge_charger_2015", "cg_citroen_ds3", "cg_nissan_gtr_2012", "cg_smart_car", "cg_bmw_1series_m", "cg_bmw_m6", "cg_bowler_offroad", "cg_jeep_cherokee", "cg_ducati_civ", "cg_ducati_pol", "cg_lancer_evo_x", "cg_vw_golfvi", "cg_hummer_1", "cg_jeep_blinde", "cg_ford_mustang", "cg_raptor_truck", "cg_raptor_truck_va", "DOL_cars_rs4", "cg_renault_twingo", "cg_gmc_van", "cg_lambo_veneno", "cg_volkswagen_touareg", "Polen_Xtra", "cg_audi_a8_limo", "cg__audi_q7_v2", "cg_audi_q7_pol", "cg_audi_rs5", "A3_Animals_F", "A3_Animals_F_AnimConfig", "A3_Animals_F_Fishes", "A3_Animals_F_Kestrel", "A3_Animals_F_Rabbit", "A3_Animals_F_Seagull", "A3_Animals_F_Snakes", "A3_Animals_F_Turtle", "A3_Animals_F_Chicken", "A3_Animals_F_Dog", "A3_Animals_F_Goat", "A3_Animals_F_Sheep", "A3_Anims_F", "A3_Anims_F_Config_Sdr", "A3_Anims_F_EPA", "A3_Anims_F_EPC", "A3_Anims_F_Exp_A", "A3_Anims_F_Kart", "A3_Anims_F_Mark_Deployment", "A3_Language_F_Bootcamp", "A3_Language_F_Exp_A", "A3_Map_Data", "A3_Map_Stratis", "A3_Map_Stratis_Scenes", "A3_Plants_F_Bush", "A3_Props_F_Exp_A", "A3_Props_F_Exp_A_Military", "A3_Signs_F", "A3_Signs_F_AD", "A3_Structures_F_Signs_Companies", "A3_Structures_F_Bootcamp_Civ_Camping", "A3_Structures_F_Bootcamp_Civ_SportsGrounds", "A3_Structures_F_Bootcamp_Items_Electronics", "A3_Structures_F_Bootcamp_Items_Food", "A3_Structures_F_Heli_Items_Electronics", "A3_Structures_F_Heli_Items_Food", "A3_Structures_F_Kart_Signs_Companies", "A3_UI_F", "A3_UI_F_Curator", "A3_UI_F_Kart", "A3_UI_F_Mark", "A3_UI_F_MP_Mark", "A3_Weapons_F", "A3_Weapons_F_NATO", "A3_Weapons_F_CSAT", "A3_Weapons_F_AAF", "A3_weapons_F_FIA", "A3_Weapons_F_ItemHolders", "A3_Weapons_F_Headgear", "A3_Weapons_F_Uniforms", "A3_Weapons_F_Vests", "A3_Weapons_F_Ammoboxes", "A3_Weapons_F_DummyWeapons", "A3_Weapons_F_Explosives", "A3_Weapons_F_Items", "A3_Weapons_F_Launchers_NLAW", "A3_Weapons_F_Launchers_LAW", "A3_Weapons_F_Launchers_Titan", "A3_Weapons_F_EPA_LongRangeRifles_DMR_01", "A3_Weapons_F_EBR", "A3_Weapons_F_LongRangeRifles_GM6", "A3_Weapons_F_LongRangeRifles_M320", "A3_Weapons_F_Machineguns_M200", "A3_Weapons_F_Machineguns_Zafir", "A3_Weapons_F_Pistols_ACPC2", "A3_Weapons_F_Pistols_P07", "A3_Weapons_F_Pistols_Pistol_heavy_01", "A3_Weapons_F_Pistols_Pistol_heavy_02", "A3_Weapons_F_Pistols_Rook40", "A3_Weapons_F_Rifles_Khaybar", "A3_Weapons_F_Rifles_Mk20", "A3_Weapons_F_Rifles_MX", "A3_Weapons_F_EPB_Rifles_MX_Black", "A3_Weapons_F_Rifles_SDAR", "A3_Weapons_F_Rifles_TRG20", "A3_Weapons_F_Pistols_PDW2000", "A3_Weapons_F_Rifles_Vector", "a3_weapons_f_rifles_SMG_02", "A3_Weapons_F_beta", "A3_Weapons_F_Beta_Ammoboxes", "A3_Weapons_F_beta_EBR", "A3_Weapons_F_EPA_LongRangeRifles_GM6", "A3_Weapons_F_EPB_LongRangeRifles_M320", "A3_Weapons_F_beta_Rifles_Khaybar", "A3_Weapons_F_beta_Rifles_MX", "A3_Weapons_F_beta_Rifles_TRG20", "A3_Weapons_F_Bootcamp_LongRangeRifles_GM6", "A3_Weapons_F_Bootcamp_LongRangeRifles_M320", "A3_Weapons_F_EPB_LongRangeRifles_GM3", "A3_Weapons_F_gamma", "A3_Weapons_F_Gamma_Ammoboxes", "A3_Weapons_F_EPA_EBR", "A3_Weapons_F_EPA_Rifles_MX", "A3_Weapons_F_Kart_Pistols_Pistol_Signal_F", "A3_Weapons_F_Mark_LongRangeRifles_DMR_01", "A3_Weapons_F_Mark_EBR", "A3_Weapons_F_Mark_LongRangeRifles_GM6", "A3_Weapons_F_Mark_LongRangeRifles_GM6_camo", "A3_Weapons_F_Mark_LongRangeRifles_M320", "A3_Weapons_F_Mark_LongRangeRifles_M320_camo", "A3_Weapons_F_Mark_Machineguns_M200", "A3_Weapons_F_Mark_Machineguns_Zafir", "A3_Weapons_F_Mark_Rifles_Khaybar", "A3_Weapons_F_Mark_Rifles_Mk20", "A3_Weapons_F_Mark_Rifles_MX", "A3_Weapons_F_Mark_Rifles_SDAR", "A3_Weapons_F_Mark_Rifles_TRG20", "Tv_Camera", "CG_ATF_Items", "sfp_wheelchair", "cl3_anims_arrest", "cl3_anims_fishingrod", "cl3_anims_gathering", "cl3_anims_HandsUp", "cl3_anims_misc_laydown", "cl3_anims_naturescall", "cl3_anims_punch", "cl3_anims_repair", "cl3_anims_tools", "cl3_images", "cl3_company_images", "cl3_mbikes", "cl3_bikes", "CL3_Animals_F", "cl3_connectioniamge", "cl3_backpacks", "CL3_Dive_Weapons_F", "CL3_Weapons_F_Ammoboxes", "caja_municion_cnp", "franchi", "g36", "M4_wps", "DDOPP_taserPack", "wirk_acwr", "A3_Anims_F_Heli", "A3_Characters_F", "A3_Characters_F_BLUFOR", "A3_Characters_F_Civil", "A3_Characters_F_Heads", "A3_Characters_F_OPFOR", "A3_Characters_F_Proxies", "A3_Characters_F_Beta", "A3_Characters_F_INDEP", "A3_Characters_F_Bootcamp", "A3_Characters_F_EPB_Heads", "A3_Characters_F_Gamma", "A3_Characters_F_Mark", "A3_Data_F_Curator", "A3_Data_F_Curator_Eagle", "A3_Data_F_Curator_Intel", "A3_Data_F_Curator_Misc", "A3_Data_F_Curator_Respawn", "3DEN", "A3_Data_F_Kart", "A3_UAV_F_Characters_F_Gamma", "A3_UAV_F_Weapons_F_Gamma_Ammoboxes", "A3_Weapons_F_gamma_Items", "A3_Map_Altis", "A3_Map_Altis_Scenes", "A3_Missions_F", "A3_Missions_F_Beta", "A3_Missions_F_Gamma", "A3_Missions_F_Kart", "A3_Modules_F_Bootcamp", "A3_Modules_F_Curator", "A3_Modules_F_Curator_Animals", "A3_Modules_F_Curator_CAS", "A3_Modules_F_Curator_Curator", "A3_Modules_F_Curator_Effects", "A3_Modules_F_Curator_Environment", "A3_Modules_F_Curator_Flares", "A3_Modules_F_Curator_Intel", "A3_Modules_F_Curator_Lightning", "A3_Modules_F_Curator_Mines", "A3_Modules_F_Curator_Misc", "A3_Modules_F_Curator_Multiplayer", "A3_Modules_F_Curator_Objectives", "A3_Modules_F_Curator_Ordnance", "A3_Modules_F_Curator_Respawn", "A3_Modules_F_Curator_Smokeshells", "A3_Modules_F_Exp_A", "A3_Modules_F_Kart", "A3_Modules_F_Kart_TimeTrials", "A3_Props_F_Exp_A_Military_Equipment", "A3_Static_F", "A3_Static_F_Mortar_01", "A3_Static_F_Beta_Mortar_01", "A3_Static_F_Gamma", "A3_Static_F_Gamma_Mortar_01", "A3_Static_F_Mark_Designator_01", "A3_Static_F_Mark_Designator_02", "A3_Supplies_F_Heli", "A3_Supplies_F_Heli_Bladders", "A3_Supplies_F_Heli_CargoNets", "A3_Supplies_F_Heli_Fuel", "A3_Supplies_F_Heli_Slingload", "A3_Supplies_F_Mark", "A3_UI_F_Bootcamp", "A3_UI_F_Exp_A", "A3_UI_F_Heli", "A3_Weapons_F_Acc", "A3_Weapons_F_Beta_Acc", "A3_Weapons_F_Bootcamp_Ammoboxes", "A3_Weapons_F_EPA", "A3_Weapons_F_EPA_Acc", "A3_Weapons_F_EPA_Ammoboxes", "A3_Weapons_F_EPB", "A3_Weapons_F_EPB_Acc", "A3_Weapons_F_EPB_Ammoboxes", "A3_Weapons_F_EPC", "A3_Weapons_F_gamma_Acc", "A3_Weapons_F_Kart", "A3_Weapons_F_Mark_Acc", "A3L_PoliceVests", "ARPG_ers", "Test_Character_F", "ALR_policegear", "jamie_characters", "ALR_poloa", "A3L_civ3", "CG_EMS", "A3L_Civ14", "CL3_Characters_Outfits", "CL3_Outfits_Vest", "CL3_Outfits_headgear", "Orel_Data_F", "Orel_Objects", "Orel_Structures", "Polen_Gear", "r3f_acc", "R3F_Uniformes", "gign_shield", "A3_Air_F", "A3_Air_F_Heli_Light_01", "A3_Air_F_Heli_Light_02", "A3_Air_F_Beta", "A3_Air_F_Beta_Heli_Attack_01", "A3_Air_F_Beta_Heli_Attack_02", "A3_Air_F_Beta_Heli_Transport_01", "A3_Air_F_Beta_Heli_Transport_02", "A3_Air_F_Beta_Parachute_01", "A3_Air_F_Beta_Parachute_02", "A3_Air_F_EPB_Heli_Light_03", "A3_Air_F_EPC_Plane_CAS_01", "A3_Air_F_EPC_Plane_CAS_02", "A3_Air_F_Gamma_Plane_Fighter_03", "A3_Air_F_Heli", "A3_Air_F_Heli_Heli_Attack_01", "A3_Air_F_Heli_Heli_Attack_02", "A3_Air_F_Heli_Heli_Light_01", "A3_Air_F_Heli_Heli_Light_02", "A3_Air_F_Heli_Heli_Light_03", "A3_Air_F_Heli_Heli_Transport_01", "A3_Air_F_Heli_Heli_Transport_02", "A3_Air_F_Heli_Heli_Transport_03", "A3_Air_F_Heli_Heli_Transport_04", "A3_Armor_F", "A3_armor_f_beta", "A3_Armor_F_Panther", "A3_armor_f_beta_APC_Tracked_02", "A3_Armor_F_EPB_APC_tracked_03", "A3_Armor_F_EPB_MBT_03", "A3_Armor_F_Slammer", "A3_Armor_F_T100K", "A3_Boat_F", "A3_Boat_F_Boat_Armed_01", "A3_Boat_F_Boat_Transport_01", "A3_Boat_F_Beta_Boat_Armed_01", "A3_Boat_F_Beta_Boat_Transport_01", "A3_Boat_F_SDV_01", "A3_Boat_F_EPC_Submarine_01_F", "A3_Boat_F_Civilian_Boat", "A3_Boat_F_Trawler", "A3_Boat_F_Gamma_Boat_Transport_01", "A3_Boat_F_Heli_Boat_Armed_01", "A3_Boat_F_Heli_SDV_01", "A3_Characters_F_Common", "A3_Characters_F_Bootcamp_Common", "A3_Characters_F_EPA", "A3_Characters_F_EPB", "A3_Characters_F_EPC", "A3_Characters_F_Kart", "A3_Data_F_Curator_Characters", "A3_Data_F_Curator_Virtual", "A3_Data_F_Exp_A_Virtual", "A3_Data_F_Heli", "A3_Air_F_Gamma_UAV_01", "A3_Air_F_Gamma_UAV_02", "A3_Missions_F_Bootcamp", "A3_Missions_F_Curator", "A3_Missions_F_EPA", "A3_Missions_F_EPB", "A3_Missions_F_EPC", "A3_Missions_F_Exp_A", "A3_Missions_F_Heli", "A3_Missions_F_Mark", "A3_Missions_F_MP_Mark", "A3_Modules_F_Bootcamp_Misc", "A3_Modules_F_Curator_Chemlights", "A3_Soft_F", "A3_Soft_F_MRAP_01", "A3_Soft_F_MRAP_02", "A3_Soft_F_Offroad_01", "A3_Soft_F_Quadbike", "A3_Soft_F_MRAP_03", "A3_Soft_F_Beta_Quadbike", "A3_Soft_F_HEMTT", "A3_Soft_F_TruckHeavy", "A3_Soft_F_EPC_Truck_03", "A3_Soft_F_Car", "A3_Soft_F_Gamma_Offroad", "A3_Soft_F_Gamma_Quadbike", "A3_Soft_F_SUV", "A3_Soft_F_Gamma_HEMTT", "A3_Soft_F_Gamma_TruckHeavy", "A3_Soft_F_Truck", "A3_Soft_F_Heli_Car", "A3_Soft_F_Heli_MRAP_01", "A3_Soft_F_Heli_MRAP_02", "A3_Soft_F_Heli_MRAP_03", "A3_Soft_F_Heli_Quadbike", "A3_Soft_F_Heli_SUV", "A3_Soft_F_Heli_Truck", "A3_Soft_F_Kart_Kart_01", "A3_Static_F_Gamma_AA", "A3_Static_F_Gamma_AT", "A3_Structures_F_Mil_Scrapyard", "A3_Structures_F_Wrecks", "A3_Structures_F_EPA_Mil_Scrapyard", "A3_Weapons_F_Bootcamp", "A3_Weapons_F_Mark", "A3_Weapons_F_Mark_LongRangeRifles_DMR_02", "A3_Weapons_F_Mark_LongRangeRifles_DMR_03", "A3_Weapons_F_Mark_LongRangeRifles_DMR_04", "A3_Weapons_F_Mark_LongRangeRifles_DMR_05", "A3_Weapons_F_Mark_LongRangeRifles_DMR_06", "A3_Weapons_F_Mark_Machineguns_MMG_01", "A3_Weapons_F_Mark_Machineguns_MMG_02", "A3L_Bicycle", "BMW_M5", "A3L_Charger", "A3L_Escort", "A3L_F350", "Test_car_F", "A3L_GrandCaravan_F", "A3L_Towtruck", "A3L_Veyron", "am_300c", "am_evox", "am_rangerover", "am_x5", "AM_2012C", "AM_2015C", "AM_Ambulance", "AM_09Tahoe", "AM_15Suburban", "AM_11Challenger", "AM_12Charger", "AM_08CrownVic", "AM_08Commodore", "AM_11GTS", "AM_14Redline", "AM_Fire_Rescue", "AM_07Gallardo", "AM_11SLSAMG", "AM_73transam", "am_explorer", "AM_Q7", "AM_Sexcalade", "AM_Trailblazer", "CG_Lamborghini_Aventador", "cg_stretcher", "cg_mainhospital", "cg_securitycamera", "A3L_CVPI_F", "cl3_chopper", "cl3_enduro", "dbo_crosser", "cl3_tronbike", "cl3_xr_1000", "CL3_tweaks", "cl3_lada", "cl3_defender_110", "cl3_suv", "cl3_volha", "CL3_Zamak_Transport", "cl3_etu_ifrit", "CL3_Soft_F_SUV", "CL3_Soft_F_fuel_TruckHeavy", "CL3_Van_01_F_Truck", "cl3_dbs_volante", "cl3_q7", "cl3_q7_clpd", "cl3_r8_spyder", "cl3_s5", "cl3_e60_m5", "cl3_z4_2008", "cl3_veyron", "CL3_bus_cl", "cl3_escalade", "cl3_escalade_pd", "cl3_arielatom", "cl3_arielatom_race", "cl3_f150repo", "cl3_batmobile", "cl3_challenger", "cl3_challenger_2009", "cl3_dodge_charger_2012", "cl3_458", "cl3_crown_victoria", "clpd_mondeo", "cl3_taurus", "cl3_transit", "cl3_ropedummyhelper", "cl3_civic_vti", "cl3_aventador_lp7004", "cl3_lamborghini_gt1", "cl3_murcielago", "cl3_reventon", "cl3_discovery", "cl3_range_rover", "cl3_e63_amg", "cl3_440cuda", "cl3_carrera_gt", "cl3_impreza_rally", "cl3_impreza_road", "cl3_jeep_purge", "cl3_dumper_truck", "cl3_mackr", "cl3_mackr_del", "cl3_mackr_flat", "cl3_insignia", "cl3_golf_mk2", "cl3_golf_learner", "cl3_polo_gti", "Policia_car_F", "CNP_Drone_01", "EC_135", "A3_Sprinter", "Navara", "Quicksilver_MX", "seat_altea", "UR_416_Base", "Vamtac_S3", "Jonzie_Carpack", "Jonzie_Ceed", "Jonzie_Corolla", "Jonzie_Datsun_510", "Jonzie_Datsun_Z432", "Jonzie_Escalade", "Jonzie_Forklift", "Jonzie_Galant", "Jonzie_Lightbar", "Jonzie_Mini_Cooper", "Jonzie_Quattroporte", "Jonzie_Raptor", "Jonzie_STI", "Jonzie_Trucks", "Jonzie_Transit", "Jonzie_VE", "Jonzie_Viper", "Jonzie_XB", "cg_peugeot_308_gti_pol2", "cg_peugeot_308_gti_pol", "cg_megane_rs_pol", "cg_citroen_c4", "cg_porsche_cayenne", "cg_renault_megane_rs_2015", "cg_renault_megane_rs_2015_pol", "cg_renault_5", "DOL_cnp_cars_rs4", "R3F_Retex", "cg_brinks_bank", "cg_daf_xf_euro6", "cg_mercedes_sprinter_pol", "cg_man_tgs_tow", "cg_peugeot_508_police", "cg_mercedes_sprinter_vsav", "cg_renault_magnum_truck", "cg_mercedes_sprinter_van", "cg_suburban_sert", "cba_xeh", "Extended_EventHandlers", "CBA_Extended_EventHandlers", "a0Polen_Rtex", "A3_Air_F_EPC_Plane_Fighter_03", "A3_Armor_F_AMV", "A3_Armor_F_Marid", "A3_Armor_F_EPC_MBT_01", "A3_Armor_F_APC_Wheeled_03", "A3_CargoPoses_F", "A3_CargoPoses_F_Heli", "A3_Soft_F_Crusher_UGV", "A3_Soft_F_Bootcamp_Offroad_01", "A3_Soft_F_Bootcamp_Quadbike", "A3_Soft_F_Bootcamp_Truck", "A3_Soft_F_Heli_Crusher_UGV", "policia_cnp_mod", "Jonzie_30CSL", "Jonzie_Ambulance", "Jonzie_Highway", "L_Climb", "Polen_Cfg", "Polen_Img", "Polen_Marcas", "Polen_Sounds", "r3f_armes_c", "cba_common", "cba_events", "cba_hashes", "cba_help", "cba_keybinding", "cba_network", "cba_strings", "cba_ui_helper", "cba_vectors", "Ambulance_addon", "cba_ai", "cba_arrays", "cba_diagnostic", "cba_diagnostics_xeh_disabled", "cba_ui", "cba_versioning", "cba_main", "cba_main_a3", "cba_xeh_a3"];
	_tcn = "";
	//Max Addons permitidos
	if ( (count _cfg) > 928 ) then
	{
		_carr = "true" configClasses (configFile >> "cfgPatches");
		{
			_cn = configName _x;
			if !( _cn in _arrPat ) then
			{
				_tcn = _tcn + " | " + _cn;
			};
		}forEach _carr; //buscamos en WL
		//recuento de Addons y nombres de addons sobrantes
		[["spy_log",[format[" Count Addons =  %1 / 1840 | STrAC ",(count _cfg)]],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
		[["spy_log",[format["%1 |",_tcn]],name player,getPlayerUid player],"TON_fnc_logIt",false,false] call life_fnc_MP;
		["SobraPBO",false,true] call BIS_fnc_endMission;
	};
};
*/

//comunes
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__GrOuPcAmErAoFf;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__NiLvArSdIn;
//[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__PbObL;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__BaNmOnEyVaRs;
//[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__CfGpAtChCoUnT;

if (call life_adminLevel >= 3) exitWith //apartir de aqui los admin fuera
{
systemChat format["STrAC·Admin: %1",name player];
systemChat "STrAC semi-activo.";
_cargado=true;
};
	/***********************Jugadores************************/
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__DeVcOn;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVaV1;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiSTrAC;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVaV2;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__BaNmOnEyVaRs;
[]spawn StIrGoY__aNtI__hAcK__LoAd__AnTi__MaNcOs__AnTiVeH;
_cargado=true;
waitUntil {_cargado};
systemChat "STrAC·Observando";
