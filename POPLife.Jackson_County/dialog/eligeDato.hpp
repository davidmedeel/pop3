
class eligeDato
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['eligeDato', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['eligeDato', nil]; ";

class controls {

class fondo: IGUIBack
{
	idc = 6380;
	x = 0.356642 * safezoneW + safezoneX;
	y = 0.3218 * safezoneH + safezoneY;
	w = 0.289808 * safezoneW;
	h = 0.1474 * safezoneH;
};
class txt: RscStructuredText
{
	idc = 6381;
	text = "Introduce un dato:"; //--- ToDo: Localize;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.3306 * safezoneH + safezoneY;
	w = 0.280493 * safezoneW;
	h = 0.0902 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class b1: RscButton
{
	idc = 6383;
	text = "ACEPTAR"; //--- ToDo: Localize;
	x = 0.356642 * safezoneW + safezoneX;
	y = 0.4692 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.044 * safezoneH;
};
class desplegable: RscCombo
{
	idc = 6382;
	x = 0.358719 * safezoneW + safezoneX;
	y = 0.4274 * safezoneH + safezoneY;
	w = 0.28465 * safezoneW;
	h = 0.0374 * safezoneH;
};
};
};
