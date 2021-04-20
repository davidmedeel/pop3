
class IncautarDinero
{
	idd = 999016;
	
	class ControlsBackground
	{
		class Fondo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.351875;
			y = safeZoneY + safeZoneH * 0.40666667;
			w = safeZoneW * 0.294375;
			h = safeZoneH * 0.18333334;
			style = 0;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,0.9294};
			colorText[] = {0.498,0.5059,0.2078,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class Porcentaje
		{
			type = 2;
			idc = 999017;
			x = safeZoneX + safeZoneW * 0.466875;
			y = safeZoneY + safeZoneH * 0.46111112;
			w = safeZoneW * 0.039375;
			h = safeZoneH * 0.03666667;
			style = 2;
			text = "1";
			autocomplete = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorSelection[] = {1,0,0,0};
			colorText[] = {0.702,0.102,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class btn_Incautar
		{
			type = 1;
			idc = 999018;
			x = safeZoneX + safeZoneW * 0.435625;
			y = safeZoneY + safeZoneH * 0.51777778;
			w = safeZoneW * 0.129375;
			h = safeZoneH * 0.04888889;
			style = 0+2;
			text = "Incautar";
			onButtonClick = "['confirmo'] call ica_fnc_quitardinero";
			borderSize = 0;
			colorBackground[] = {0.102,0.102,0.102,0.5238};
			colorBackgroundActive[] = {1,0,0,0};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0.8,0.0784,0.0784,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		class Control2096715491
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.434375;
			y = safeZoneY + safeZoneH * 0.41111112;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.03555556;
			style = 0;
			text = "Incautar Dinero";
			colorBackground[] = {0.4314,0.1608,0.4784,0};
			colorText[] = {0.702,0.102,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class Control861255826
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51375;
			y = safeZoneY + safeZoneH * 0.45111112;
			w = safeZoneW * 0.02375;
			h = safeZoneH * 0.05333334;
			style = 0;
			text = "%";
			colorBackground[] = {0.298,0.5216,0.7255,0};
			colorText[] = {0.702,0.102,0.102,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
		};
        class credito: RscText
        {
	        idc = -1;
	        text = "Medel"; //--- ToDo: Localize;
	        x = -0.000156274 * safezoneW + safezoneX;
	        y = -0.00599999 * safezoneH + safezoneY;
	        w = 0.0773438 * safezoneW;
	        h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.2};
        };
	};
};
