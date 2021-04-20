
class buscandoPetroleo {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['buscandoPetroleo', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['buscandoPetroleo', nil]; ";

	class controls {
		
		class fondo: RscPicture
		{
			idc = -1;
			text = "\pop_iconos\icons\mar.paa";
			x = 0.342219 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.317625 * safezoneW;
			h = 0.528 * safezoneH;
        };
		class boton: RscButton
		{
			onMouseEnter = "_nil = ['click'] execVM ""ica\farmeo\buscandoPetroleo.sqf"";";
			idc = 4059;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0};
			period = 0;
			periodFocus = 0;
			periodOver = 0;			
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
