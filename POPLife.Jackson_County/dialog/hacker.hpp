
class hacker
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['hacker', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['hacker', nil]; ";
	
	class controls {
		class imagenfondo: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			text = "\pop_iconos\paa\hacker.paa";
			idc = -1;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.572 * safezoneH;
		};
		class Rstexto: RscText
		{
			idc = -1;
			text = "¿Que quieres a cambio?"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class lista: RscListbox
		{
			idc = 4085;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.253 * safezoneH;
			sizeEx = 0.037;
		};
		class entrada: RscEdit
		{
			sizeEx = 0.09;
			idc = 4086;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class BotonCanjerar: RscButtonVerde
		{
			action = "_nil = ['verifica', ctrlText 4086, (lbData [4085, lbCurSel 4085])] spawn ica_fnc_hacker;";
			idc = 4087;
			text = "CANJEAR"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,1,0,1};
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
