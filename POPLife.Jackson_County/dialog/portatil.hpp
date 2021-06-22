
class portatil {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['portatil', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['portatil', nil]; abierto = nil";

	class controls {
		class portatil: RscPicture
		{
			text = "\pop_iconos\icons\portatil.paa";
			idc = -1;
			x = 0.327782 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class texto: RscText
		{
			idc = 4090;
			text = "Introduce código DSC"; //--- ToDo: Localize;
			x = 0.413378 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.187666 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			
		};
		class fondoEntrada: IGUIBack
		{
			idc = -1;
			x = 0.356658 * safezoneW + safezoneX;
			y = 0.7178 * safezoneH + safezoneY;
			w = 0.271219 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class entrada: RscEdit
		{
			idc = 4092;
			text = ""; //--- ToDo: Localize;
			x = 0.360782 * safezoneW + safezoneX;
			y = 0.7244 * safezoneH + safezoneY;
			w = 0.264036 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 0.09;
		};
		class txtCentral: RscStructuredText
		{
			idc = 4091;
			text = ""; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.2398 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class boton: RscButton
		{
			idc = 4093;
			text = "INTRO"; //--- ToDo: Localize;
			x = 0.633033 * safezoneW + safezoneX;
			y = 0.7244 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
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

class documentos {
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['documentos', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['documentos', nil]; abierto = nil";
	
	class controls {
		class foto: RscPicture	{
			idc = -1;
			text = "\pop_iconos\icons\doc.paa";
			x = 0.295762 * safezoneW + safezoneX;
			y = 0.0754 * safezoneH + safezoneY;
			w = 0.408476 * safezoneW;
			h = 0.8426 * safezoneH;
		};
		class texto: RscText {
			shadow = 0;
			idc = 4095;
			text = "12345678901234567890"; //--- ToDo: Localize;
			x = 0.448424 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.123781 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,1};
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
        class credito: RscText
        {
	        idc = -1;
	        text = "Icaruk"; //--- ToDo: Localize;
	        x = -0.000156274 * safezoneW + safezoneX;
	        y = -0.00599999 * safezoneH + safezoneY;
	        w = 0.0773437 * safezoneW;
	        h = 0.033 * safezoneH;
        };
	};
};

class cajafuerte {
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['cajafuerte', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['cajafuerte', nil];";
	
	class controls {
		class fondo: RscPicture
		{
			text = "\pop_iconos\paa\cajafuerte.paa";
			idc = -1;
			x = 0.123594 * safezoneW + safezoneX;
			y = 0.00499985 * safezoneH + safezoneY;
			w = 0.778594 * safezoneW;
			h = 0.935 * safezoneH;
		};
		class boton: RscButton
		{
			idc = 4096;
			text = "ABRIR"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class entrada: RscEdit
		{
			idc = 4097;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
