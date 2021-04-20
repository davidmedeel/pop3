
class confirmacion
{
	idd = 645967;
	onLoad = "uiNamespace setVariable ['confirmacion', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['confirmacion', nil]; ";
	onKeyDown = "if ((_this select 1) == 1) then {true}"; // bloqueo ESC
	
	
	class controlsBackground {
		
		class fondo: IGUIBack
		{
			idc = 6351;
			
			x = 0.299937 * safezoneW + safezoneX;
			y = 0.3218 * safezoneH + safezoneY;
			w = 0.400125 * safezoneW;
			h = 0.2486 * safezoneH;
		};
				
	};
	
	class controls {

		class grp: RscControlsGroup
		{
			idc = 6350;

			x = 0.295812 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.408375 * safezoneW;
			h = 0.264 * safezoneH;
			class Controls
			{
				class txt: RscStructuredText
				{
					idc = 6352;

					x = 0.00824999 * safezoneW;
					y = 0.0176 * safezoneH;
					w = 0.385655 * safezoneW;
					h = 0.2332 * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
			};
		};

		class b1: RscButton
		{
			idc = 6353;
			text = "ACEPTAR"; //--- ToDo: Localize;
			x = 0.0061875 * safezoneW;
			y = 0.3476 * safezoneH;
			w = 0.200057 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class b2: RscButton
		{
			idc = 6354;
			text = "CANCELAR"; //--- ToDo: Localize;
			x = 0.50103 * safezoneW + safezoneX;
			y = 0.5726 * safezoneH + safezoneY;
			w = 0.200057 * safezoneW;
			h = 0.044 * safezoneH;
		};

	};
};


