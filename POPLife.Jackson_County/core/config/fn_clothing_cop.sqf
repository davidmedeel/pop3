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
ctrlSetText[3103,"Departamento Policial - PoPLife"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
		_ret set[count _ret,["","----- CNP -----",0]];
		_ret set[count _ret,["CNP_1","Uniforme de Agente",500]];
		_ret set[count _ret,["CNP_2","Uniforme de Oficial",500]];
		_ret set[count _ret,["CNP_3","Uniforme de Mando",500]];
		_ret set[count _ret,["UIP2","Uniforme de UIP",500]];
		_ret set[count _ret,["","----- GC -----",0]];
		_ret set[count _ret,["GC1","Uniforme de Agente",500]];
		_ret set[count _ret,["GC2","Uniforme de Oficial",500]];
		_ret set[count _ret,["GC3","Uniforme de Mando",500]];
		_ret set[count _ret,["atgc2","Uniforme de Tráfico Manga Larga",500]];
		_ret set[count _ret,["atgc","Uniforme de Tráfico Manga Corta",500]];
		_ret set[count _ret,["GRS2","Uniforme de GRS",500]];
		_ret set[count _ret,["","----- Otros -----",0]];
		_ret set[count _ret,["Ropa_GAP","Uniforme de Piloto",500]];
		_ret set[count _ret,["U_B_Wetsuit","Uniforme de Buzo",1000]];
		
        if(__GETC__(life_coplevel) > 6) then
        {
			_ret set[count _ret,["geo","Uniforme de GEO",1000]];
        };

    };

	//Hats
	case 1:
	{
			_ret set[count _ret,["","----- CNP -----",0]];
			_ret set[count _ret,["GORRA_CNP","Gorra de Agente",300]];
			_ret set[count _ret,["BOINA_CNP","Boina de Mando",300]];
			_ret set[count _ret,["BOINA_CNP3","Boina de SubCapitán",300]];
			_ret set[count _ret,["BOINA_CNP2","Boina de Capitán",300]];
			_ret set[count _ret,["H_RacingHelmet_1_black_F","Casco de Moto",300]];	
			_ret set[count _ret,["","----- GC -----",0]];
			_ret set[count _ret,["GORRA_GC","Gorra de Agente",300]];
			_ret set[count _ret,["POP_tricornio","Tricornio de Mando",400]];
			_ret set[count _ret,["BOINA_GC2","Boina de SubCapitán",300]];
			_ret set[count _ret,["BOINA_GC","Boina de Capitán",300]];
			_ret set[count _ret,["BOINA_GC3","Boina Azúl",300]];
			_ret set[count _ret,["H_RacingHelmet_1_green_F","Casco de Moto",300]];
			_ret set[count _ret,["","----- Otros -----",0]];
			_ret set[count _ret,["ffaa_casco_famet_crew","Casco de Piloto",300]];
			_ret set[count _ret,["CASCO_ANTIDISTURBIOS","Casco Antidisturbios",300]];		
		if(__GETC__(life_coplevel) > 6) then
        	{
        	_ret set[count _ret,["H_Orel_Swat","Casco de GEO",300]];
		};


	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["Masque_Chirurgical",nil,100],
			["G_Shades_Black",nil,100],
			["G_Shades_Blue",nil,100],
			["G_Sport_Blackred",nil,100],
			["TRYK_kio_balaclava",nil,100],
			["G_Sport_Checkered",nil,100],
			["G_Sport_Blackyellow",nil,100],
			["G_Sport_BlackWhite",nil,100],
			["G_Aviator",nil,100],
			["G_Squares",nil,100],
			["G_Lowprofile",nil,100],
			["TRYK_kio_balaclavas",nil,100],
			["TRYK_kio_balaclava_WH",nil,100],
			["TRYK_kio_balaclava_BLK",nil,100],
			["G_Combat",nil,100],
			["G_Diving",nil,100],
			["G_EWK_Cigar1", "Puro",100 * Desc],
			["G_EWK_Cig1", "Cigarrillo",100 * Desc],
			["G_EWK_Cig2", "Cigarrillo Quemado 1",100 * Desc],
			["G_EWK_Cig3", "Cigarrillo Consumido",100 * Desc],
			["G_EWK_Cig6", "Cigarrillo Quemado Encendido",100 * Desc],
			["G_EWK_Cig4", "Cigarrillo Encendido",100 * Desc],
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
		_ret set[count _ret,["","----- CNP -----",0]];
		_ret set[count _ret,["PGS_cinturon","Cinturón de Agente",100]];
		_ret set[count _ret,["PGS_chaleco_cnp_1","Chaleco Anticortes",1000]];
		_ret set[count _ret,["PGS_chaleco_antibalas_cnp_2","Chaleco Antibalas con Bolsillos",1000]];
		_ret set[count _ret,["PGS_chaleco_antibalas_cnp_1","Chaleco de Mando",1000]];
		_ret set[count _ret,["PGS_chaleco_tela_cnp","Chaleco Reflectante",1000]];
		_ret set[count _ret,["GAP_CNP","Chaleco GAP",1000]];
		_ret set[count _ret,["CNP_BELT","Cinturón de CNP",1000]];
		_ret set[count _ret,["","----- GC -----",0]];
		_ret set[count _ret,["PGS_cinturon","Cinturón de Agente",1000]];
		_ret set[count _ret,["PGS_chaleco_gcivil_1","Chaleco Anticortes",1000]];
		_ret set[count _ret,["PGS_chaleco_antibalas_gc_2","Chaleco Antibalas con Bolsillos",1000]];
		_ret set[count _ret,["PGS_chaleco_antibalas_gc_1","Chaleco de Mando",1000]];
		_ret set[count _ret,["PGS_chaleco_tela_gc","Chaleco Reflectante",1000]];
		_ret set[count _ret,["GAP_GC","Chaleco GAP",1000]];
		_ret set[count _ret,["CNP_BELT","Cinturón de GC",1000]];
		_ret set[count _ret,["","----- ATGC -----",0]];
		_ret set[count _ret,["pop_chaleco_gcreflectante","Cinturón de ATGC",1000]];
		_ret set[count _ret,["pop_chaleco_gct_reflectante","Chaleco de ATGC",1000]];
		_ret set[count _ret,["","----- Otros -----",0]];
		_ret set[count _ret,["V_RebreatherB","Respirador",2000]];
		if(__GETC__(life_coplevel) > 5) then
        	{
			_ret set[count _ret,["pop_chaleco_pocient2","Chaleco de UDEV",1000]];
			_ret set[count _ret,["pop_chaleco_polcient","Chaleco de Científica",1000]];
		};
		if(__GETC__(life_coplevel) > 6) then
        	{
			_ret set[count _ret,["GEO_CHALECO","Chaleco de GEO",1000]];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute","Paracaidas",3000],
			["mochila_mediana","Mochila Mediana",1000],
			["mochila_grande","Mochila Grande",2000]
		];
	};
};

_ret;
