class topsecret_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['topsecret_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['topsecret_dialog', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Icaruk, v1.063, #Zodefo)
////////////////////////////////////////////////////////

class foto: RscPicture
{
	type = CT_STATIC;
	style = ST_PICTURE;
	text = "ica\banco\doc.paa";

	idc = -1;
	x = 0.295762 * safezoneW + safezoneX;
	y = 0.0754 * safezoneH + safezoneY;
	w = 0.408476 * safezoneW;
	h = 0.8426 * safezoneH;
};
class texto: RscText
{
	shadow = 0;

	idc = 9020;
	text = "12345678901234567890"; //--- ToDo: Localize;
	x = 0.448424 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,0};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////






	};
};




class introDSC_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['introDSC_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['introDSC_dialog', nil];";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Icaruk, v1.063, #Tilyku)
////////////////////////////////////////////////////////

class fondo: IGUIBack
{
	idc = -1;
	x = 0.355587 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.268194 * safezoneW;
	h = 0.2222 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
};
class porfavor: RscText
{
	idc = -1;
	text = "Por favor, introduzca el codigo DSC."; //--- ToDo: Localize;
	x = 0.391692 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.201144 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class escribe: RscEdit
{
	idc = 9023;
	x = 0.377251 * safezoneW + safezoneX;
	y = 0.4054 * safezoneH + safezoneY;
	w = 0.226932 * safezoneW;
	h = 0.0484 * safezoneH;
};
class ok: RscButton2
{
	action = "closeDialog 0; [ctrlText 9023] exec ""ica\banco\codigoDSC.sqf"";";

	idc = -1;
	text = "OK"; //--- ToDo: Localize;
	x = 0.443267 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0979933 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};







class desencriptando_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['desencriptando_dialog', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['desencriptando_dialog', nil]; abierto = nil;";
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Icaruk, v1.063, #Nobuno)
////////////////////////////////////////////////////////

class foto: RscPicture
{
	type = CT_STATIC;
	style = ST_PICTURE;
	text = "ica\banco\portatil.paa";

	idc = -1;
	x = 0.295761 * safezoneW + safezoneX;
	y = 0.071 * safezoneH + safezoneY;
	w = 0.408476 * safezoneW;
	h = 0.8426 * safezoneH;
};
class desencriptando: RscText
{
	shadow = 0;

	idc = 9021;
	text = ""; //--- ToDo: Localize;
	x = 0.448422 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0.8,0,1};
	colorBackground[] = {0,0,0,0};
};
class final: RscText
{
	shadow = 0;

	idc = 9022;
	text = "1234568901234567890"; //--- ToDo: Localize;
	x = 0.444297 * safezoneW + safezoneX;
	y = 0.4626 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0.8,0,1};
	colorBackground[] = {0,0,0,0};
};
class RscText_1002: RscText
{
	shadow = 0;

	idc = -1;
	text = "Compilando codigo:"; //--- ToDo: Localize;
	x = 0.456676 * safezoneW + safezoneX;
	y = 0.4362 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0.8,0,1};
	colorBackground[] = {0,0,0,0};
};
class RscText_1003: RscText
{
	shadow = 0;

	idc = -1;
	text = "Decrypt mKey:"; //--- ToDo: Localize;
	x = 0.456678 * safezoneW + safezoneX;
	y = 0.3218 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0.8,0,1};
	colorBackground[] = {0,0,0,0};
};
class RscText_1004: RscText
{
	shadow = 0;

	idc = -1;
	text = "1cT5wiC4M014MucH0"; //--- ToDo: Localize;
	x = 0.447393 * safezoneW + safezoneX;
	y = 0.3438 * safezoneH + safezoneY;
	w = 0.123781 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {0,0.8,0,1};
	colorBackground[] = {0,0,0,0};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};




class introCodigo_dialog
{
	idd = -1;
	movingenable = true;
	
	class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Icaruk, v1.063, #Tilyku)
////////////////////////////////////////////////////////

class fondo: IGUIBack
{
	idc = -1;
	x = 0.355587 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.268194 * safezoneW;
	h = 0.2222 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
};
class porfavor: RscText
{
	idc = -1;
	text = "Por favor, introduzca el codigo de seguridad."; //--- ToDo: Localize;
	x = 0.391692 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.201144 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class escribe: RscEdit
{
	idc = 9024;
	x = 0.377251 * safezoneW + safezoneX;
	y = 0.4054 * safezoneH + safezoneY;
	w = 0.226932 * safezoneW;
	h = 0.0484 * safezoneH;
};
class ok: RscButton2
{
	action = "closeDialog 0; [ctrlText 9024] exec ""ica\banco\codigoCaja.sqf"";";

	idc = -1;
	text = "OK"; //--- ToDo: Localize;
	x = 0.443267 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0979933 * safezoneW;
	h = 0.055 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};
