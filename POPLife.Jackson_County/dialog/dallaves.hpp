class daLlaves
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['daLlaves', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['daLlaves', nil]; ";
	
	class controls {
	
			class imagen: RscPicture
		{
			text = "\POP_Info\acj\llavero.paa";
			x = 0.742361 * safezoneW + safezoneX;
			y = 0.313982 * safezoneH + safezoneY;
			w = 0.252674 * safezoneW;
			h = 0.48405 * safezoneH;
			
		};
		
		class lista: RscListbox
		{
			idc = 7075;
			sizeEx = 0.027;
			x = 1.3125;
			y = 0.44;
			w = 0.375;
			h = 0.22;
		};
		class boton: RscButton
		{
			idc = 7077;

			text = "DAR"; //--- ToDo: Localize;
			x = 1.5825;
			y = 0.66;
			w = 0.105;
			h = 0.048;
		};
		class desplegable: RscCombo
		{
			idc = 7076;

			x = 1.3125;
			y = 0.66;
			w = 0.2675;
			h = 0.048;
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
