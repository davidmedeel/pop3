/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Marche",["zoobeer","raxsrum","water","apple","redgull","lockpick","pickaxe","peach","boltcutter","storagesmall","storagebig","cb"]]};
	case "rebel": {["Marche rebelle",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","peach","menottes","boltcutter","blastingcharge","handcuffs","handcuffkeys"]]};
	case "gang": {["Marche du gang", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","peach","blastingcharge","boltcutter"]]};
	case "bar": {["Bar",["beer","wine","jack"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["LakeBucks",["coffee","donuts"]]};
	case "heroin": {["Dealer du coin",["cocainep","heroinp","marijuana"]]};
	case "uranium": {["Revendeur d uranium",["uraniump"]]};
	case "oil": {["Revendeur de petrole",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Poissonerie",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "farmingmarket": {["Marche de la ferme",["wheat seed","sunflower seed","corn seed","bean seed","cotton seed","olive seed"]]};
	case "blackfarmingmarket": {["Marche noir",["cannabis seed","pavot seed","pumpkin seed"]]};
	case "glass": {["Revendeur de verre",["glass"]]};
	case "iron": {["Revendeur industriel",["iron_r","copper_r"]]};
	case "diamond": {["Diamantaire",["diamond","diamondc"]]};
	case "salt": {["Revendeur de sel",["salt_r"]]};
	case "cop": {["Police Cafet",["handcuffs","handcuffkeys", "donuts","coffee","water","rabbit","apple","redgull","fuelF","defusekit","spikeStrip","popcono","popconosinluz","popbarrera","popbarreragrande","poparrowdeskright","poparrowdeskleft"]]};
	case "cement": {["Revendeur de ciment",["cement"]]};
	case "gold": {["Acheteur d or",["goldbar"]]};
	case "mineria": {["Producto Mineria",["carbon","hierro","sand","polvora"]]};
	case "granja": {["La Granja",["wheat","sunflower","corn","bean","cotton","olive","pumpkin","aguasucia"]]};
	case "empresario": {["Tienda del Empresario",["cajaali","cajamedi","cajabotellas","cajamine"]]};
	case "detodo": {["Tienda del Mercancias",["cajaali","cajamedi","cajabotellas","cajamine","aguasucia","oilp","wheat","sunflower","corn","bean","cotton","olive","pumpkin"]]};
	case "mineria": {["Tienda del los Mineros",["carbon","polvora","hierro","sand","goldbar","diamondr"]]};
	case "ems": {["Tienda EMS",["donuts","coffee","water","rabbit","apple","redgull","fuelF","popcono","popconosinluz","popbarrera","popbarreragrande","poparrowdeskright","poparrowdeskleft"]]};
};
