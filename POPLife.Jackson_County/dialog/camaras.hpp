class camaras
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['camaras', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['camaras', nil]; ";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.398937 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.191813 * safezoneW;
			h = 0.3432 * safezoneH;
			colorBackground[] = {0,0,0,0.8};	
		};
		class lista: RscListbox
		{
			idc = 5063;
			x = 0.403062 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.183562 * safezoneW;
			h = 0.3278 * safezoneH;
			sizeEx = 0.033;
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
