
class life_admin_menu
{
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_adminMenu; uiNameSpace setVariable ['life_admin_menu', _this select 0];";
	onUnLoad = "uiNameSpace setVariable ['life_admin_menu', nil];";

class controlsBackground {
	class fondo
	{
		type = 0;
		idc = -1;
		style = 0;
		font = "PuristaMedium";
		x = 0.0102909 * safezoneW + safezoneX;
		y = 0.0296872 * safezoneH + safezoneY;
		w = 0.974674 * safezoneW;
		h = 0.957352 * safezoneH;
		text = "";
		colorText[] = {0.8431,0.0431,0.4353,1};
		colorBackground[] = {0.302,0.302,0.302,0.8334};
		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	};
	class cabecera: RscText
	{
		idc = 1001;
		text = "Panel de Administracion - Plata o Plomo"; //--- ToDo: Localize;
		x = 0.0203986 * safezoneW + safezoneX;
		y = 0.0378302 * safezoneH + safezoneY;
		w = 0.954046 * safezoneW;
		h = 0.0330121 * safezoneH;
		colorText[] = {0.6,0,0,1};
	};
};

	class controls {

		/*class listaJugadores
		{
			type = 5;
			idc = 2902;
			style = 16;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.302,0.8115,0.302,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			onLBSelChanged = "[_this] spawn life_fnc_adminquery";

			x = 0.0203986 * safezoneW + safezoneX;
			y = 0.147871 * safezoneH + safezoneY;
			w = 0.226908 * safezoneW;
			h = 0.583214 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};*/
		class listaJugadores: RscListBox
		{
			idc = 2902;
			font = "PuristaMedium";
			onLBSelChanged = "[_this] spawn life_fnc_adminquery";
			x = 0.0203986 * safezoneW + safezoneX;
			y = 0.147871 * safezoneH + safezoneY;
			w = 0.226908 * safezoneW;
			h = 0.583214 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
			sizeEx = 0.040;
		};
		/*class infoJugador
		{
			type = 5;
			idc = 2903;
			style = 16;
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.302,0.8115,0.302,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.33 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};*/
		class infoJugador: RscStructuredText
		{
			idc = 2903;
			font = "PuristaMedium";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.33 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
		};
		class buscador
		{
			type = 2;
			idc = 1400;
			style = 0;
			autocomplete = "";
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {0.302,0.8118,0.302,1};
			font = "PuristaMedium";
			text = "";
			x = 0.0203986 * safezoneW + safezoneX;
			y = 0.0818463 * safezoneH + safezoneY;
			w = 0.226908 * safezoneW;
			h = 0.0550202 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class copiarEquipacion
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_copiarEquipacion;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Copiar equipacion"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class voyATI
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyati;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Voy a ti"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.422972 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class texto
		{
			type = 2;
			idc = 1700;
			style = 0;
			autocomplete = "";
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {0.302,0.8118,0.302,1};
			font = "PuristaMedium";
			text = "";
			x = 0.0203986 * safezoneW + safezoneX;
			y = 0.742089 * safezoneH + safezoneY;
			w = 0.15471 * safezoneW;
			h = 0.0550202 * safezoneH;
			colorText[] = {0.6,0,0,1};
			colorBackground[] = {0,0,0,0.6984};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class botonEnviar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_mensaje;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Enviar"; //--- ToDo: Localize;
			x = 0.180266 * safezoneW + safezoneX;
			y = 0.742089 * safezoneH + safezoneY;
			w = 0.067041 * safezoneW;
			h = 0.0550202 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class ponerEquipacion
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_ponEquipacion;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Poner equipacion"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class venAmiVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_moverEnMiVeh;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Ven a mi veh"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class voyAtuVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyatuVeh;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Voy a tu veh"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class gestionarDineroBanco
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_dineroAdminB;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Gestionar dinero banco"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class gestionarDineroCartera
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_dineroAdminC;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Gestionar dinero cartera"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class reiniciarRobo
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_reiniciarRobos;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Reiniciar robo"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class reiniciarRobosEnCurso
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_reiniciarRobosCurso;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Reiniciar robos en curso"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class quitarNiebla
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] remoteexec ['ica_fnc_quitarNiebla', 0];";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Quitar niebla"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class quitarLluvia
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] remoteexec ['ica_fnc_quitarLluvia', 0];";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Quitar lluvia"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class entrarServicio
		{
			type = 1;
			idc = 5908;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_entrarServicioAdmin;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Entrar de servicio"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class spawnVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn VVS_fnc_openVVS;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Spawn vehiculo"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class godModeVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_vehGOD;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "God mode veh"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class forzarDesconexion
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_forzarDesconexionAdmin;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Forzar desconexion"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class kick
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_kickAdmin;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Kick"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class dejarBolas
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_equipo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Dejar en bolas"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class expulsarVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_sacarDelVehiculo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Expulsar del veh"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class MarcadoresVeh
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_marcadoresVehiculo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Marcadores veh"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class recoilOff
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_recoil;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Recoil off"; //--- ToDo: Localize;
			x = 0.793906 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class dineroLocal
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_dineroAdmin;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Dinero local"; //--- ToDo: Localize;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class venAMI
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_venami;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Ven a mi"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.422972 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class curar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCurar;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Curar"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.488996 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class matar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_killAdmin;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Matar"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.488996 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class esposar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_esposarJugador;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Esposar"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.55502 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class desesposar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_desesposarJugador;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Desesposar"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.55502 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class revivir
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminRevivir;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Revivir"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.621044 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class espectador
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminEspectador;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Espectador"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.621044 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class congelar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCongelar;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Congelar"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.687069 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class crashear
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCrasheo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Crashear"; //--- ToDo: Localize;
			x = 0.334976 * safezoneW + safezoneX;
			y = 0.687069 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class Dia
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_dedia;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Dia"; //--- ToDo: Localize;
			x = 0.252464 * safezoneW + safezoneX;
			y = 0.753093 * safezoneH + safezoneY;
			w = 0.075011 * safezoneW;
			h = 0.0489068 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class reparar
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_adminReparar;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Reparar"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class licencias
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_adminLicencias;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Licencias"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class gasolina
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_llenarVehiculo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Gasolina"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class noche
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] remoteexec ['ica_fnc_luna', 0];";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Noche"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class llaves
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_adminLlaves;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "LLaves"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class marcadores
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_adminMarcadores;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Marcadores"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class nombres
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_nombres;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Nombres"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class invisible
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_invisible;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Invisible"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class fuego
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_adminParticulas";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Fuego"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class vestirse
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] spawn ica_fnc_adminvestirse;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Vestirse"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class explotarJugador
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_explotar;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Explotar"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class cachear
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_cacheo;";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Cachear"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
		class arsenal
		{
			type = 1;
			idc = 2906;
			style = "0+2";
			onButtonClick = "[] call ica_fnc_adminarsenal";
			borderSize = 0;
			colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0.8651};
			colorShadow[] = {0,0.2,0.2,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};

			text = "Arsenal"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.075 * safezoneW;
			h = 0.0488888 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.0738,0.0559,0.0559,0.7698};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3);
		};
	};
};
