class loteria
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['loteria', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['loteria', nil]; ocupado = nil; ";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.40925 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.191813 * safezoneW;
			h = 0.2112 * safezoneH;
			colorBackground[] = {0,0,0,0.8};			
		};
		class txt: RscStructuredText
		{
			idc = 5060;
			text = "Cargando..."; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.1386 * safezoneH;
		};
		class btn: RscButton
		{
			idc = 5061;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.411313 * safezoneW + safezoneX;
			y = 0.4692 * safezoneH + safezoneY;
			w = 0.186656 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};



