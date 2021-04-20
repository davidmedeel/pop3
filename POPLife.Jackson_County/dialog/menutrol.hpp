class Menutrol_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['Menutrol_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['Menutrol_dialog', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by TDR Acj, v1.063, #Vexero)
////////////////////////////////////////////////////////

class imagen: RscPicture
{
	type = CT_STATIC;
	style = ST_PICTURE;
	text = "\pop_iconos\paa\trol1.paa";
	idc = -1;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.180469 * safezoneW;
	h = 0.517 * safezoneH;
};
class Botonpineta: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\peineta.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Peineta"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class Botonpaja: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\paja.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Paja"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class BotonMear: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\mear.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Mear"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class BotonPlantarpino: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\plantar.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Plantar Pino"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class Botonazotes: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\azotes.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Azotar"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class Botontriste: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\triste.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Triste"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class BotonAmenazar: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\amenazar.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Amenazar"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class Botonapuntar: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\apuntar.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Apuntar"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class BotonSaludar: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\saludar.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Saludar"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class Botonok: RscButtonVerde
{
	action = "closeDialog 0; execVM ""acj\animaciones\ok.sqf""";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "ok"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class botonparar: RscButtonVerde
{
	action = "closeDialog 0; player playMove ''";
	colorBackground[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	idc = -1;
	text = "Parar"; //--- ToDo: Localize;
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.687 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.033 * safezoneH;
};
class IGUIBack_2200: IGUIBack
{
	idc = -1;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.149531 * safezoneW;
	h = 0.473 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};