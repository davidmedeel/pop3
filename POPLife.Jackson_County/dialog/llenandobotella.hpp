
class llenandoBotella {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['llenandoBotella', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['llenandoBotella', nil]; llena = nil;";

	class controls {
		class barrita: RscProgressV
		{
			idc = 4058;
			text = "";
			x = 0.462874 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0660001 * safezoneW;
			h = 0.3586 * safezoneH;
			colorBar[] = {0,0.3,0.8,0.7};
		};
		class fondo: RscPicture
		{
			idc = -1;
			text = "\pop_iconos\icons\botellaVacia.paa";
			x = 0.342219 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.317625 * safezoneW;
			h = 0.528 * safezoneH;
        };
	};
};

