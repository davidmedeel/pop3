class Desguace
{
	idd = 55550;
	onUnload = "cochespetados = [];";
	onload = "cochespetados = [];";
	
	class ControlsBackground
	{
		
	};
	class Controls
	{
		class Control1128934061
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.17333334;
			w = safeZoneW * 0.3625;
			h = safeZoneH * 0.70111112;
			style = 0;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,0.8095};
			colorText[] = {0.2392,0.5608,0.6902,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Control501172172
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.319375;
			y = safeZoneY + safeZoneH * 0.17222223;
			w = safeZoneW * 0.36125;
			h = safeZoneH * 0.05666667;
			style = 0+2+2048+192;
			text = "Desguace";
			colorBackground[] = {0.6,0.4,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class Control819231639
		{
			type = 1;
			idc = 55552;
			x = safeZoneX + safeZoneW * 0.319375;
			y = safeZoneY + safeZoneH * 0.81111112;
			w = safeZoneW * 0.36125;
			h = safeZoneH * 0.06444445;
			style = 0+2+192;
			text = "Restaurar el coche";
			borderSize = 0;
			colorBackground[] = {0.6,0.4,0,1};
			colorBackgroundActive[] = {1,0,0,0};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0,0,0,1};
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
			onButtonClick = "['Recuperar'] spawn ica_fnc_desguace";
			
		};
		class Control604431221
		{
			type = 5;
			idc = 55551;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.3625;
			h = safeZoneH * 0.59111112;
			style = 2;
			colorBackground[] = {0.8,0.8,0.4,0.4444};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.6,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		
	};
	
};
