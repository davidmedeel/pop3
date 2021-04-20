/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {3};
	case "oilp": {3};
	case "heroinu": {3};
	case "heroinp": {3};
	case "uraniumu": {3};
	case "uraniump": {3};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {1};
	case "ornate": {1};
	case "mackerel": {2};
	case "tuna": {2};
	case "mullet": {2};
	case "catshark": {2};
	case "turtle": {2};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {2};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {2};
	case "ironore": {2};
	case "copper_r": {2};
	case "iron_r": {2};
	case "sand": {2};
	case "salt": {2};
	case "salt_r": {2};
	case "glass": {2};
	case "diamond": {2};
	case "diamondc": {2};
	case "cocaine": {2};
	case "cocainep": {4};
	case "spikeStrip": {0};
	case "barrierCop": {0};
	case "rock": {2};
	case "cement": {2};
	case "goldbar": {1.5};
	case "blastingcharge": {3};
	case "boltcutter": {2};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "wheat": {1};
	case "sunflower": {1};
	case "corn": {1};
	case "bean": {1};
	case "cotton": {1};
	case "olive": {1};
	case "opium": {4};
	case "cannabis": {2};
	case "pumpkin": {2};
	case "wheat seed": {0.5};
	case "sunflower seed": {0.5};
	case "corn seed": {0.5};
	case "bean seed": {0.5};
	case "cotton seed": {0.5};
	case "olive seed": {0.5};
	case "pavot seed": {0.5};
	case "opium Poppy": {0.5};
	case "poppy": {6};
	case "coca seed": {0.5};
	case "cannabis seed": {0.5};
	case "pumpkin seed": {0.5};
	case "RoadConeStripB": {0.5};
	case "RoadConeB": {0.5};
	case "RoadConeStrip": {0.5};
	case "RoadCone": {0.5};
	case "RoadBlockWood": {0.5};
	case "RoadBlockConc": {0.5};
	case "RoadBlockRebel": {0.5};
	case "BarGate": {0.5};
	case "raxsrum" : {0.5};
	case "zoobeer": {0.5}; // Duff Beer
	// Añadido Por Nosotros
	case "carbon" : {3};
	case "polvora" : {3};
	case "cajaali" : {3}; // Caja de Alimentos
	case "cajamedi" : {3}; // Caja de Medicamentos
	case "cajabotellas" : {3}; // Caja de botellas de agua
	case "cajamine" : {3}; // Caja Minerales
	case "aguasucia" : {3}; // Agua Sucia hierro
	case "hierro" : {3}; // hierro
	case "lingotehierro" : {3}; // Lingote de Hierro
	case "granlingote" : {2};
	case "pocionparkour" : {2};
	case "coctelmolotov" : {2};
	case "pastilladeexperiencia" : {2};
	case "placadecristal" : {2};
	case "placadecristal" : {1};
	case "pepelmoneda" : {1};
	case "componenteselectricos" : {1};
	case "pintura" : {1};
	case "papel" : {1};
	case "alcohol" : {1};
	case "amoniaco" : {1};
	case "handcuffs": {0.5};
    case "handcuffkeys": {0.5};
	case "cb": {0.1};
    // Añadido por Tisor
    case "popcono": {0.5};
    case "popconosinluz": {0.5};
    case "popbarrera": {0.5};
    case "popbarreragrande": {0.5};
    case "poparrowdeskleft": {0.5};
	case "poparrowdeskright": {0.5};




	default {1};
};
