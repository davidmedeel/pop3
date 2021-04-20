/*
	Creado por Rosen
*/
#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)
class inscripcion {

    idd = 9720;
    movingEnabled = false;
    
	class controlsBackground {
		class Life_RscTitleBackground:RscPicture {
			text = "\pop_iconos\paa\ins.paa";
			x = 0.38142 * safezoneW + safezoneX;
			y = 0.291089 * safezoneH + safezoneY;
			w = 0.221693 * safezoneW;
			h = 0.285878 * safezoneH;
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


		class Titulo: RscText {
			idc = 9722;

			text = "Inscripcion a las elecciones";
			x = 0.38 * safezoneW + safezoneX;
			y = 0.313073 * safezoneH + safezoneY;
			w = 0.2 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		
		class Inscribirse: RscButtonVerde {
			idc = 9723;
			text = "Inscribirse";
			onButtonClick = "[] spawn ica_fnc_inscripcion;";
			x = 0.396887 * safezoneW + safezoneX;
			y = 0.576967 * safezoneH + safezoneY;
			w = 0.0618678 * safezoneW;
			h = 0.0439812 * safezoneH;
		};

		class Salir: RscButton {
			idc = 9724;

			text = "Salir";
			onButtonClick = "closeDialog 0;";
			x = 0.520623 * safezoneW + safezoneX;
			y = 0.576967 * safezoneH + safezoneY;
			w = 0.0618678 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class Credito: life_RscText
		{
			idc = 9725;
			text = "Rosen";
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};	
