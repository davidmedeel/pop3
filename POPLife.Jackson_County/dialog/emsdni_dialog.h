#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

//--- 
#define IDC__TEXTNOMBRE	1000
#define IDC__TEXT		1001
#define IDC__PICTURE	1200

class EMSDNI_dialog
{
	idd = 65673;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="EMSDNI_dialog";
	onLoad="uiNamespace setVariable ['EMSDNI_dialog',_this select 0];";

		
	class ControlsBackground
	{
		class Picture: AkrPicture
		{
			idc = 1500;
			text = "\pop_iconos\textures\dniems.paa";
			x = 0.669764 * safezoneW + safezoneX;
			y = 0.0240253 * safezoneH + safezoneY;
			w = 0.293229 * safezoneW;
			h = 0.37398 * safezoneH;
		};
	};

	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Akryllax, v1.063, #Fikoqo)
		////////////////////////////////////////////////////////

		class TextNombre: AkrText
		{
			idc = 656821;
			text = "Persona Nombre largo"; //--- ToDo: Localize;
			x = 0.793229 * safezoneW + safezoneX;
			y = 0.109021 * safezoneH + safezoneY;
			w = 0.146614 * safezoneW;
			h = 0.0509973 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		class Text: AkrText
		{
			idc = 656822;
			text = "014239"; //--- ToDo: Localize;
			x = 0.808662 * safezoneW + safezoneX;
			y = 0.143019 * safezoneH + safezoneY;
			w = 0.146614 * safezoneW;
			h = 0.0509973 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};