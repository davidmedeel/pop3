class life_wantedadd2 {
	idd = 9900;
	name= "life_wantedadd2";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_wantedadd2;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 1.0;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 1.0;
			h = 0.9 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "Write";
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 9902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.72;
		};
		
        class RSUCombo_2101: Life_RscListBox
        {
            idc = 9991;
			text = "";
			sizeEx = 0.035;
			x = 0.42;
			y = 0.26;
			w = 0.65;
			h = 0.72;
           // onLBSelChanged="call fnc_Cmb_changed;";
			//--- action/function to call when listbox or combobox has been changed
 
        };
		


		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.1 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		

		class Adminwanted : Life_RscButtonMenu {
			idc = -1;
			text = "Add";
			onButtonClick = "[] call life_fnc_wanted2;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.1 - (1 / 25);
			w = 0.18;
			//w = (6.25 / 40);
			h = (1 / 25);
		};		
		


	};
};