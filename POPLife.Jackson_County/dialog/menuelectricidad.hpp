class electricidad_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['electricidad_dialog', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['electricidad_dialog', nil]; abierto = nil;";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Icaruk, v1.063, #Cahaxo)
////////////////////////////////////////////////////////

class fondo: IGUIBack
{
	idc = -1;
	x = 0.448425 * safezoneW + safezoneX;
	y = 0.3262 * safezoneH + safezoneY;
	w = 0.114503 * safezoneW;
	h = 0.1188 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
};
class energiaActual: RscText
{
	idc = 9260;
	text = ""; //--- ToDo: Localize;
	x = 0.460802 * safezoneW + safezoneX;
	y = 0.3394 * safezoneH + safezoneY;
	w = 0.0887096 * safezoneW;
	h = 0.0352 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class botonCombustible: RscButton2
{
	action = "_nil = [ctrlText 9251] execVM ""ica\electricidad\meterCombustible.sqf""";

	idc = 9261;
	text = "+ Combustible"; //--- ToDo: Localize;
	x = 0.461834 * safezoneW + safezoneX;
	y = 0.3834 * safezoneH + safezoneY;
	w = 0.0876778 * safezoneW;
	h = 0.0374 * safezoneH;
	tooltip = "1 bidon de combustible = 1500E"; //--- ToDo: Localize;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////



	};
};

