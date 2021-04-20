
class menuCompraVenta
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['menuCompraVenta', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['menuCompraVenta', nil];";
	
	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 8.2 * GUI_GRID_W + GUI_GRID_X;
			y = 3.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.1 * GUI_GRID_W;
			h = 17.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
		class separador: RscPicture
		{
			text = "#(argb,8,8,3)color(1,1,1,1)";
			idc = -1;
			x = 0.378297 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.248506 * safezoneW;
			h = 0.0033 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class titulo: RscStructuredText
		{
			idc = 6030;
			text = "Tienda aleatoria 03"; //--- ToDo: Localize;
			x = 0.378316 * safezoneW + safezoneX;
			y = 0.2624 * safezoneH + safezoneY;
			w = 0.248518 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class lista: RscListBox
		{
			idc = 6031;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.3212 * safezoneH;
			sizeEx = 0.035;
			onLBSelChanged = "['actualiza'] call ica_fnc_menuCompraVenta";
		};
		class botonComprar: RscButtonVerde
		{
			idc = 6032;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.378312 * safezoneW + safezoneX;
			y = 0.6892 * safezoneH + safezoneY;
			w = 0.121688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class botonVender: RscButtonVerde
		{
			idc = 6033;
			text = "Vender"; //--- ToDo: Localize;
			x = 0.504125 * safezoneW + safezoneX;
			y = 0.6892 * safezoneH + safezoneY;
			w = 0.121688 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtTienes: RscStructuredText
		{
			idc = 6034;
			text = ""; //--- ToDo: Localize;
			x = 0.383468 * safezoneW + safezoneX;
			y = 0.6298 * safezoneH + safezoneY;
			w = 0.114465 * safezoneW;
			h = 0.0484 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txtPrecio: RscStructuredText
		{
			idc = 6035;
			text = ""; //--- ToDo: Localize;
			x = 0.507217 * safezoneW + safezoneX;
			y = 0.6298 * safezoneH + safezoneY;
			w = 0.114465 * safezoneW;
			h = 0.0484 * safezoneH;
			colorBackground[] = {0,0,0,0};
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
