
class mineria_dialog
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['mineria_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['mineria_dialog', nil];";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;

			x = 0.395838 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.231009 * safezoneW;
			h = 0.2178 * safezoneH;
		};
		class txt: RscStructuredText
		{
			idc = 7000;

			text = "   Arena   Carbón  Cobre   Hierro    Oro    Platino"; //--- ToDo: Localize;
			x = 0.2475;
			y = 0.216;
			w = 0.56;
			h = 0.044;
			colorBackground[] = {0,0,0,1};
		};
		class bar1: RscProgressV
		{
			idc = 7001;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class bar2: RscProgressV
		{
			idc = 7002;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class bar3: RscProgressV
		{
			idc = 7003;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class bar4: RscProgressV
		{
			idc = 7004;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class bar5: RscProgressV
		{
			idc = 7005;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class bar6: RscProgressV
		{
			idc = 7006;
			colorBar[] = {0,0,0,1};
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class entrada: RscEdit
		{
			idc = 7007;

			text = "1"; //--- ToDo: Localize;
			x = 0.247535;
			y = 0.66;
			w = 0.0724995;
			h = 0.048;
		};
		class desplegable: RscCombo
		{
			idc = 7008;

			x = 0.325037;
			y = 0.658316;
			w = 0.305001;
			h = 0.052;
		};
		class btn: RscButtonVerde
		{
			idc = 7009;

			text = "Vender"; //--- ToDo: Localize;
			x = 0.632526;
			y = 0.656647;
			w = 0.175;
			h = 0.052;
		};
	};
};

