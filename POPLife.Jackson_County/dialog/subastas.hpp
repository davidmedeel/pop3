class subasta
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['subasta', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['subasta', nil]; abierto = nil; cosa = nil; ";
	
	class controls {
		class RscPicture_1200: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			text = "\pop_iconos\paa\subastas.paa";
			idc = -1;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class Subastas: RscText
		{
			idc = 4052;
			text = "Subasta: error"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
		};
		class textopuja: RscText
		{
			idc = 4053;
			text = "Puja:"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1.1,1};
			sizeEx = 0.033;
		};
		class BotonPujar: RscButtonVerde
		{
			idc = 4054;
			text = "PUJAR +1000"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
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
		class Tiempo: RscText
{
			idc = 4055;
			text = "Tiempo: error"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};