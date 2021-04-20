#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class BadgeDialog
{
	idd = 65671;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="BadgeDialog";
	onLoad="uiNamespace setVariable ['BadgeDialog',_this select 0];";
	
	class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ElDon, v1.063, #Segyxi)
		////////////////////////////////////////////////////////

		class AkrText_1000: AkrText
		{
			idc = 1000;
			x = 51.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16.5 * GUI_GRID_W;
			h = 15.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {1,1,1,1};
		};
		class PictureBadge: AkrPicture
		{
			idc = 656713;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 55 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 7.5 * GUI_GRID_H;
		};
		class AkrText_1001: AkrText
		{
			idc = 1001;
			text = "Agente"; //--- ToDo: Localize;
			x = 52.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class AkrText_1002: AkrText
		{
			idc = 1002;
			text = "Placa numero"; //--- ToDo: Localize;
			x = 52.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {1,1,1,1};
		};
		class TextCopName: AkrText
		{
			idc = 656711;
			text = "Agente Lopez"; //--- ToDo: Localize;
			x = 53 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.75,0.75,0.75,1};
			colorActive[] = {0.75,0.75,0.75,1};
		};
		class TextBadgeNumber: AkrText
		{
			idc = 656712;
			text = "00000000011011"; //--- ToDo: Localize;
			x = 53.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {0.75,0.75,0.55,1};
			colorActive[] = {0.75,0.65,0.75,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
}


#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class PLACA_POLICIA
{
	idd = 65672;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="PLACA_POLICIA";
	onLoad="uiNamespace setVariable ['PLACA_POLICIA',_this select 0];";

	class ControlsBackground
	{
		class AkrPicture_1200: AkrPicture
		{
			idc = 1200;
			text = "medel\imagenes\PLACA_POLICIA.paa";
			x = 40.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 28 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {1,1,1,0.5};
		};
	};

	class Controls {
		class TextAgentName: AkrText
		{
			idc = 656711;
			text = "Agente Nombre Largo"; //--- ToDo: Localize;
			x = 57 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		class TextBadge: AkrText
		{
			idc = 656712;
			text = "055418"; //--- ToDo: Localize;
			x = 62 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
	};
};
