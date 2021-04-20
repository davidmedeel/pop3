
class experiencia {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['experiencia', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['experiencia', nil]; ";

	class controls {
		class listaRamas: RscListbox
		{
			idc = 6043;
			sizeEx = 0.034;
			rowHeight = 0.05;

			x = 0.0075;
			y = 0.2;
			w = 0.2375;
			h = 0.58;
			colorBackground[] = {0,0,0,0.6};
		};
		class listaHab: RscListbox
		{
			idc = 6044;
			sizeEx = 0.034;
			rowHeight = 0.05;

			x = 0.2725;
			y = 0.2;
			w = 0.3675;
			h = 0.58;
			colorBackground[] = {0,0,0,0.6};
		};
		class informacion: RscStructuredText
		{
			idc = 6045;

			x = 0.6675;
			y = 0.2;
			w = 0.26;
			h = 0.444;
			colorBackground[] = {0,0,0,0.6};
		};
		class txt1: RscStructuredText
		{
			idc = 6040;

			text = "Ramas"; //--- ToDo: Localize;
			x = 0.0075;
			y = 0.156;
			w = 0.2375;
			h = 0.044;
			colorBackground[] = {0,0,0,1};
		};
		class txt2: RscStructuredText
		{
			idc = 6041;

			text = "Habilidades"; //--- ToDo: Localize;
			x = 0.2725;
			y = 0.156;
			w = 0.3675;
			h = 0.044;
			colorBackground[] = {0,0,0,1};
		};
		class txt3: RscStructuredText
		{
			idc = 6042;

			text = "Información"; //--- ToDo: Localize;
			x = 0.6675;
			y = 0.156;
			w = 0.26;
			h = 0.044;
			colorBackground[] = {0,0,0,1};
		};
		class boton: RscButtonVerde
		{
			idc = 6048;

			text = "Aprender"; //--- ToDo: Localize;
			x = 0.6675;
			y = 0.732;
			w = 0.26;
			h = 0.044;
		};
		class sp: RscStructuredText
		{
			idc = 6046;

			text = ""; //--- ToDo: Localize;
			x = 0.6675;
			y = 0.644;
			w = 0.26;
			h = 0.044;
			colorBackground[] = {0,0,0,0.6};
		};
		class energ: RscStructuredText
		{
			idc = 6047;

			text = ""; //--- ToDo: Localize;
			x = 0.6675;
			y = 0.688;
			w = 0.26;
			h = 0.044;
			colorBackground[] = {0,0,0,0.6};
		};
		
		class RscText_1001: RscText
		{
			idc = -1;
			text = ">"; //--- ToDo: Localize;
			x = 0.6375;
			y = 0.436;
			w = 0.0275;
			h = 0.048;
			sizeEx = 1.5 * GUI_GRID_H;
		};
		class RscText_1000: RscText
		{
			idc = -1;
			text = ">"; //--- ToDo: Localize;
			x = 0.2425;
			y = 0.436;
			w = 0.0275;
			h = 0.048;
			sizeEx = 1.5 * GUI_GRID_H;
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
