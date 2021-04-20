// DIALOGO HECHO POR JORDAN CONNOR Y INDIANA JONES www.plataoplomo.wtf
class Craft
{
	idd = 19700;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['Craft', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['Craft', nil]; ";
	class RscActivePicture
	{
		deletable = 0;
		fade = 0;
		color[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
		colorActive[]= {1,1,1,0};
		colorDisabled[] = {1,1,1,1};
		soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
		soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		access = 0;
		type = 11;
		idc = -1;
		style = 48;
		font = "TahomaB";
		sizeEx = 0;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		shadow = 2;
		x = 0;
		y = 0;
		w = 0.2;
		h = 0.15;
		default = true;
	};
	class controls
		{
class CraftRscPicture_1001: RscPicture
{
	idc = 1200;
	text = "fotos\crafteo\fondocraft.paa";
	x = 0.154428 * safezoneW + safezoneX;
	y = 0.13722 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.682 * safezoneH;
};
class CraftRscActivePicture_1002: RscActivePicture
{
	idc = 5039;

	text = "fotos\crafteo\botoncraft.paa"; //--- ToDo: Localize;
	x = 0.344694 * safezoneW + safezoneX;
	y = 0.625673 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.198 * safezoneH;
};
class CraftRscText_1003: RscEdit
{
	idc = 5034;

	text = "1"; //--- ToDo: Localize;
	x = 0.292822 * safezoneW + safezoneX;
	y = 0.645764 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {-1,1,1,1};
	colorBackground[] = {-1,-1,-1,0};
	colorActive[] = {-1,-1,-1,1};
};
class RscListbox_1004: RscListBox
{
	idc = 5035;
	onLBSelChanged = "['actualiza2'] call ica_fnc_menucrafteo";
	font = "TahomaB";

	x = -10.66 * GUI_GRID_W + GUI_GRID_X;
	y = 0.49 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.46216 * GUI_GRID_W;
	h = 17.3482 * GUI_GRID_H;
};
class RscListbox_1005: RscListBox
{
	idc = 5036;
	onLBSelChanged = "['actualiza3'] call ica_fnc_menucrafteo";
	font = "TahomaB";

	x = 0.307466 * safezoneW + safezoneX;
	y = 0.2371 * safezoneH + safezoneY;
	w = 0.0961147 * safezoneW;
	h = 0.38166 * safezoneH;
};
class RscListbox_1006: RscListBox
{
	idc = 5037;
	font = "TahomaB";

	x = 0.431937 * safezoneW + safezoneX;
	y = 0.2371 * safezoneH + safezoneY;
	w = 0.0968466 * safezoneW;
	h = 0.380358 * safezoneH;
};
class medel: RscText
{
    idc = -1;
    text = "Medel"; //--- ToDo: Localize;
    x = 0.964445 * safezoneW + safezoneX;
    y = -0.0166667 * safezoneH + safezoneY;
    w = 0.0412603 * safezoneW;
    h = 0.055 * safezoneH;
    colorBackground[] = {0,0,0,0};
};
};
};
