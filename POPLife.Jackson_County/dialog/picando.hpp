
class picando {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['picando', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['picando', nil]; tpicar = nil; parate = nil ";

	class controls {
		
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.465968 * safezoneW + safezoneX;
			y = 0.4142 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.1188 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class txt: RscStructuredText
		{
			idc = 4050;
			text = "99"; //--- ToDo: Localize;
			x = 0.468031 * safezoneW + safezoneX;
			y = 0.4186 * safezoneH + safezoneY;
			w = 0.0484687 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class boton: RscButtonVerde
		{
			idc = 4051;
			text = "¡PICA!"; //--- ToDo: Localize;
			x = 0.466973 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.0374 * safezoneH;
		};	
        class medel: RscText
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