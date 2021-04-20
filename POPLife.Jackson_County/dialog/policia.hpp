class policia_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['policia_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['policia_dialog', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by TDR Acj, v1.063, #Hymymy)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	type = CT_STATIC;
	style = ST_PICTURE;
	text = "\pop_iconos\paa\policia.paa";
	idc = -1;
	x = 0.206093 * safezoneW + safezoneX;
	y = 0.115 * safezoneH + safezoneY;
	w = 0.592969 * safezoneW;
	h = 0.726 * safezoneH;
};
class BotonBuscar: RscButton
{
	idc = -1;
	text = "Buscar"; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.055 * safezoneH;
};
class BotonFichar: RscButton
{
	idc = -1;
	text = "Fichar"; //--- ToDo: Localize;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.055 * safezoneH;
};
class botonAyuda: RscButton
{
	idc = -1;
	text = "Ayuda"; //--- ToDo: Localize;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.055 * safezoneH;
};
class BotonAviso: RscButton
{
	idc = -1;
	text = "Aviso"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.055 * safezoneH;
};
class mensaje: RscText
{
	idc = -1;
	text = "Enviar Mensaje"; //--- ToDo: Localize;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.044 * safezoneH;
};
class RscEdit_1400: RscEdit
{
	idc = -1;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.275 * safezoneH;
};
class ListadeBuscados: RscListbox
{
	idc = -1;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.275 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};