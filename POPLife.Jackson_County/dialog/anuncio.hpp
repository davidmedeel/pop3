class anuncio {
	idd = -1;
	fadein = 2; 
	duration = 9999;
	fadeout = 4;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['anuncio', _this select 0]";
	onUnLoad = "uiNamespace setVariable ['anuncio', nil]";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.610587 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class txt: RscStructuredText
		{
			idc = 5050;
			text = ""; //--- ToDo: Localize;
			x = 0.224624 * safezoneW + safezoneX;
			y = 0.8432 * safezoneH + safezoneY;
			w = 0.604399 * safezoneW;
			h = 0.077 * safezoneH;
			font = "EtelkaNarrowMediumPro";
		};
		class txt2: RscStructuredText
		{
			idc = 5051;
			text = ""; //--- ToDo: Localize;
			x = 0.224655 * safezoneW + safezoneX;
			y = 0.8872 * safezoneH + safezoneY;
			w = 0.604399 * safezoneW;
			h = 0.077 * safezoneH;
			font = "EtelkaNarrowMediumPro";
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
