class cacheo
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['cacheo', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['cacheo', nil]; ";
	
	class controls {
		class l1: RscListbox
		{
			idc = 7090;
			x = 0.2855 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.14025 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx = 0.033;
			colorBackground[] = {0,0,0,0.8};
		};
		class l2: RscListbox
		{
			idc = 7091;
			x = 0.429875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.14025 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx = 0.033;
			colorBackground[] = {0,0,0,0.8};
		};
		class l3: RscListbox
		{
			idc = 7092;
			text = "l3"; //--- ToDo: Localize;
			x = 0.57425 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.14025 * safezoneW;
			h = 0.352 * safezoneH;
			sizeEx = 0.033;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class RscText_1000: RscText
		{
			idc = -1;
			text = "Ropa"; //--- ToDo: Localize;
			x = 0.285502 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.0308 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "Chaleco"; //--- ToDo: Localize;
			x = 0.429877 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.0308 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "Mochila"; //--- ToDo: Localize;
			x = 0.574251 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.0308 * safezoneH;
			colorBackground[] = {0,0,0,1};
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
