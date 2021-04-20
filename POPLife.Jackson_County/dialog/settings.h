class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;

	class controlsBackground
	{
		
		class padImage : life_RscPicture {
			idc = 2903;
			text = "";
			x = 0; 
			y = -0.1; 
			
			w = 1;
			h = 1.3;
		};
		
		class BackButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0; [] spawn ext_fnc_p_openMenu";
			tooltip = "Volver al menu principal";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.405; 
			y = 0.84;		
			
			w = 0.032;
			h = 0.045;
		};
		
		class HomeButton: Life_PictureButtonMenu
		{
			idc = -1;
			text = "";	
			onButtonClick = "closeDialog 0";
			tooltip = "Cerrar";
			
			colorBackground[] = {1,1,1,0.004};
			colorBackgroundFocused[] = {1,1,1,0.008};
			colorBackground2[] = {0.75,0.75,0.75,0.004};

			x = 0.485; 
			y = 0.84;		
			
			w = 0.032;
			h = 0.045;
		};
	};
	
	class controls
	{		
		class Title : life_RscTitle
		{
			idc = -1;
			colorBackground[] = {1,1,1,0.1};
			text = "$STR_SM_Title";
			x = 0.1;
			y = 0.25;
			w = 0.8;
			h = (1 / 25);
		};
		
		class PlayerTagsHeader : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.1;
			y = 0.472;
			w = 0.35;
			h = (1 / 25);
		};
			
		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Buscar Inmueble";
			
			y = 0.542;
		};
		
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.1; y = 0.3;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.1; y = 0.347;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.1; y = 0.397;
			w = 0.275; h = 0.04;
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call ext_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.2;
			y = 0.342 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.48; y = 0.3;
			w = 0.275; h = 0.04;
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call ext_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.2;
			y = 0.392 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			
			x = 0.48; y = 0.352;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call ext_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.2;
			y = 0.442 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			
			x = 0.48; y = 0.402;
			w = 0.275; h = 0.04;
		};
		
		class PlayerTagsONOFF : Life_RscActiveText
		{
			text = "";
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.45;
			y = 0.472;
			w = 0.275;
		};
			
		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_PlayerReveal";
			idc = 2972;
			y = 0.542;
		};
		
		class ColorTitle : Life_RscStructuredText
		{
			idc = -1;
			text = "Color:";
			sizeEx = 0.020;
			x = 0.1; y = 0.62;
			w = 0.1; h = (1 / 25);
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2973;
			x = 0.21; 
			y = 0.62;
			w = 0.2; 
			h = (1 / 25);
		};
		
		class ColorButton : Life_RscButtonMenu {
			idc = 2974;
			text = "Aplicar";
			style = 1;
			colorBackground[] = {1,1,1,0.1};
			onButtonClick = "[] call ext_fnc_savePhoneColor";
			x = 0.415;
			y = 0.62;
			w = 0.13;
			h = (1 / 25);
		};
	};
};