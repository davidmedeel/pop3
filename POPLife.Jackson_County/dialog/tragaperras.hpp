/*
	Creado por Rosen
*/

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)
class Tragaperras
{
	idd = 8750;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{

	};

	class controls
	{
		class fondo: RscPicture
		{
			idc = 8751;
			text = "\tragaperras\imagenes\fondo.jpg";
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};

		class Slot1: life_RscPicture
		{
			idc = 8752;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
		class Slot2: life_RscPicture
		{
			idc = 8753;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 16.75 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
		class Slot3: life_RscPicture
		{
			idc = 8754;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};

		class Premio: life_RscText
		{
			idc = 8755;
			text = "";
			x = 15 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};

		class Salir: life_RscButtonMenu
		{
			idc = 8756;
			text = "Salir";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;a = 0;";
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class Jugar: life_RscButtonMenu
		{
			idc = 8757;
			text = "Jugar (100€)";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[100] spawn ica_fnc_apuestas;";
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		
		class Credito: life_RscText
		{
			idc = 8758;
			text = "Rosen";
			x = 35.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};