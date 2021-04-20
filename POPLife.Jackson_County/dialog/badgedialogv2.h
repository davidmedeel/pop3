#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class BadgeDialogV2
{
	idd = 65672;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="BadgeDialogV2";
	onLoad="uiNamespace setVariable ['BadgeDialogV2',_this select 0];";

	class ControlsBackground
	{
		class AkrPicture_1200: AkrPicture
		{
			idc = 1200;
			text = "\pop_iconos\textures\carne de policia.paa";
			x = 0.72378 * safezoneW + safezoneX;
			y = -0.026972 * safezoneH + safezoneY;
			w = 0.24693 * safezoneW;
			h = 0.390979 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {1,1,1,0.5};
		};
	};

	class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ElDon, v1.063, #Gokuvo)
		////////////////////////////////////////////////////////
		class TextAgentName: AkrText
		{
			idc = 656711;
			text = "Agente Nombre Largo"; //--- ToDo: Localize;
			x = 0.885828 * safezoneW + safezoneX;
			y = 0.211015 * safezoneH + safezoneY;
			w = 0.146614 * safezoneW;
			h = 0.0509973 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};
		class TextBadge: AkrText
		{
			idc = 656712;
			text = "055418"; //--- ToDo: Localize;
			x = 0.893544 * safezoneW + safezoneX;
			y = 0.194016 * safezoneH + safezoneY;
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

