class channel{
	idd = 9000;
	name= "channel";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
//			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorBackground[] = {0, 0.62, 0.62, 1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "PoPLife Noticias ";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class Channel7NewsEditText : Life_RscStructuredText
		{
			idc = -1;
			text = "SMS para todos:";
			x = 0.12;
            y = 0.4;
			w = 0.2;
			h = 0.1;
		};
		
		class Channel7Edit : Life_RscEdit
        {
            idc = 9001;
            text = "";
            sizeEx = 0.04;
            x = 0.275; 
            y = 0.4;
            w = 0.4; 
            h = 0.04;	
		};
		
		class Channel7Description : Life_RscStructuredText
		{
			idc = -1;
			text = "Este mensaje será transmitido a través del servidor, prestar atención a lo que escribes!";
			x = 0.12;
            y = 0.5;
			w = 0.5;
			h = 0.1;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SendButtonKey : Life_RscButtonMenu {
			idc = 9005;
			text = "Enviar";
			onButtonClick = "[] call life_fnc_sendChannel; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
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
