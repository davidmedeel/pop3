class daDinero
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['daDinero', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['daDinero', nil]; ";
	
	class controls {
		class entrada: RscEdit
		{
			idc = 7070;
			text = "";
			x = 1.4575;
			y = 0.68;
			w = 0.235;
			h = 0.04;
		};
		class desplegable: RscCombo
		{
			idc = 7071;

			x = 1.4575;
			y = 0.724;
			w = 0.235;
			h = 0.04;
		};
		class boton: RscButton
		{
			idc = 7072;

			text = "DAR";
			x = 1.4575;
			y = 0.768;
			w = 0.235;
			h = 0.04;
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