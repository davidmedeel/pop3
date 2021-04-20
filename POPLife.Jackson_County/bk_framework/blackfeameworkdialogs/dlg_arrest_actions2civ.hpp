
// Importar en el editor con CTRL + I y poner: configfile >> "DlgArrestActionsNew"

class DlgArrestActionsNewCiv {
	idd = 30101;
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
// GUI EDITOR OUTPUT START (by Blakord Crusader, v1.063, #Hilabo)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\BGN\bgn_menu9.paa";
	x = 0.226719 * safezoneW + safezoneX;
	y = 0.2316 * safezoneH + safezoneY;
	w = 0.556875 * safezoneW;
	h = 0.517 * safezoneH;
	colorText[] = {1,1,1,Dlg_PoP_Action_bgn};
};

// ###########################################  BOTON 1
class Menu1: RscButtonPoPActions
{
	idc = 1600;
	action = " Call BK_fnc_MoverArrestado ; closeDialog 0";
	text = "Mover detenido"; //--- ToDo: Localize;
	tooltip = "Mover al detenido a otra parte";
	x = 0.417501 * safezoneW + safezoneX;
	y = 0.2822 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico1: RscPicture
{
	idc = 1201;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopMover.paa";
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 2
class Menu2: RscButtonPoPActions
{
	idc = 1601;
	//action = "closeDialog 0";
	text = "Cachear detenido"; //--- ToDo: Localize;
	tooltip = "Cachear al detenido para ver que lleva";
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.175313 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico2: RscPicture
{
	idc = 1202;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopCachear.paa";
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.6012 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 3
class Menu3: RscButtonPoPActions
{
	idc = 1602;
	action = " Call BK_fnc_Arrestar ; closeDialog 0";
	text = "Liberar"; //--- ToDo: Localize;
	tooltip = "Liberar al detenido";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico3: RscPicture
{
	idc = 1203;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_Liberar.paa";
	x = 0.57011 * safezoneW + safezoneX;
	y = 0.4692 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 4
class Menu4: RscButtonPoPActions
{
	idc = 1603;
	action = " Call BK_fnc_SubirAlCoche ; closeDialog 0";
	text = "Subir en vehiculo"; //--- ToDo: Localize;
	tooltip = "Subir al detenido en un vehiculo cercano";
	x = 0.247344 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico4: RscPicture
{
	idc = 1204;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopSubirEnVeh.paa";
	x = 0.410314 * safezoneW + safezoneX;
	y = 0.4692 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 5
class Menu5: RscButtonPoPActions
{
	idc = 1604;
	//action = "closeDialog 0";
	text = "Quitar armas"; //--- ToDo: Localize;
	tooltip = "Quitar armas que lleve el detenido";
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico5: RscPicture
{
	idc = 1205;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopConfiscarArmas.paa";
	x = 0.544344 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 6
class Menu6: RscButtonPoPActions
{
	idc = 1605;
	//action = "closeDialog 0";
	text = "Quitar dinero"; //--- ToDo: Localize;
	tooltip = "Quitar el dinero que lleve el detenido";
	x = 0.271062 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico6: RscPicture
{
	idc = 1206;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopConfiscarDinero.paa";
	x = 0.435052 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 7
class Menu7: RscButtonPoPActions
{
	idc = 1606;
	//action = "closeDialog 0";
	text = "Multar"; //--- ToDo: Localize;
	tooltip = "Poner unsa multa al detenido";
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.3592 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico7: RscPicture
{
	idc = 1207;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopMultar.paa";
	x = 0.544343 * safezoneW + safezoneX;
	y = 0.3702 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 8
class Menu8: RscButtonPoPActions
{
	idc = 1607;
	//action = "closeDialog 0";
	text = "Licencias"; //--- ToDo: Localize;
	tooltip = "Comprobar licencias del detenido";
	x = 0.266996 * safezoneW + safezoneX;
	y = 0.3592 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico8: RscPicture
{
	idc = 1208;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopLicencias.paa";
	x = 0.436083 * safezoneW + safezoneX;
	y = 0.3702 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
// ###########################################  BOTON 9
class Menu9: RscButtonPoPActions
{
	idc = 1608;
	//action = "closeDialog 0";
	text = "Enviar a la carcel"; //--- ToDo: Localize;
	tooltip = "Enviar detenido a la carcel para pagar por sus delitos";
	x = 0.541248 * safezoneW + safezoneX;
	y = 0.7178 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class Ico9: RscPicture
{
	idc = 1209;
	text = "BK_FrameWork\BlackFeameWorkDIalogs\MenuActionImgs\Icons\MenuIco_CopEnviarCarcel.paa";
	x = 0.633031 * safezoneW + safezoneX;
	y = 0.6562 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};



// ################################################# NO MAS BOTONES

class RscPicture_1213: RscPicture
{
	idc = 1213;
	default = "true";
	text = "fotos\description.paa";
	x = 0.472157 * safezoneW + safezoneX;
	y = 0.4362 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.121 * safezoneH;
};
class Close: RscButtonPoPActions
{
	idc = 1612;
	action = "closeDialog 0";
	text = ""; //--- ToDo: Localize;
	x = 0.474219 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.11 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////





	};
};