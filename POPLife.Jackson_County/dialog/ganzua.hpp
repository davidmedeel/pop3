class ganzua
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['ganzua', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['ganzua', nil]; pernos = nil; ";

	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 0.411313 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.495 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class p1b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.439161 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p2b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.463911 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p3b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.488663 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p4b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.514445 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p5b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.539192 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p6b: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.564974 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class p1: RscProgressV
		{
			idc = 5070;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.439161 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class p2: RscProgressV
		{
			idc = 5071;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.463911 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class p3: RscProgressV
		{
			idc = 5072;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.488663 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class p4: RscProgressV
		{
			idc = 5073;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.514445 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class p5: RscProgressV
		{
			idc = 5074;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.539192 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class p6: RscProgressV
		{
			idc = 5075;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.564974 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.198 * safezoneH;
			colorBar[] = {0,0,0,0.9};
		};
		class s1: RscSlider
		{
			idc = 5076;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.439156 * safezoneW + safezoneX;
			y = 0.5352 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class s2: RscSlider
		{
			idc = 5077;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class s3: RscSlider
		{
			idc = 5078;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.488552 * safezoneW + safezoneX;
			y = 0.533215 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class s4: RscSlider
		{
			idc = 5079;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.514438 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class s5: RscSlider
		{
			idc = 5080;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.539188 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class s6: RscSlider
		{
			idc = 5081;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.564969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.1078 * safezoneH;
		};
		class barritaCentral: RscProgressFrameBlanco
		{
			idc = 5082;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.44006 * safezoneW + safezoneX;
			y = 0.490044 * safezoneH + safezoneY;
			w = 0.14024 * safezoneW;
			h = 0.0198 * safezoneH;
			colorBar[] = {0,0.4,0.1,1};
		};
		class boton: RscButtonVerde
		{
			idc = 5083;
			text = "Forzar"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.6606 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
			action = " [sliderPosition 5076, sliderPosition 5077, sliderPosition 5078, sliderPosition 5079, sliderPosition 5080, sliderPosition 5081] spawn ica_fnc_ganzua; "; 
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
