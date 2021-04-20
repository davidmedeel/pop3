/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("\pop_iconos\icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("\pop_iconos\icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("\pop_iconos\icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("\pop_iconos\icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("\pop_iconos\icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("\pop_iconos\icons\items\marijuana.paa")};
	case "life_inv_apple": {("\pop_iconos\icons\items\apple.paa")};
	case "life_inv_rabbit": {("\pop_iconos\icons\items\meat.paa")};
	case "life_inv_salema": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_ornate": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_mackerel": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_tuna": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_mullet": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_catshark": {("\pop_iconos\icons\items\fish.paa")};
	case "life_inv_turtle": {("\pop_iconos\icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("\pop_iconos\icons\items\fishingpoles.paa")};
	case "life_inv_water": {("\pop_iconos\icons\items\water.paa")};
	case "life_inv_coffee": {("\pop_iconos\icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("\pop_iconos\icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("\pop_iconos\icons\items\donut.paa")};
	case "life_inv_fuelE": {("\pop_iconos\icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("\pop_iconos\icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("\pop_iconos\icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("\pop_iconos\icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("\pop_iconos\icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("\pop_iconos\icons\items\iron.paa")};
	case "life_inv_copperr": {("\pop_iconos\icons\items\copper.paa")};
	case "life_inv_sand": {("\pop_iconos\icons\items\sand.paa")};
	case "life_inv_salt": {("\pop_iconos\icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("\pop_iconos\icons\items\salt.paa")};
	case "life_inv_glass": {("\pop_iconos\icons\items\glass.paa")};
	case "life_inv_diamond": {("\pop_iconos\icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("\pop_iconos\icons\items\diamond.paa")};
	case "life_inv_tbacon": {("\pop_iconos\icons\items\meat.paa")};
	case "life_inv_redgull": {("\pop_iconos\icons\items\redgull.paa")};
	case "life_inv_lockpick": {("\pop_iconos\icons\items\lockpick.paa")};
	case "life_inv_peach": {("\pop_iconos\icons\items\peach.paa")};
	case "life_inv_coke": {("\pop_iconos\icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("\pop_iconos\icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("\pop_iconos\icons\items\spikestrip.paa")};
	case "life_inv_rock": {("\pop_iconos\icons\items\rock.paa")};
	case "life_inv_cement": {("\pop_iconos\icons\items\cement.paa")};
	case "life_inv_goldbar": {("\pop_iconos\icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("\pop_iconos\icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("\pop_iconos\icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("\pop_iconos\icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("\pop_iconos\icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("\pop_iconos\icons\items\storagebig.paa")};
	default {("\pop_iconos\icons\items\noicon.paa")};
};