/*
	Creado por Rosen
*/
#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)
class votar {

    idd = 10720;
    movingEnabled = false;
	
	class controlsBackground {
		class IGUIBack_2200: IGUIBack
{
		idc = -1;
		x = 0.371109 * safezoneW + safezoneX;
		y = 0.236113 * safezoneH + safezoneY;
		w = 0.252627 * safezoneW;
		h = 0.406826 * safezoneH;
};
		class Fondo:RscPicture {
			text = "\pop_iconos\paa\fondovotar.paa";
			x = 0.371109 * safezoneW + safezoneX;
			y = 0.368056 * safezoneH + safezoneY;
			w = 0.252627 * safezoneW;
			h = 0.241897 * safezoneH;
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
	};
	
	class Controls {	

		class Titulo : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Votaciones";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};
		
		class Lista : Life_RscListBox 
		{
			idc = 10721;
			sizeEx = 0.035;
			x = 0.371109 * safezoneW + safezoneX;
			y = 0.236113 * safezoneH + safezoneY;
			w = 0.252627 * safezoneW;
			h = 0.131944 * safezoneH;
		};
		
		
		class Salir : Life_RscButtonMenu {
			idc = -1;
			text = "Salir";
			onButtonClick = "closeDialog 0;";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.609953 * safezoneH + safezoneY;
			w = 0.0824904 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class Votar : Life_RscButtonMenu {
			idc = 10722;
			text = "Votar";
			onButtonClick = "[] spawn ica_fnc_votar";
			x = 0.412354 * safezoneW + safezoneX;
			y = 0.609953 * safezoneH + safezoneY;
			w = 0.0824904 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class Credito: life_RscText
		{
			idc = 10723;
			text = "Rosen";
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};	