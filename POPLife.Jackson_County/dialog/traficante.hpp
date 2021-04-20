class traficante_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['traficante_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['traficante_dialog', nil];";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.3284 * safezoneH + safezoneY;
			w = 0.227906 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class btn: RscButton
		{
			idc = 6015;
			text = ""; //--- ToDo: Localize;
			x = 0.529917 * safezoneW + safezoneX;
			y = 0.610356 * safezoneH + safezoneY;
			w = 0.0856054 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class entrada: RscEdit
		{
			idc = 6016;
			text = "1"; //--- ToDo: Localize;
			x = 0.394827 * safezoneW + safezoneX;
			y = 0.6122 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class desplegable: RscCombo
		{
			idc = 6017;
			x = 0.420609 * safezoneW + safezoneX;
			y = 0.609074 * safezoneH + safezoneY;
			w = 0.105188 * safezoneW;
			h = 0.0308 * safezoneH;
		};		
		
		// para rellenar
		class bar1: RscProgressV
		{
			idc = 6018;
			x = 0.416886 * safezoneW + safezoneX;
			y = 0.35788 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
			colorBar[] = {0.9,0.55,0.1,1};
		};
		class bar2: RscProgressV
		{
			idc = 6019;
			x = 0.472261 * safezoneW + safezoneX;
			y = 0.35722 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
			colorBar[] = {0.9,0.55,0.1,1};
		};
		class bar3: RscProgressV
		{
			idc = 6020;
			x = 0.524027 * safezoneW + safezoneX;
			y = 0.35876 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
			colorBar[] = {0.9,0.55,0.1,1};
		};
		class bar4: RscProgressV
		{
			idc = 6021;
			x = 0.580845 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
			colorBar[] = {0.9,0.55,0.1,1};
		};
		class txt1: RscStructuredText
		{
			idc = 6022;
			text = "txt1"; //--- ToDo: Localize;
			x = 0.39388 * safezoneW + safezoneX;
			y = 0.540526 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt2: RscStructuredText
		{
			idc = 6023;
			text = "txt2"; //--- ToDo: Localize;
			x = 0.457302 * safezoneW + safezoneX;
			y = 0.540496 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt3: RscStructuredText
		{
			idc = 6024;
			text = "txt3"; //--- ToDo: Localize;
			x = 0.507185 * safezoneW + safezoneX;
			y = 0.540504 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class txt4: RscStructuredText
		{
			idc = 6025;
			text = "txt4"; //--- ToDo: Localize;
			x = 0.551584 * safezoneW + safezoneX;
			y = 0.541074 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class pre1: RscStructuredText
		{
			idc = 6026;
			text = "999999 e"; //--- ToDo: Localize;
			x = 0.39791 * safezoneW + safezoneX;
			y = 0.3372 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class pre2: RscStructuredText
		{
			idc = 6027;
			text = "999999 e"; //--- ToDo: Localize;
			x = 0.454348 * safezoneW + safezoneX;
			y = 0.336015 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class pre3: RscStructuredText
		{
			idc = 6028;
			text = "999999 e"; //--- ToDo: Localize;
			x = 0.50573 * safezoneW + safezoneX;
			y = 0.335541 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class pre4: RscStructuredText
		{
			idc = 6029;
			text = "999999 e"; //--- ToDo: Localize;
			x = 0.561871 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0495 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		// separadores
		class separador: RscStructuredText
		{
			idc = -1;
			x = 0.391712 * safezoneW + safezoneX;
			y = 0.6034 * safezoneH + safezoneY;
			w = 0.227911 * safezoneW;
			h = 0.0055 * safezoneH;
		};
		class RscStructuredText_1105: RscStructuredText
		{
			idc = -1;
			x = 22.6 * GUI_GRID_W + GUI_GRID_X;
			y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.3 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscStructuredText_1110: RscStructuredText
		{
			idc = -1;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.3 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscStructuredText_1111: RscStructuredText
		{
			idc = -1;
			x = 0.391784 * safezoneW + safezoneX;
			y = 0.64037 * safezoneH + safezoneY;
			w = 0.227911 * safezoneW;
			h = 0.0055 * safezoneH;
		};
		class RscStructuredText_1112: RscStructuredText
		{
			idc = -1;
			x = 9.47 * GUI_GRID_W + GUI_GRID_X;
			y = 17.41 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.3 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscStructuredText_1113: RscStructuredText
		{
			idc = -1;
			x = 31.32 * GUI_GRID_W + GUI_GRID_X;
			y = 17.48 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.3 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
	};
};

