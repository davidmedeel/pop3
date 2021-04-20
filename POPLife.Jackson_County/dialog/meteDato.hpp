
class meteDato
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['meteDato', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['meteDato', nil]; ";

class controls {

class fondo: IGUIBack
{
	idc = 6380;
	x = 0.356642 * safezoneW + safezoneX;
	y = 0.3218 * safezoneH + safezoneY;
	w = 0.289808 * safezoneW;
	h = 0.1804 * safezoneH;
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
	y = 0.5044 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.044 * safezoneH;
};
class edit: RscEdit
{
	idc = 6382;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.279495 * safezoneW;
	h = 0.0726 * safezoneH;
};
};
};
