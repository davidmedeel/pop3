class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground:RscPicture {
		text = "\POP_Info\acj\policia.paa";
			x = 0.184931 * safezoneW + safezoneX;
			y = 0.140043 * safezoneH + safezoneY;
			w = 0.618794 * safezoneW;
			h = 0.715073 * safezoneH;
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

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Wanted_Title";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;
		};

		class WantedConnection: Title
		{
			idc = 2404;
			style = 1;

			x = -28.48 * GUI_GRID_W + GUI_GRID_X;
			y = -10.23 * GUI_GRID_H + GUI_GRID_Y;
			w = 0 * GUI_GRID_W;
			h = 0 * GUI_GRID_H;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class WantedList: Life_RscListBox
		{
			idc = 2401;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			text = "";
			sizeEx = 0.035;
			x = -4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17.5 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;
		};
		class PlayerList: Life_RscListBox
		{
			idc = 2406;
			onLBSelChanged = "";
			text = "";
			sizeEx = 0.035;
			x = 32 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;
		};
		class WantedDetails: Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
		class BountyPrice: Life_RscText
		{
			idc = 2403;

			x = -28.48 * GUI_GRID_W + GUI_GRID_X;
			y = -10.23 * GUI_GRID_H + GUI_GRID_Y;
			w = 0 * GUI_GRID_W;
			h = 0 * GUI_GRID_H;
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1007;
			text = "Cerrar"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.50061 * GUI_GRID_W;
			h = 2.0002 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class PardonButtonKey: Life_RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";

			text = "Perdonar"; //--- ToDo: Localize;
			x = -4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.50061 * GUI_GRID_W;
			h = 2.0002 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};
