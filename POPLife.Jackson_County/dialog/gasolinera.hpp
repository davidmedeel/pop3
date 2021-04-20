class gasolinera
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['gasolinera', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['gasolinera', nil]; abierto = nil;";
	
	class controls {
		class RscPicture_1200: RscPicture
		{
			text = "\pop_iconos\paa\Surtidor.paa";
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.671 * safezoneH;
		};
		class BotonRepostar: RscButton
		{
			idc = 5012;
			text = "REPOSTAR"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class textoPrecio: RscText
		{
			idc = 5013;
			text = ""; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0};
		};
		class Repostar: RscEdit
		{
			idc = 5014;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;
			text = "1";
		};
		class Cuantohay: RscText
		{
			idc = 5015;
			text = ""; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 0.038;
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
