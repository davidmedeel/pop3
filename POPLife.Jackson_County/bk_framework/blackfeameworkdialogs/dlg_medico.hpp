
// Importar en el editor con CTRL + I y poner: missionConfigFile >> "BK_DialogoMedico"

class BK_DialogoMedico {
	idd = 30105;
	movingEnable = 0;
	onLoad = " playSound 'FxDialogOpen'; ";
	onUnload = " BK_DialogOpen = false;  playSound 'FxDialogClose'; ";
	class controlsBackground { 
		// define controls here
	};
	class objects { 
		// define controls here
	};
	class controls { 
		// define controls here



////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Blakord Crusader, v1.063, #Bycysi)
////////////////////////////////////////////////////////

class DlgMediFondo: Bk_MedicIGUIBack
{
	idc = 900;

	//text = "\pop_iconos\icons\medica\medFondo.paa"; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.2866 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.429 * safezoneH;
};
class cuerpo: Bk_RscPicture
{
	idc = 1201;

	text = "\pop_iconos\icons\medica\medBody1.paa";
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.2844 * safezoneH + safezoneY;
	w = 0.257813 * safezoneW;
	h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1};
	colorActive[] = {-1,-1,-1,-1};
};
class estadoCabeza: Bk_RscPicture
{
	idc = 1271;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class estadoCuerpo: Bk_RscPicture
{
	idc = 1272;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class estadoBrazos: Bk_RscPicture
{
	idc = 1273;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class estadoPiernas: Bk_RscPicture
{
	idc = 1274;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};

class sangreCabeza: Bk_RscPicture
{
	idc = 1275;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class sangreCuerpo: Bk_RscPicture
{
	idc = 1276;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class sangreBrazos: Bk_RscPicture
{
	idc = 1277;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};
class sangrePiernas: Bk_RscPicture
{
	idc = 1278;
	x = 0.371094 * safezoneW + safezoneX; y = 0.2844 * safezoneH + safezoneY; w = 0.257813 * safezoneW; h = 0.429 * safezoneH;
	colorBackground[] = {-1,-1,-1,1}; colorActive[] = {-1,-1,-1,-1};
};

class TrataFrame: Bk_RscFrame
{
	idc = 1800;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.319 * safezoneH;
};
class TextTratar: Bk_RscText
{
	idc = 1000;

	text = "Tratar:"; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class TextTratarCon: Bk_RscText
{
	idc = 1001;

	text = "Aplicando:"; //--- ToDo: Localize;
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class ButDiagnosticar: Bk_RscButton
{
	idc = 1600;

	text = "DIAGNOSTICAR"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
class ButTratarAhora: Bk_RscButton
{
	idc = 1601;

	text = "TRATAR AHORA"; //--- ToDo: Localize;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
class Cerrar: Bk_RscButton
{
	idc = 1602;
	action = "closeDialog 0";
	text = "CERRAR"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.033 * safezoneH;
};
class IcoVendasC: Bk_RscPicture
{
	idc = 1200;
	text = "POP_medic\vendaje\tex\vendascico.paa";
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Vendas Compresivas"; //--- ToDo: Localize;
};
class IcoVendasN: Bk_RscPicture
{
	idc = 1202;
	text = "POP_medic\vendaje\tex\vendasico.paa";
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Vendas Escayola"; //--- ToDo: Localize;
};
class IcoTramadol: Bk_RscPicture
{
	idc = 1203;
	text = "\POP_medic\tramadol\data\tramadolico.paa";
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.077 * safezoneH;
	tooltip = "Tramadol"; //--- ToDo: Localize;
};
class IcoMorfina: Bk_RscPicture
{
	idc = 1204;
	text = "POP_medic\morfina\data\morfinaico.paa";
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.077 * safezoneH;
	tooltip = "Morfina"; //--- ToDo: Localize;
};
class IcoEpenefrina: Bk_RscPicture
{
	idc = 1205;
	text = "POP_medic\epinefrina\data\epenefrinaico.paa";
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.077 * safezoneH;
	tooltip = "Epenefrina"; //--- ToDo: Localize;
};
class IcoDesfibrilador: Bk_RscPicture
{
	idc = 1206;
	text = "POP_medic\defibrilador\data\desfibriladoico.paa";
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
	tooltip = "Desfibrilador"; //--- ToDo: Localize;
};
class IcoSangre: Bk_RscPicture
{
	idc = 1207;
	text = "POP_medic\bolsadesangre\data\bolsadesangreico.paa";
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.088 * safezoneH;
	tooltip = "Bolsa de sangre"; //--- ToDo: Localize;
};
class IcoCSI: Bk_RscPicture
{
	idc = 1208;
	text = "POP_objects\csikit\Data\csikitico.paa";
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.099 * safezoneH;
	tooltip = "Kit CSI"; //--- ToDo: Localize;
};
class TextUnidT: Bk_RscText
{
	idc = 1002;
	text = "Nombre: "; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.011 * safezoneH;
};
class TextUnidName: Bk_RscText
{
	idc = 1003;
	text = "--"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
};
class TextSangre: Bk_RscText
{
	idc = 1004;
	text = "Nivel de sangre: --"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscText_1005: Bk_RscText
{
	idc = 1005;
	x = 0.186458 * safezoneW + safezoneX;
	y = 0.419444 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.055 * safezoneH;
};
class TextSamgrados: Bk_RscText
{
	idc = 1006;
	text = "Heridas: --"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class TextLesiones: Bk_RscText
{
	idc = 1007;
	text = "Lesiones: --"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class TextDiagnostico: Bk_RscText
{
	idc = 1008;
	text = "Diagnostico: --"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};
class ButUsarVendasC: Bk_PopHideRscButton
{
	idc = 1603;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Vendas Compresivas"; //--- ToDo: Localize;
};
class ButUsarVendasE: Bk_PopHideRscButton
{
	idc = 1604;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Vendas de escayola"; //--- ToDo: Localize;
};
class ButUsarTramadol: Bk_PopHideRscButton
{
	idc = 1605;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Tramadol"; //--- ToDo: Localize;
};
class ButUsarMorfina: Bk_PopHideRscButton
{
	idc = 1606;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Morfina"; //--- ToDo: Localize;
};
class ButUsarEpenefrina: Bk_PopHideRscButton
{
	idc = 1607;
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Epenefrina"; //--- ToDo: Localize;
};
class ButUsarSangre: Bk_PopHideRscButton
{
	idc = 1608;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.088 * safezoneH;
	tooltip = "Bolsa de Sangre"; //--- ToDo: Localize;
};
class ButUsarCSI: Bk_PopHideRscButton
{
	idc = 1609;
	x = 0.363875 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.077 * safezoneH;
	tooltip = "Kit forense"; //--- ToDo: Localize;
};
class ButUsarDesfibrilador: Bk_PopHideRscButton
{
	idc = 1610;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.533 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.066 * safezoneH;
	tooltip = "Desfibrilador"; //--- ToDo: Localize;
};
class ButTratarCabeza: Bk_PopHideRscButton
{
	idc = 1611;
	x = 0.478344 * safezoneW + safezoneX;
	y = 0.2954 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Tratar cabeza"; //--- ToDo: Localize;
};
class ButTratarTorso: Bk_PopHideRscButton
{
	idc = 1612;
	x = 0.477312 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.132 * safezoneH;
	tooltip = "Tratar torso"; //--- ToDo: Localize;
};
class ButTratarPiernas: Bk_PopHideRscButton
{
	idc = 1613;
	x = 0.469062 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.209 * safezoneH;
	//action = " ";
	tooltip = "Tratar piernas"; //--- ToDo: Localize;
};
class ButTratarBrazos2: Bk_PopHideRscButton
{
	idc = 1614;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.121 * safezoneH;
	tooltip = "Tratar brazos"; //--- ToDo: Localize;
};
class ButTratarBrazos1: Bk_PopHideRscButton
{
	idc = 1615;
	x = 0.432974 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.121 * safezoneH;
	tooltip = "Tratar brazos"; //--- ToDo: Localize;
};
class TextSelTratar: Bk_RscText
{
	idc = 1011;

	text = "Sin seleccionar"; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class TextSelTratarCon: Bk_RscText
{
	idc = 1012;

	text = "Sin seleccionar"; //--- ToDo: Localize;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////













	};
};