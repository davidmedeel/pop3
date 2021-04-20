
class tiendaMafia {
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['tiendaMafia', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['tiendaMafia', nil]; cosa = nil; precio = nil; ";
	
	class controls {
		class imagen: RscPicture
		{
			text = "\pop_iconos\paa\mafia.paa";
			idc = 5005;
			x = 0.0874998 * safezoneW + safezoneX;
			y = -0.028 * safezoneH + safezoneY;
			w = 0.809531 * safezoneW;
			h = 1.012 * safezoneH;
		};
		class botonComprar: RscButtonVerde
		{
			idc = 5006;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class lista: RscListbox
		{
			idc = 5007;
			x = 0.463905 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.034;
			onLBSelChanged = "['actualiza'] call ica_fnc_tiendaMafia";
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
