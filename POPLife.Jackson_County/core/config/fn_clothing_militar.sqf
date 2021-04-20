
#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Departamento Militar - POP Life"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        if(__GETC__(life_coplevel) > 7) then
        {
			_ret set[count _ret,["","----- UNIFORMES DE COMBATE -----",0]];
			_ret set[count _ret,["SAS_Combat_Uniform_D","Uniforme de Combate Árido",500]];
			_ret set[count _ret,["SAS_Combat_Uniform_W","Uniforme de Combate Boscoso",500]];
			_ret set[count _ret,["SAS_Combat_Uniform_BLK","Uniforme de Combate Negro",500]];
			_ret set[count _ret,["SAS_Combat_UniformR_D","Uniforme de Combate Remangado Árido",500]];
			_ret set[count _ret,["SAS_Combat_UniformR_W","Uniforme de Combate Remangado Boscoso",500]];
			_ret set[count _ret,["SAS_Combat_UniformR_BLK","Uniforme de Combate Remangado Negro",500]];
			_ret set[count _ret,["SAS_Enhanced_Combat_Uniform_D","Uniforme de Combate Mejorado Árido",500]];
			_ret set[count _ret,["SAS_Enhanced_Combat_Uniform_W","Uniforme de Combate Mejorado Boscoso",500]];
			_ret set[count _ret,["SAS_Enhanced_Combat_Uniform_BLK","Uniforme de Combate Mejorado Negro",500]];
			_ret set[count _ret,["","----- UNIFORMES DE PILOTOS -----",0]];
			_ret set[count _ret,["SAS_Pilot_Uniform_BLK","Mono de Piloto Negro",500]];
			_ret set[count _ret,["SAS_HeliPilot_Uniform_BLK","Mono de Piloto de Helicópteros Negro",500]];
			_ret set[count _ret,["","----- UNIFORMES DE CAMUFLAJE -----",0]];
			_ret set[count _ret,["SAS_Stealth_Uniform_D","Uniforme de Camuflaje Térmico Árido",500]];
			_ret set[count _ret,["SAS_Stealth_Uniform_W","Uniforme de Camuflaje Térmico Boscoso",500]];
			_ret set[count _ret,["SAS_Stealth_Uniform_blk","Uniforme de Camuflaje Térmico Negro",500]];
			_ret set[count _ret,["SAS_FullGhille_D","Traje Ghilie Boscoso",500]];
			_ret set[count _ret,["SAS_FullGhille_W","Traje Ghilie Árido",500]];
			_ret set[count _ret,["SAS_Sniper_Uniform_BLK","Traje Ghilie Negro",500]];
			_ret set[count _ret,["","----- UNIFORMES DE MARINERO -----",0]];
			_ret set[count _ret,["ffaa_ar_uniforme_marinero_item","Uniforme de Marinero",500]];
			_ret set[count _ret,["","----- UNIFORMES DE OFICIALES -----",0]];
			_ret set[count _ret,["SAS_Officer_Uniform_D","Uniforme de Oficial Árido",500]];
			_ret set[count _ret,["SAS_Officer_Uniform_W","Uniforme de Oficial Boscoso",500]];
			_ret set[count _ret,["SAS_Officer_Uniform_BLK","Uniforme de Oficial Negro",500]];
        };
    };

	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 7) then
        {
			_ret set[count _ret,["","----- CASCOS -----",0]];
			_ret set[count _ret,["SAS_Combat_SpecHelmet_D2","Casco de Combate Árido",300]];
			_ret set[count _ret,["SAS_Combat_SpecHelmet_W2","Casco de Combate Boscoso",300]];
			_ret set[count _ret,["SAS_Combat_SpecHelmet_BLK3","Casco de Combate Negro",300]];
			_ret set[count _ret,["SAS_Combat_LightHelmet_D","Casco Naval Árido",300]];
			_ret set[count _ret,["SAS_Combat_LightHelmet_W","Casco Naval Boscoso",300]];
			_ret set[count _ret,["SAS_Combat_LightHelmet_blk2","Casco Naval Negro",300]];
			_ret set[count _ret,["ffaa_casco_opscore_1_d","Casco de Combate Avanzado",300]];
			_ret set[count _ret,["","----- GORRAS -----",0]];
			_ret set[count _ret,["SAS_BoonieHat_D","Chambergo Árido",300]];
			_ret set[count _ret,["SAS_BoonieHat_W","Chambergo Boscoso",300]];
			_ret set[count _ret,["SAS_BoonieHat_blk","Chambergo Negro",300]];
			_ret set[count _ret,["SAS_MilCap_D","Gorra Militar Árida",300]];
			_ret set[count _ret,["SAS_MilCap_W","Gorra Militar Boscoso",300]];
			_ret set[count _ret,["SAS_MilCap_blk","Gorra Militar Negro",300]];	
			_ret set[count _ret,["","----- BOINAS -----",0]];
			_ret set[count _ret,["SAS_Beret_ACAR","Boina ACAR",300]];
			_ret set[count _ret,["SAS_Beret_BRIPAC","Boina BRIPAC",300]];
			_ret set[count _ret,["SAS_Beret_FAMET","Boina Caballería",300]];
			_ret set[count _ret,["SAS_Beret_FGNE","Boina FAMET",300]];
			_ret set[count _ret,["SAS_Beret_LEG","Boina LEGIÓN ESPAÑOLA",300]];
			_ret set[count _ret,["SAS_Beret_MCOE","Boina MCOE",300]];
			_ret set[count _ret,["SAS_Beret_MOE","Boina MOE",300]];
			_ret set[count _ret,["ffaa_brilat_boina","Boina BRILAT",300]];
			_ret set[count _ret,["ffaa_brimz_boina","Boina BRIMZ",300]];
			_ret set[count _ret,["ffaa_fgne_boina","Boina FGNE",300]];
			_ret set[count _ret,["","----- OTROS -----",0]];
			_ret set[count _ret,["ffaa_casco_famet_crew","Casco de Tripulación de helicópteros",300]];
			_ret set[count _ret,["ffaa_casco_famet_piloto","Casco de Pilotos ",300]];		
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["ffaa_brilat_item_nbq",nil,100],
			["ffaa_Glasses",nil,100],
			["SAS_Bandanna_Combat_D",nil,100],
			["SAS_Bandanna_Combat_w",nil,100],
			["SAS_Bandanna_Combat_BLK",nil,100],
			["SFG_Tac_ChopsB", "Barba Corta Rubia",100 * Desc],
			["SFG_Tac_ChopsD", "Barba Corta Castaña",100 * Desc],
			["SFG_Tac_ChopsO", "Barba Corta Canosa",100 * Desc],
			["SFG_Tac_smallBeardD", "Barba Mediana Castaña",100 * Desc],
			["SFG_Tac_BeardD", "Barba Larga Castaña",100 * Desc],
			["SFG_Tac_chinlessbD", "Barba & Bigote Castaño",100 * Desc],
			["SFG_Tac_moustacheD", "Bigote Castaño",100 * Desc],
			["TRYK_Beard_BK", "Barba & Perilla Negra Corta",100 * Desc],
			["TRYK_Beard", "Barba & Perilla Castaña 1 Corta",100 * Desc],
			["TRYK_Beard_BK3", "Barba & Perilla Negra Larga",100 * Desc],
			["TRYK_Beard3", "Barba & Perilla Castaña 1 Larga",100 * Desc],
			["TRYK_Beard_BW3", "Barba & Perilla Castaña 2 Larga",100 * Desc],
			["TRYK_Beard_Gr3", "Barba & Perilla Larga",100 * Desc]			
		];
	};

	//Vest
	case 3:
	{
		if(__GETC__(life_coplevel) > 7) then
        {
			_ret set[count _ret,["","----- CHALECOS -----",0]];
			_ret set[count _ret,["SAS_PlateCarrierGL_D","Chaleco Anti Fragmento Árido",300]];
			_ret set[count _ret,["SAS_PlateCarrierGL_W","Chaleco Anti Fragmento Boscoso",300]];
			_ret set[count _ret,["SAS_PlateCarrierGL_BLK","Chaleco Anti Fragmento Negro",300]];
			_ret set[count _ret,["SAS_PlateCarrier3_D","Chaleco Combate Árido",300]];
			_ret set[count _ret,["SAS_PlateCarrier3_W","Chaleco Combate Boscoso",300]];
			_ret set[count _ret,["SAS_PlateCarrier3_BLK","Chaleco Combate Negro",300]];
			_ret set[count _ret,["SAS_PlateCarrier2_D","Chaleco Combate Mejorado Árido",300]];
			_ret set[count _ret,["SAS_PlateCarrier2_W","Chaleco Combate Mejorado Boscoso",300]];
			_ret set[count _ret,["SAS_PlateCarrier2_BLK","Chaleco Combate Mejorado Negro",300]];
			_ret set[count _ret,["SAS_PlateCarrierSpec_D","Chaleco Pesado Árido",300]];
			_ret set[count _ret,["SAS_PlateCarrierSpec_W","Chaleco Pesado Boscoso",300]];
			_ret set[count _ret,["SAS_PlateCarrierSpec_BLK","Chaleco Pesado Negro",300]];
		
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute","Paracaidas",3000],
			["mochila_grande","Mochila Grande",1000]
		];
	};
};

_ret;