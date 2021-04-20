/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "uraniumu": {"life_inv_uraniumu"};
			case "uraniump": {"life_inv_uraniump"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "apple seeds": {"life_inv_appleseeds"};
			case "burgers": {"life_inv_burgers"};
			case "cono": {"life_inv_cono"};
			case "barrera": {"life_inv_barrera"};
			case "valla": {"life_inv_valla"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"medel_din"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "barrierCop": {"life_inv_barrierCop"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "wheat": {"life_inv_wheat"};
			case "sunflower": {"life_inv_sunflower"};
			case "corn": {"life_inv_corn"};
			case "bean": {"life_inv_bean"};
			case "cotton": {"life_inv_cotton"};
			case "olive": {"life_inv_olive"};
			case "opium": {"life_inv_opium"};
			case "cannabis": {"life_inv_cannabis"};
			case "pumpkin": {"life_inv_pumpkin"};
			case "wheat seed": {"life_inv_wheatseeds"};
			case "sunflower seed": {"life_inv_sunflowerseeds"};
			case "corn seed": {"life_inv_cornseeds"};
			case "bean seed": {"life_inv_beanseeds"};
			case "cotton seed": {"life_inv_cottonseeds"};
			case "olive seed": {"life_inv_oliveseeds"};
			case "pavot seed": {"life_inv_pavotseeds"};
			case "coca seed": {"life_inv_cocaseeds"};
			case "cannabis seed": {"life_inv_cannabisseeds"};
			case "pumpkin seed": {"life_inv_pumpkinseeds"};
			case "beer": {"life_inv_beer"};
			case "wine": {"life_inv_wine"};
			case "jack": {"life_inv_jack"};
			case "cigarette": {"life_inv_cigarette"};
			case "RoadConeStripB": {"life_inv_RoadConeStripB"};
			case "RoadConeB": {"life_inv_RoadConeB"};
			case "RoadConeStrip": {"life_inv_RoadConeStrip"};
			case "RoadCone": {"life_inv_RoadCone"};
			case "RoadBlockWood": {"life_inv_RoadBlockWood"};
			case "RoadBlockConc": {"life_inv_RoadBlockConc"};
			case "RoadBlockRebel": {"life_inv_RoadBlockRebel"};
			case "BarGate": {"life_inv_BarGate"};
			case "zoobeer": {"life_inv_zoobeer"}; // Duff Beer
			case "raxsrum": {"life_inv_raxsrum"};
            case "multipass": {"life_inv_multipass"};
            case "menottes": {"life_inv_menottes"};
			case "carbon" : {"life_inv_carbon"};
			case "polvora" : {"life_inv_polvora"};
			case "cajaali" : {"life_inv_cajaali"}; // Caja de Alimentos
			case "cajamedi" : {"life_inv_cajamedi"}; // Caja de Medicamentos
			case "cajabotellas" : {"life_inv_cajabotellas"}; // Caja de botellas de agua
			case "cajamine" : {"life_inv_cajamine"}; // Caja Minerales
			case "aguasucia" : {"life_inv_aguasucia"}; // Agua Sucia
			case "hierro" : {"life_inv_hierro"}; // Hierro
			case "lingotehierro" : {"life_inv_lingotehierro"}; // Lingo Hierro
			case "granlingote" : {"life_inv_granlingote"};
			case "pocionparkour" : {"life_inv_pocionparkour"};
			case "coctelmolotov" : {"life_inv_coctelmolotov"};
			case "pastilladeexperiencia" : {"life_inv_pastilladeexperiencia"};
			case "pepelmoneda" : {"life_inv_pepelmoneda"};
			case "componenteselectricos" : {"life_inv_componenteselectricos"};
			case "placadecristal" : {"life_inv_placadecristal"};
			case "pintura" : {"life_inv_pintura"};
			case "papel" : {"life_inv_papel"};
			case "alcohol" : {"life_inv_alcohol"};
			case "amoniaco" : {"life_inv_amoniaco"};
			case "handcuffs": {"life_inv_handcuffs"};
            case "handcuffkeys": {"life_inv_handcuffkeys"};
			case "cb": {"life_inv_cb"};
			case "popcono": {"life_inv_popcono"};
			case "popconosinluz": {"life_inv_popconosinluz"};
			case "popbarrera": {"life_inv_popbarrera"};
			case "popbarreragrande": {"life_inv_popbarreragrande"};
			case "poparrowdeskleft": {"life_inv_poparrowdeskleft"};
			case "poparrowdeskright": {"life_inv_poparrowdeskright"};




		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_uraniumu": {"uraniumu"};
			case "life_inv_uraniump": {"uraniump"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_burgers": {"burgers"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "medel_din": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_wine": {"wine"};
			case "life_inv_beer": {"beer"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_barrierCop": {"barrierCop"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_wheat": {"wheat"};
			case "life_inv_sunflower": {"sunflower"};
			case "life_inv_corn": {"corn"};
			case "life_inv_bean": {"bean"};
			case "life_inv_cotton": {"cotton"};
			case "life_inv_olive": {"olive"};
			case "life_inv_opium": {"opium"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_pumpkin": {"pumpkin"};
			case "life_inv_wheatseeds": {"wheat seed"};
			case "life_inv_sunflowerseeds": {"sunflower seed"};
			case "life_inv_cornseeds": {"corn seed"};
			case "life_inv_beanseeds": {"bean seed"};
			case "life_inv_cottonseeds": {"cotton seed"};
			case "life_inv_oliveseeds": {"olive seed"};
			case "life_inv_pavotseeds": {"pavot seed"};
			case "life_inv_cocaseeds": {"coca seed"};
			case "life_inv_cannabisseeds": {"cannabis seed"};
			case "life_inv_pumpkinseeds": {"pumpkin seed"};
			case "life_inv_zoobeer": {"zoobeer"};
			case "life_inv_jack": {"jack"};
			case "life_inv_cigarette": {"cigarette"};
			case "life_inv_RoadConeStripB": {"RoadConeStripB"};
			case "life_inv_RoadConeB": {"RoadConeB"};
			case "life_inv_RoadConeStrip": {"RoadConeStrip"};
			case "life_inv_RoadCone": {"RoadCone"};
			case "life_inv_RoadBlockWood": {"RoadBlockWood"};
			case "life_inv_RoadBlockConc": {"RoadBlockConc"};
			case "life_inv_RoadBlockRebel": {"RoadBlockRebel"};
			case "life_inv_BarGate": {"BarGate"};
			case "life_inv_raxsrum": {"raxsrum"};
            case "life_inv_multipass": {"multipass"};
            case "life_inv_menottes": {"menottes"};
			case "life_inv_cono": {"cono"};
			case "life_inv_barrera": {"barrera"};
			case "life_inv_valla": {"valla"};
			case "life_inv_carbon": {"carbon"};
			case "life_inv_polvora": {"polvora"};
			case "life_inv_cajaali": {"cajaali"};
			case "life_inv_cajamedi": {"cajamedi"};
			case "life_inv_cajabotellas": {"cajabotellas"};
			case "life_inv_cajamine": {"cajamine"};
			case "life_inv_aguasucia": {"aguasucia"};
			case "life_inv_hierro": {"hierro"};
			case "life_inv_lingotehierro": {"lingotehierro"};
			case "life_inv_granlingote": {"granlingote"};
			case "life_inv_pocionparkour": {"pocionparkour"};
			case "life_inv_coctelmolotov": {"coctelmolotov"};
			case "life_inv_pastilladeexperiencia": {"pastilladeexperiencia"};
			case "life_inv_placadecristal": {"placadecristal"};
			case "life_inv_pepelmoneda": {"pepelmoneda"};
			case "life_inv_componenteselectricos": {"componenteselectricos"};
			case "life_inv_pintura": {"pintura"};
			case "life_inv_papel": {"papel"};
			case "life_inv_alcohol": {"alcohol"};
			case "life_inv_amoniaco": {"amoniaco"};
			case "life_inv_handcuffs": {"handcuffs"};
            case "life_inv_handcuffkeys": {"handcuffkeys"};
			case "life_inv_cb": {"cb"};
        	case "life_inv_popcono": {"popcono"};
        	case "life_inv_popconosinluz": {"popconosinluz"};
        	case "life_inv_popbarrera": {"popbarrera"};
        	case "life_inv_popbarreragrande": {"popbarreragrande"};
        	case "life_inv_poparrowdeskright": {"poparrowdeskright"};
        	case "life_inv_poparrowdeskleft": {"poparrowdeskleft"};

		};
	};
};
