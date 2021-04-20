
class transportes {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['transportes', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['transportes', nil]; almacen = nil; cosa = nil; variable = nil; can = nil; ";

	class controls {
		class lista: RscListbox
		{
			idc = 6086;

			x = 0.500992 * safezoneW + safezoneX;
			y = 0.5572 * safezoneH + safezoneY;
			w = 0.101062 * safezoneW;
			h = 0.0924 * safezoneH;
			sizeEx = 0.030;
			colorBackground[] = {0,0,0,0.6};
		};
		class entrada: RscEdit
		{
			idc = 6085;

			text = "1"; //--- ToDo: Localize;
			x = 0.430989 * safezoneW + safezoneX;
			y = 0.586704 * safezoneH + safezoneY;
			w = 0.0257504 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class boton: RscButton
		{
			idc = 6089;

			text = "Cargar"; //--- ToDo: Localize;
			x = 0.371111 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.258844 * safezoneW;
			h = 0.0352 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class impuestosNUM: RscText
		{
			idc = 6088;

			text = ""; //--- ToDo: Localize;
			x = 0.506187 * safezoneW + safezoneX;
			y = 0.6914 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class precioNUM: RscText
		{
			idc = 6087;

			text = ""; //--- ToDo: Localize;
			x = 0.501733 * safezoneW + safezoneX;
			y = 0.6706 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
			colorText[] = {0,1,0,1};
		};
		class cabecera: RscText
		{
			idc = 6060;

			text = ""; //--- ToDo: Localize;
			x = 0;
			y = -0.0360003;
			w = 1.00233;
			h = 0.068;
			colorBackground[] = {0,0,0,1};
		};
		class pie: RscText
		{
			idc = 6090;

			text = "                                       Transportes Medel"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.413455 * safezoneW;
			h = 0.0374 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class b1: RscProgressV
		{
			idc = 6065;
			colorBar[] = {0,1,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.336032 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b2: RscProgressV
		{
			idc = 6066;
			colorBar[] = {0.2,0.2,1,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b3: RscProgressV
		{
			idc = 6067;
			colorBar[] = {1,1,0.4,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.386561 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b4: RscProgressV
		{
			idc = 6068;
			colorBar[] = {1,0.69,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.41131 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0175312 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b5: RscProgressV
		{
			idc = 6069;
			colorBar[] = {0,1,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b6: RscProgressV
		{
			idc = 6070;
			colorBar[] = {0.2,0.2,1,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b7: RscProgressV
		{
			idc = 6071;
			colorBar[] = {1,1,0.4,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b8: RscProgressV
		{
			idc = 6072;
			colorBar[] = {1,0.69,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b9: RscProgressV
		{
			idc = 6073;
			colorBar[] = {0,1,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b10: RscProgressV
		{
			idc = 6074;
			colorBar[] = {0.2,0.2,1,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b11: RscProgressV
		{
			idc = 6075;
			colorBar[] = {1,1,0.4,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b12: RscProgressV
		{
			idc = 6076;
			colorBar[] = {1,0.69,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b13: RscProgressV
		{
			idc = 6077;
			colorBar[] = {0,1,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b14: RscProgressV
		{
			idc = 6078;
			colorBar[] = {0.2,0.2,1,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b15: RscProgressV
		{
			idc = 6079;
			colorBar[] = {1,1,0.4,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b16: RscProgressV
		{
			idc = 6080;
			colorBar[] = {1,0.69,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.587656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b17: RscProgressV
		{
			idc = 6081;
			colorBar[] = {0,1,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b18: RscProgressV
		{
			idc = 6082;
			colorBar[] = {0.2,0.2,1,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b19: RscProgressV
		{
			idc = 6083;
			colorBar[] = {1,1,0.4,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.628906 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};
		class b20: RscProgressV
		{
			idc = 6084;
			colorBar[] = {1,0.69,0,0.7};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.00721845 * safezoneW;
			h = 0.2112 * safezoneH;
		};

		class RscText_1004: RscText
		{
			idc = -1;
			x = 0.703156 * safezoneW + safezoneX;
			y = 0.2206 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.2948 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class txb1: RscText
		{
			idc = 6061;

			text = "?"; //--- ToDo: Localize;
			x = 0.329845 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txb2: RscText
		{
			idc = 6062;

			text = "?"; //--- ToDo: Localize;
			x = 0.354594 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txb3: RscText
		{
			idc = 6063;

			text = "?"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txb4: RscText
		{
			idc = 6064;

			text = "?"; //--- ToDo: Localize;
			x = 0.406888 * safezoneW + safezoneX;
			y = 0.479748 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class textoquiero: RscText
		{
			idc = -1;

			text = "Quiero        T   de"; //--- ToDo: Localize;
			x = 0.399061 * safezoneW + safezoneX;
			y = 0.584837 * safezoneH + safezoneY;
			w = 0.095906 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = -1;

			x = 0.366966 * safezoneW + safezoneX;
			y = 0.7772 * safezoneH + safezoneY;
			w = 0.267053 * safezoneW;
			h = 0.0066 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1001: RscText
		{
			idc = -1;

			x = 0.366966 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.2354 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1002: RscText
		{
			idc = -1;

			x = 0.630966 * safezoneW + safezoneX;
			y = 0.5484 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.2354 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1003: RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.2206 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.2948 * safezoneH;
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

		
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;

			x = 0.297875 * safezoneW + safezoneX;
			y = 0.2404 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.2706 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class fondo2: IGUIBack
		{
			idc = -1;

			x = 0.371091 * safezoneW + safezoneX;
			y = 0.5484 * safezoneH + safezoneY;
			w = 0.259908 * safezoneW;
			h = 0.1122 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};		
		class fondo3: IGUIBack
		{
			idc = -1;

			x = 0.37109 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.259908 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class valor: RscText
		{
			idc = -1;

			text = "Valor:"; //--- ToDo: Localize;
			x = 0.447411 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.0680624 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class impuestos: RscText
		{
			idc = -1;

			text = "Impuestos:"; //--- ToDo: Localize;
			x = 0.447909 * safezoneW + safezoneX;
			y = 0.693719 * safezoneH + safezoneY;
			w = 0.0680621 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class linea3: RscText
		{
			idc = -1;

			x = 0.370979 * safezoneW + safezoneX;
			y = 0.660156 * safezoneH + safezoneY;
			w = 0.259836 * safezoneW;
			h = 0.0066 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};
