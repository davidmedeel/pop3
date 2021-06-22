
class HUDica {
	idd = 6000;
	movingEnable = 0;
	duration = 9e+012;
	onLoad = "uiNamespace setVariable ['HUDica', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['HUDica', nil]; ";

	class controls {
		
class salud: RscProgressV
{
	idc = 6001;

	text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
	x = 0.968703 * safezoneW + safezoneX;
	y = 0.74948 * safezoneH + safezoneY;
	w = 0.0061875 * safezoneW;
	h = 0.0352 * safezoneH;
};
class sed: RscProgressV
{
	idc = 6002;

	text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
	x = 0.973344 * safezoneW + safezoneX;
	y = 0.7882 * safezoneH + safezoneY;
	w = 0.00825 * safezoneW;
	h = 0.066 * safezoneH;
};
class hambre: RscProgressV
{
	idc = 6003;

	text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
	x = 0.963031 * safezoneW + safezoneX;
	y = 0.7882 * safezoneH + safezoneY;
	w = 0.00825 * safezoneW;
	h = 0.066 * safezoneH;
};
class stamina: RscProgressV
{
	idc = 6004;

	text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
	x = 0.960969 * safezoneW + safezoneX;
	y = 0.8828 * safezoneH + safezoneY;
	w = 0.00515625 * safezoneW;
	h = 0.0572 * safezoneH;
};
class peso: RscProgressV
{
	idc = 6005;

	text = "#(argb,8,8,3)color(1,1,1,1)"; //--- ToDo: Localize;
	x = 0.977469 * safezoneW + safezoneX;
	y = 0.8828 * safezoneH + safezoneY;
	w = 0.00515625 * safezoneW;
	h = 0.0572 * safezoneH;
};
class barraExp: RscProgress
{
	idc = 6006;

	text = "#(argb,8,8,3)color(1,0.1,0,0.3)"; //--- ToDo: Localize;
	x = 0.230844 * safezoneW + safezoneX;
	y = 0.9928 * safezoneH + safezoneY;
	w = 0.53625 * safezoneW;
	h = 0.0088 * safezoneH;
};
class nombre: RscStructuredText
{
	idc = 6008;

	x = 0.842375 * safezoneW + safezoneX;
	y = 0.9378 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class dinero: RscStructuredText
{
	idc = 6009;

	x = 0.87125 * safezoneW + safezoneX;
	y = 0.9642 * safezoneH + safezoneY;
	w = 0.0794061 * safezoneW;
	h = 0.0198 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class txtExp: RscStructuredText
{
	idc = 6010;

	text = "Lvl 999"; //--- ToDo: Localize;
	x = 0.223625 * safezoneW + safezoneX;
	y = 0.9664 * safezoneH + safezoneY;
	w = 0.0639374 * safezoneW;
	h = 0.0198 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,0};
};
class txt2: RscStructuredText
{
	idc = 6014;

	text = "Energi­a: 1000/1000 | SP: 50"; //--- ToDo: Localize;
	x = 0.625709 * safezoneW + safezoneX;
	y = 0.973 * safezoneH + safezoneY;
	w = 0.139212 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class separador: RscStructuredText
{
	idc = 6011;

	text = "|"; //--- ToDo: Localize;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.98642 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,0};
};
class tiofondo: RscPicture
{
	idc = 1200;
	text = "\pop_iconos\icons\tiohud.paa";
	x = 0.951688 * safezoneW + safezoneX;
	y = 0.7398 * safezoneH + safezoneY;
	w = 0.111373 * safezoneW;
	h = 0.2464 * safezoneH;
};
class sombrainfolog: RscListBox
{
	idc = 6013;
	text = ""; //--- ToDo: Localize;
	x = 0.87100 * safezoneW + safezoneX;
	y = 0.72855 * safezoneH + safezoneY;
	w = 0.0763125 * safezoneW;
	h = 0.2024 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.034;
	rowHeight = 0.02;
};
class infolog: RscListBox
{
	idc = 6012;
	text = ""; //--- ToDo: Localize;
	x = 0.87125 * safezoneW + safezoneX;
	y = 0.7288 * safezoneH + safezoneY;
	w = 0.0763125 * safezoneW;
	h = 0.2024 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.034;
	rowHeight = 0.02;
};
class medel: RscText
{
	idc = 1008;
	text = "Medel"; //--- ToDo: Localize;
	x = 0.964475 * safezoneW + safezoneX;
	y = -0.01656 * safezoneH + safezoneY;
	w = 0.0412603 * safezoneW;
	h = 0.055 * safezoneH;
	colorBackground[] = {0,0,0,0};
	//colorText[] = {1,1,1,0.2};
};
};
};
