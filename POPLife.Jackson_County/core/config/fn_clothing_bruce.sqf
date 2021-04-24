/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
	
	Rellenada por Juan :D

*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda de Ropa - PoPLife"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Travello1","Vestido Travesti 1", 8000 * Desc], //Travello 1
			["U_C_Travello2","Vestido Travesti 2", 8000 * Desc], //travello 2
			["EF_FEM_3_2",nil, 4900 * Desc], //EF Female 3
			["EF_FEM_3",nil, 4900 * Desc], //EF Female 3 hoodie
			["EF_FEM_3_3LPBPS",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBP",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBR",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBW",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPB",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBL",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBPS2",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBP2",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBW2",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPB2",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBL2",nil, 4900 * Desc], //EF Female 3 Punks Hoodie Falda
			["U_007_BIS_Marshall",nil, 3900 * Desc], //007 Uniform
			["A3L_CivShirtObey",nil, 3900 * Desc], //7 channel
			["A3L_CivShirtAdidasMake",nil, 3900 * Desc], //Adidas Make
			["A3L_CivShirtAdidas_r",nil, 3900 * Desc], //Adidas Rasta
			["A3L_CivShirtAdidas",nil, 3900 * Desc], //Adidas
			["A3L_CivShirtAnotherCat",nil, 3900 * Desc], //Another Cat Shirt
			["APIPAS_Pop",nil, 3900 * Desc], //Apipas
			["U_C_Polo_Arbitre",nil, 3900 * Desc], //Arbitro
			["U_Marshal",nil, 3900 * Desc], //Atuendo Comisario
			["POP_Simpson",nil, 3900 * Desc], //Bart Simpson
			["A3L_CivShirtBillabong",nil, 3900 * Desc], //Billabong
			["A3L_CivShirtBillabong2",nil, 3900 * Desc], //Billabong 2
			["U_BG_Guerilla3_1",nil, 3900 * Desc], //Blusón de guerrilla
			["A3LCokeShirt",nil, 3900 * Desc], //Cannabis
			["A3LCatShirt",nil, 3900 * Desc], //Cat
			["CEDA_Pop",nil, 3900 * Desc], //Ceda el Vaso
			["CHAQUETAAZUL_Pop",nil, 3900 * Desc], //Chaqueta Azul
			["CHAQUETALEOPARDO_Pop",nil, 3900 * Desc], //Chaqueta Leopardo
			["CHAQUETAMARRON_Pop",nil, 3900 * Desc], //Chaqueta Marron
			["CHAQUETANEGRA_Pop",nil, 3900 * Desc], //Chaqueta Negra
			["CHAQUETAROJA_Pop",nil, 3900 * Desc], //Chaqueta Roja MC
			["CHAQUETASERPIENTE_Pop",nil, 3900 * Desc], //Chaqueta Serpiente
			["U_OrestesBody",nil, 3900 * Desc], //Chaqueta y Pantalón
			["U_C_Polo_Civil1",nil, 3900 * Desc], //Civil1
			["A3LCloudShirt",nil, 3900 * Desc], //Cloud Shirt
			["U_C_Polo_Dalton",nil, 3900 * Desc], //Dalton
			["A3L_CivShirtDiamond",nil, 3900 * Desc], //Diamond Shirt
			["A3L_CivShirtDJ",nil, 3900 * Desc], //DJ Shirt
			["EF_HMARMY_1",nil, 4900 * Desc], //EF Male Army
			["EF_HMARMY_2",nil, 4900 * Desc], //EF Male Army 2
			["EF_HM_LPBPS",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBP",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBR",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBW",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBL",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBPS2",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBP2",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBR2",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBW2",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPB2",nil, 4900 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBL2",nil, 4900 * Desc], //EF PUNKS hoodie
			["RAPTORS2_Pop",nil, 1900 * Desc], //RAPTORS
			["ET_Pop",nil, 1900 * Desc], //ET
			["A3L_CivShirtGetHigh",nil, 1900 * Desc], //Get High
			["A3L_CivShirtGrumpyCat",nil, 1900 * Desc], //Grumpy
			["TITTY_Pop",nil, 1900 * Desc], //Hello Titty
			["A3L_CivShirtHollister",nil, 1900 * Desc], //Hollister
			["IBERDROGA_Pop",nil, 1900 * Desc], //IberDroga
			["IDIOTA_Pop",nil, 1900 * Desc], //Idiota
			["TRONOS_Pop",nil, 1900 * Desc], //Juego de Tronos
			["JWORLD_Pop",nil, 1900 * Desc], //Jurassic World
			["A3L_CivShirtKeepCalm",nil, 1900 * Desc], //Keep Calm
			["KITKAT_Pop",nil, 1900 * Desc], //Kita Kono
			["A3L_Lacoste_C",nil, 1900 * Desc], //Lacoste
			["A3L_Lacoste_G",nil, 1900 * Desc], //Lacoste
			["A3L_Lacoste_S",nil, 1900 * Desc], //Lacoste
			["A3L_Lacoste_T",nil, 1900 * Desc], //Lacoste
			["MADURANDO_Pop",nil, 1900 * Desc], //Madurando
			["MARITRINI_Pop",nil, 1900 * Desc], //Martini
			["MORCILLA_Pop",nil, 1900 * Desc], //Morcilla
			["A3L_CivShirtNikeCamo",nil, 1900 * Desc], //Nike Cammo
			["A3L_CivShirtNikeDoIt2",nil, 1900 * Desc], //Just Do It
			["A3L_CivShirtNikeDoIt",nil, 1900 * Desc], //Just Do it
			["A3L_CivShirtNikeFeet",nil, 1900 * Desc], //My Feet Hurt
			["RAPTORS_Pop",nil, 1900 * Desc], //Ninja Raptors
			["NOENTIENDO_Pop",nil, 1900 * Desc], //Noentiendo
			["A3L_CivShirtThanksObama",nil, 1900 * Desc], //Obama
			["A3L_CivShirtOhBoy",nil, 1900 * Desc], //Ooo Yeah
			["PACMAN_Pop",nil, 1900 * Desc], //Pacman
			["PICAPIEDRA_Pop",nil, 1900 * Desc], //Picapiedra
			["A3LCivPoloGreenBlack",nil, 1900 * Desc], //Polo
			["A3LCivPoloGreenGreen",nil, 1900 * Desc], //Polo
			["A3LCivPoloGreenGrey",nil, 1900 * Desc], //Polo
			["A3LCivPoloGreenOrange",nil, 1900 * Desc], //Polo
			["A3LCivPoloUK",nil, 1900 * Desc], //Polo
			["A3LCivPoloUS",nil, 1900 * Desc], //Polo
			["POP_Chorizo",nil, 1900 * Desc], //POP
			["POP_Estoytoloko",nil, 1900 * Desc], //POP
			["POP_Google",nil, 1900 * Desc], //POP
			["POP_Lecuesta",nil, 1900 * Desc], //POP
			["POP_Logo1",nil, 1900 * Desc], //POP
			["POP_Padre",nil, 1900 * Desc], //POP
			["POP_Open",nil, 1900 * Desc], //POP
			["POP_Paridas",nil, 1900 * Desc], //POP
			["POP_Pena",nil, 1900 * Desc], //POP
			["POP_Sirena",nil, 1900 * Desc], //POP
			["POP_Torito",nil, 1900 * Desc], //POP
			["POP_Vivir",nil, 1900 * Desc], //POP
			["RastaCiv",nil, 1900 * Desc], //Pothead
			["A3L_CivShirtProbe",nil, 1900 * Desc], //Prove
			["PUMBA_Pop",nil, 1900 * Desc], //Pumba
			["A3L_Badoodlenoodleshirt",nil, 1900 * Desc], //Putin
			["U_C_HunterBody_grn",nil, 1900 * Desc], //Cazador
			["U_C_Poor_1",nil, 1900 * Desc], //Desgastada
			["U_C_Poloshirt_stripped",nil, 1900 * Desc], //Informal
			["U_C_Poloshirt_blue",nil, 1900 * Desc], //Informal
			["U_C_Poloshirt_burgundy",nil, 1900 * Desc], //Informal
			["U_C_Poloshirt_redwhite",nil, 1900 * Desc], //Informal
			["U_C_Poloshirt_salmon",nil, 1900 * Desc], //Informal
			["U_C_Poloshirt_tricolour",nil, 1900 * Desc], //Informal
			["A3L_CivShirtRelationships",nil, 1900 * Desc], //Russian
			["U_C_Superman",nil, 1900 * Desc], //Superman
			["U_BG_Guerilla2_3",nil, 4900 * Desc], //Guerrilla
			["U_BG_Guerilla2_1",nil, 4900 * Desc], //Guerrilla
			["U_BG_Guerilla2_2",nil, 4900 * Desc], //Guerrilla
			["Tren_mcam",nil, 3900 * Desc], //tren
			["TRYK_U_B_PCUGs_OD",nil, 4900 * Desc], //TRYK PCU JACKET
			["TRYK_U_B_BLK_OD_Rollup_CombatUniform",nil, 4900 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_BLK_tan_Rollup_CombatUniform",nil, 4900 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil, 4900 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_OD_Rollup_CombatUniform",nil, 4900 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil, 4900 * Desc], //TRYK ROLLUP BDU
			["TRYK_shirts_DENIM_BK",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_BL",nil, 4900 * Desc], //TRYK 
			["TRYK_shirts_DENIM_BWH",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_od",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_R",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_RED2",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_WH",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_WHB",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_ylb",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_od_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_ylb_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_BK_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_BL_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_BWH_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_R_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_RED2_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_WH_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_DENIM_WHB_Sleeve",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_PAD_BK",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BK",nil, 4900 * Desc], //TRYK
			["TRYK_shirts_OD_PAD_BK",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_TAN_PAD_BK",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_PAD_BL",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BL",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BLW",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BLU3",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_PAD",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_RED2",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_PAD_YEL",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_YEL",nil, 3900 * Desc], //TRYK
			["TRYK_shirts_TAN_PAD_YEL",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_BLK_R",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry_R",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_OD_R",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_PCUGs_OD",nil, 3900 * Desc], //TRYK
			["TRYK_U_pad_hood_Blod",nil, 3900 * Desc], //TRYK
			["TRYK_U_pad_hood_Blk",nil, 3900 * Desc], //TRYK
			["TRYK_U_pad_hood_odBK",nil, 3900 * Desc], //TRYK
			["TRYK_U_denim_hood_3c",nil, 3900 * Desc], //TRYK
			["TRYK_U_denim_hood_blk",nil, 3900 * Desc], //TRYK
			["TRYK_U_denim_hood_nc",nil, 3900 * Desc], //TRYK
			["TRYK_U_denim_jersey_blk",nil, 3900 * Desc], //TRYK
			["TRYK_U_denim_jersey_blu",nil, 3900 * Desc], //TRYK
			["TRYK_U_pad_j_blk",nil, 3900 * Desc], //TRYK
			["TRYK_U_pad_j",nil, 3900 * Desc], //TRYK //TRYK
			["TRYK_U_B_BLK_T_BG_BK",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_RED_T_BG_BR",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_BLK_T_BG_WH",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_BLK_T_BK",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_BLK_T_WH",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BG_BK",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BG_WH",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BK",nil, 3900 * Desc], //TRYK
			["TRYK_U_B_Denim_T_WH",nil, 3900 * Desc], //TRYK
			["A3L_CivShirtVans2",nil, 3900 * Desc], //Vans
			["A3L_CivShirtVolcomLogo",nil, 3900 * Desc], //Volcom
			["A3L_CivShirtVolcomMonster",nil, 3900 * Desc], //Volcom
			["A3L_CivShirtVolcom",nil, 3900 * Desc], //Volcom
			["A3LWolfShirt",nil, 3900 * Desc], //Wolf
			["EF_suit_1",nil, 5000 * Desc], //EF Suit 1
			["EF_suit_2",nil, 5000 * Desc], //EF Suit 2
			["EF_suit_3",nil, 5000 * Desc], //EF Suit 3
			["EF_suit_4",nil, 5000 * Desc], //EF Suit 4
			["EF_suit_5",nil, 5000 * Desc], //EF Suit 5
			["EF_suit_6",nil, 5000 * Desc], //EF Suit 6
			["KAEL_SUITS_BR_F3",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F12",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F8",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BLK_F",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F11",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F10",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F6",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F4",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F",nil, 5000 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F9",nil, 5000 * Desc], //Kael Suit
			["TRYK_SUITS_BR_F",nil, 5000 * Desc] //TRYK suit
		];
	};
	
	//Hats
	case 1:
	{
		[	
 			
			["H_Cap_blu", "Gorra Azul", 1000 * Desc],
			["H_Cap_blk", "Gorra Negra", 1000 * Desc],
			["H_Cap_oli", "Gorra Oliva", 1000 * Desc],
			["H_Cap_tan", "Gorra Marron", 1000 * Desc],
			["H_Cap_red", "Gorra Roja", 1000 * Desc],
			["H_Cap_surfer", "Gorra Surfista", 1000 * Desc],
			["H_Cap_grn", "Gorra Verde", 1000 * Desc],
			["pop_gorra_cyan", "Gorra Cyan Los Angeles", 1000 * Desc],
			["pop_gorra_redsox", "Gorra Boston RedSox", 1000 * Desc],
			["pop_gorra_lakers", "Gorra Lakers", 1000 * Desc],
			["pop_gorra_monster", "Gorra Monster", 1000 * Desc], 	
			["pop_gorra_superman", "Gorra Superman", 1000 * Desc], 	
			["pop_gorra_negra", "Gorra Negra New York", 1000 * Desc], 	
			["POP_Cowboy_hat", "Sombrero CowBoy", 2000 * Desc], 	
			["H_Orel_Kepi", "Gorra Kepi", 1000 * Desc], 		
			["Kio_Santa_Hat", "Gorro Papa Noel", 1000 * Desc], 	
			["H_Hat_checker", "Sombrero a Cuadros", 1000 * Desc], 	
			["H_Hat_blue", "Sombrero a Cuadros Azul", 1000 * Desc], 	
			["H_Hat_grey", "Sombrero Gris", 1000 * Desc], 	
			["H_Hat_brown", "Sombrero Marron 1", 1000 * Desc], 	
			["H_Hat_tan", "Sombrero Marron 2", 1000 * Desc], 	
			["H_StrawHat", "Sombrero de Paja", 2000 * Desc], 	
			["pop_mexicano", "Sombrero Mexicano", 2000 * Desc], 	
			["Kio_Spinning_Hat", "Gorrocoptero", 2000 * Desc],	
			["POP_Tophat", "Sombrero de Copa", 2000 * Desc], 	
			["TRYK_R_CAP_BLK", "Gorra Negra Hacia Atras", 1000 * Desc], 	
			["TRYK_R_CAP_TAN", "Gorra Marron Hacia Atras", 1000 * Desc], 	
			["TRYK_H_woolhat", "Gorro Negro", 1000 * Desc], 	
			["TRYK_H_woolhat_br", "Gorro Marron", 1000 * Desc], 	
			["TRYK_H_woolhat_cu", "Gorro Verde", 1000 * Desc], 	
			["kio_vfv_mask", "Mascara Anonimous 1", 3000 * Desc],	
			["Masque_Anonymous", "Mascara Anonymous 3", 3000 * Desc], 	
			["kio_skl_msk_adc", "Mascara Calavera Marihuana", 3000 * Desc],			
			["kio_skl_msk_black", "Mascara Calavera Negra", 3000 * Desc],
			["kio_skl_msk_can", "Mascara Calavera Canada", 3000 * Desc], 		
			["kio_skl_msk_fran", "Mascara Calavera francia", 3000 * Desc], 		
			["kio_skl_msk_frost", "Mascara Calavera Congelada", 3000 * Desc], 		
			["kio_skl_msk_GOW", "Mascara Calavera GoW", 3000 * Desc], 		
			["kio_skl_msk_german", "Mascara Calavera Alemania", 3000 * Desc], 		
			["kio_skl_msk_grey", "Mascara Calavera Gris", 3000 * Desc], 		
			["kio_skl_msk_irish", "Mascara Calavera Irlanda 1", 3000 * Desc], 				
			["kio_skl_msk_nirish", "Mascara Calavera Irlanda 2", 3000 * Desc], 				
			["kio_skl_msk_o", "Mascara Calavera Naranja", 3000 * Desc], 				
			["kio_skl_msk_pun", "Mascara Calavera Punisher", 3000 * Desc], 				
			["kio_skl_msk_p", "Mascara Calavera Morada", 3000 * Desc], 				
			["kio_skl_msk_redranger", "Mascara Calavera Power Ranger", 3000 * Desc], 				
			["kio_skl_msk", "Mascara Calavera Blanca y Negra", 3000 * Desc], 				
			["kio_skl_msk_grn", "Mascara Calavera verde y Negra", 3000 * Desc], 				
			["kio_skl_msk_red", "Mascara Calavera Roja y Negra", 3000 * Desc], 				
			["kio_skl_msk_scot", "mascara Calavera Escocia", 3000 * Desc], 				
			["kio_skl_msk_UK", "mascara Calavera UK", 3000 * Desc], 				
			["kio_skl_msk_US", "mascara Calavera US", 3000 * Desc], 				
			["H_AntmanMask", "Mascara AntMan", 3000 * Desc], 		
			["H_AugustusMask", "Mascara GoW", 3000 * Desc], 		
			["H_BatmanMask", "Mascara Batman", 3000 * Desc], 		
			["H_BushMask", "Mascara Presidente Bush", 3000 * Desc], 		
			["H_BobaMask", "Mascara La Empresa", 3000 * Desc], 					
			["pop_robocop", "Mascara RoboCop", 3000 * Desc], 		
			["H_ClintonMask", "Mascara Presidente Clinton", 3000 * Desc], 		
			["H_Orel_Mask_Dead", "Mascara Muerte", 3000 * Desc], 	
			["H_DeadpoolMask", "Mascara Deadpool", 3000 * Desc], 		
			["H_FranklinMask", "Mascara Presidente Franklin", 3000 * Desc], 		
			["H_RAAMMask", "Mascara General RAAM", 3000 * Desc], 		
			["H_GrantMask", "Mascara Presidente Grant", 3000 * Desc], 		
			["H_HulkMask", "Mascara Hulk", 3000 * Desc], 		
			["H_JasonMask", "Mascara Jason Voorhes", 3000 * Desc], 		
			["H_LincolnMask", "Mascara Presidente Lincoln", 3000 * Desc], 		
			["Masque_Mempo", "Mascara Mempo", 3000 * Desc], 		
			["Masque_Alien1", "Mascara Alien", 3000 * Desc], 		
			["Masque_archNemesis", "Mascara Arch Nemesis", 3000 * Desc], 		
			["Masque_Arnold", "Mascara Arnold", 3000 * Desc], 		
			["Masque_Aubrey", "Marcara Cerdo", 3000 * Desc],
			["Masque_Bonnie", "Mascara Bonnie", 3000 * Desc], 		
			["Masque_Chains", "Mascara Payaso Chains", 3000 * Desc], 		
			["Masque_Dallas", "MAscara Payaso Dallas", 3000 * Desc], 		
			["Masque_Hoxton", "Mascara Payaso Hoxton", 3000 * Desc], 
			["Masque_Wolfv2", "Mascara Payaso Wolf", 3000 * Desc], 					
			["Masque_Gombo", "Mascara Payaso Gombo", 3000 * Desc], 		
			["Masque_Incendiaire", "Mascara Payaso Incendiare", 3000 * Desc], 		
			["Masque_Macrilleuse", "Mascara Payaso Pussy Destroller", 3000 * Desc], 		
			["Masque_Smiley", "Macars Payaso Smiley", 3000 * Desc], 		
			["Masque_Clover", "Mascara Payaso Clover", 3000 * Desc], 		
			["Masque_Chuck", "Mascara de Aguila", 3000 * Desc], 		
			["Masque_Fish", "Mascara de Pez", 3000 * Desc], 		
			["Masque_GdG", "Mascara Cara Feliz", 3000 * Desc], 		
			["Masque_Hockey", "Mascara Hockey", 3000 * Desc], 		
			["Masque_Lion", "Mascara de leon", 3000 * Desc], 		
			["Masque_Mark", "Mascara de Oso", 3000 * Desc], 		
			["Masque_Momie", "Mascara de Momia", 3000 * Desc], 		
			["Masque_Optimiste", "Mascara de Robot", 3000 * Desc], 		
			["Masque_Orc", "MAscara de Orco", 3000 * Desc], 		
			["Masque_Religieuse", "Mascara de Monja", 3000 * Desc], 		
			["Masque_Santa", "Mascara de Papa Noel", 3000 * Desc], 		
			["Masque_speedRunner", "Mascara de Speed Runner", 3000 * Desc], 		
			["Masque_Unic", "Mascara de Unicorio", 3000 * Desc], 		
			["H_ObamaMask", "·Mascara Obama", 3000 * Desc], 		
			["H_PatriotMask", "Mascara IronMan", 3000 * Desc], 		
			["H_ScarecrowMask", "Mascara Espantapajaros", 3000 * Desc], 		
			["H_ShrekMask", "Mascara Shrek", 3000 * Desc], 		
			["H_SpidermanMask", "Mascara de Spiderman", 3000 * Desc], 		
			["H_SpongebobMask", "Mascara de Bob Esponja", 3000 * Desc], 		
			["H_SquidwardMask", "MAscara de Calamardo", 3000 * Desc], 		
			["H_UltronMask", "Mascara Ultron", 3000 * Desc], 		
			["H_GingerbreadMask", "Mascara Galleta", 3000 * Desc], 		
			["H_VenomMask", "Mascara de Venom", 3000 * Desc], 		
			["Kio_Hat", "Cubreorejas Calentito", 3000 * Desc],
["medel_casco_motocross", "Casco de Moto Integral", 1000 * Desc], 	
			["H_RacingHelmet_1_yellow_F", "Casco de Moto Amarillo", 1000 * Desc], 	
			["H_RacingHelmet_1_blue_F", "Casco de Moto Azul", 1000 * Desc], 	
			["H_RacingHelmet_1_white_F", "Casco de Moto Blanco", 1000 * Desc], 	
			["H_RacingHelmet_1_red_F", "Casco de Moto Rojo", 1000 * Desc], 	
			["H_RacingHelmet_1_green_F", "Casco de Moto Verde", 1000 * Desc], 
			["H_RacingHelmet_1_orange_F", "Casco de Moto Naranja", 1000 * Desc], 	
			["H_RacingHelmet_1_black_F", "Casco de Moto Negro", 1000 * Desc], 	
			["H_RacingHelmet_3_F", "Casco de Moto Dorado", 1000 * Desc], 	
			["H_RacingHelmet_2_F", "Casco de Moto BlueKing", 1000 * Desc], 	
			["H_RacingHelmet_1_F", "Casco de Moto Fuel", 1000 * Desc], 	
			["H_RacingHelmet_4_F", "Casco de Moto Vrana", 1000 * Desc], 	
			["EF_Punk_wig_B", "Cresta Punk Negra", 3000 * Desc], 	
			["POP_Mohawk", "Cresta Mohawk", 3000 * Desc] 
		];
	};
	
	//Glasses
	case 2:
	{
		[	

			["G_Shades_Blue", "Gafas Deportivas Azules",600 * Desc],
			["G_Shades_Black", "Gafas Deportivas Negras",600 * Desc],
			["G_Sport_Red", "Gafas Deportivas Rojas",600 * Desc],
			["G_Sport_Blackyellow", "Gafas Deportivas Abejorro",600 * Desc],
			["G_Sport_BlackWhite", "Gafas Deportivas Black&White",600 * Desc],
			["G_Sport_Blackred", "Gafas Deportivas Llama",600 * Desc],
			["G_Sport_Greenblack", "gafas Deportivas Monster",600 * Desc],
			["G_Shades_Red", "Gafas Deportivas Rojas",600 * Desc],
			["G_Shades_Green", "Gafas Deportivas verdes",600 * Desc],
			["G_Aviator", "Gafas de Aviador",600 * Desc],
			["G_Spectacles", "Gafas de Pasta Marrones",600 * Desc],
			["G_Spectacles_Tinted", "Gafas P. Marrones Tintadas",600 * Desc],
			["G_Squares", "Gafas de Espejo Cuadradas",600 * Desc],
			["G_Lowprofile", "Gafas de Buceo",600 * Desc],
			["G_EWK_Shemag_NB", "Bufanda Blanca",600 * Desc],
			["G_EWK_Shemag_GRE", "Bufanda verde",600 * Desc],
			["G_EWK_Shemag_tan", "Bufanda Marron",600 * Desc],
			["G_Bandanna_aviator", "Pañuelo de Aviador",600 * Desc],
			["G_Bandanna_beast", "Pañuelo de Bestia",600 * Desc],
			["G_Bandanna_khk", "Pañuelo caqui",600 * Desc],
			["G_Bandanna_tan", "Pañuelo Marron",600 * Desc],
			["G_Bandanna_blk", "Pañuelo Negro",600 * Desc],
			["G_Bandanna_oli", "Pañuelo Oliva",600 * Desc],
			["TRYK_kio_balaclava_BLK", "Pasamontanas Cuero Ajustado Negro",600 * Desc],
			["G_Balaclava_oli", "Pasamontañas Tela Ajustado Oliva",600 * Desc],
			["G_Balaclava_blk", "Pasamontañas Tela Ajustado Negro",600 * Desc],
			["G_Bandanna_sport", "Pañuelo Negero & Gafas 1",1200 * Desc],
			["G_Bandanna_shades", "Pañuelo Negero & Gafas 2",1200 * Desc],
			["G_EWK_Cigar2", "Gafas Aviador & Puro",1200 * Desc],
			["G_EWK_Glasses_Cig1", "Gafas Aviador & Cigarrillo 1",1200 * Desc],
			["G_EWK_Glasses_Cig6", "Gafas Aviador & Cigarrillo 2",1200 * Desc],
			["G_EWK_Glasses_Cig4", "Gafas & Cigarrillo 3",1200 * Desc],
			["G_EWK_Shemag_NB_Cig6", "Pañuelo Blanco & Cigarrillo",1200 * Desc],
			["G_EWK_Shemag_GRE_Cig6", "Pañuelo Verde & Cigarrillo",1200 * Desc],
			["G_EWK_Shemag_tan_Cig6", "Pañuelo Marron & Cigarrillo",1200 * Desc],
			["G_EWK_Glasses_Shemag_NB_Cig6", "Gafas & Pañuelo Blanco & Cigarrillo",1800 * Desc],
			["G_EWK_Glasses_Shemag_GRE_Cig6", "Gafas & Pañuelo Verde & Cigarrillo",1800 * Desc],
			["G_EWK_Glasses_Shemag_tan_Cig6", "Gafas & Pañuelo Marron & Cigarrillo",1800 * Desc],
			["G_EWK_Glasses_Cig3", "Gafas & Cigarrillo Consumido",1200 * Desc],
			["G_EWK_Cigar1", "Puro",600 * Desc],
			["G_EWK_Cig1", "Cigarrillo",600 * Desc],
			["G_EWK_Cig2", "Cigarrillo Quemado 1",600 * Desc],
			["G_EWK_Cig3", "Cigarrillo Consumido",600 * Desc],
			["G_EWK_Cig6", "Cigarrillo Quemado Encendido",600 * Desc],
			["G_EWK_Cig4", "Cigarrillo Encendido",600 * Desc],
			["SFG_Tac_ChopsB", "Barba Corta Rubia",600 * Desc],
			["SFG_Tac_ChopsD", "Barba Corta Castaña",600 * Desc],
			["SFG_Tac_ChopsG", "Barba Corta PeliRoja",600 * Desc],
			["SFG_Tac_ChopsO", "Barba Corta Canosa",600 * Desc],
			["SFG_Tac_smallBeardB", "Barba Mediana Rubia",600 * Desc],
			["SFG_Tac_smallBeardD", "Barba Mediana Castaña",600 * Desc],
			["SFG_Tac_smallBeardG", "Barba Mediana PeliRoja",600 * Desc],
			["SFG_Tac_smallBeardO", "Barba Mediana Canosa",600 * Desc],
			["SFG_Tac_BeardB", "Barba Larga Rubia",600 * Desc],
			["SFG_Tac_BeardD", "Barba Larga Castaña",600 * Desc],
			["SFG_Tac_BeardG", "Barba LArga PeliRoja",600 * Desc],
			["SFG_Tac_BeardO", "Barba Larga Canosa",600 * Desc],
			["SFG_Tac_chinlessbB", "Barba & Bigote Rubio",600 * Desc],
			["SFG_Tac_chinlessbD", "Barba & Bigote Castaño",600 * Desc],
			["SFG_Tac_chinlessbG", "Barba & Bigote PeliRojo",600 * Desc],
			["SFG_Tac_chinlessbO", "Barba & Bigote Canoso",600 * Desc],
			["SFG_Tac_moustacheB", "Bigote Rubio ",600 * Desc],
			["SFG_Tac_moustacheD", "Bigote Castaño",600 * Desc],
			["SFG_Tac_moustacheG", "Bigote PeliRojo",600 * Desc],
			["SFG_Tac_moustacheO", "Bigote Canoso",600 * Desc],
			["TRYK_Beard_BK", "Barba & Perilla Negra Corta",600 * Desc],
			["TRYK_Beard", "Barba & Perilla Castaña 1 Corta",600 * Desc],
			["TRYK_Beard_BW", "Barba & Perilla Castaña 2 Corta",600 * Desc],
			["TRYK_Beard_Gr", "Barba & Perilla Canosa Corta",600 * Desc],
			["TRYK_Beard_BK3", "Barba & Perilla Negra Larga",600 * Desc],
			["TRYK_Beard3", "Barba & Perilla Castaña 1 Larga",600 * Desc],
			["TRYK_Beard_BW3", "Barba & Perilla Castaña 2 Larga",600 * Desc],
			["TRYK_Beard_Gr3", "Barba & Perilla Larga",600 * Desc]
		];
	};
	
	//Vest
	case 3:
	{
		[

			["",nil,0 * Desc]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr", "Mochila de Asalto pequeña 1",3000 * Desc],
			["B_AssaultPack_blk", "Mochila de Asalto pequeña 2",3000 * Desc],			
			["B_FieldPack_cbr", "Mochila de Campo",3000 * Desc],
			["A3L_BergenMurica", "Mochila verde",3000 * Desc],
			["B_Carryall_cbr", "mochila de Viaje",3000 * Desc],
			["mochila_pequena", "Mochila Pequeña",4000 * Desc]		
		];
	};
};