
class ventaOrganos {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['ventaOrganos', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['ventaOrganos', nil];";

class controls {

class fondo: IGUIBack
{
	idc = 2200;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.293906 * safezoneW;
	h = 0.099 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class texto: RscText
{
	idc = 1000;
	text = "Escoge el tipo de organo que quieres vender:"; //--- ToDo: Localize;
	x = 0.340156 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.283594 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0.702,0.102,0.102,1};
};
class ojos: RscButton
{
	idc = 1600;
	onButtonClick = "['ojos'] spawn ica_fnc_ventaOrganos;";
	text = "Ojo"; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.055 * safezoneH;
};
class estomago: RscButton
{
	idc = 1601;
	onButtonClick = "['estomago'] spawn ica_fnc_ventaOrganos;";
	text = "Estomago"; //--- ToDo: Localize;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.055 * safezoneH;
};
class corazon: RscButton
{
	idc = 1602;
	onButtonClick = "['corazon'] spawn ica_fnc_ventaOrganos;";
	text = "Corazon"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.055 * safezoneH;
};
class credito: RscText
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
