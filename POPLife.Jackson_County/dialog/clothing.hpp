class Life_Clothing {
	idd = 3100;
	name= "Life_Clothing";
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {
		class bg: Life_RscText
		{
			idc = -1;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.363 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};		
	};
	
	class controls 
	{
		class Title : Life_RscTitle 
		{
			idc = 3103;
			text = ""; //--- ToDo: Localize;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		
		class ClothingList : Life_RscListBox 
		{
			idc = 3101;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.308 * safezoneH;
		};
		
		class PriceTag : Life_RscStructuredText
		{
			idc = 3102;
			text = "";		
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};		
				
		class FilterList : Life_RscCombo
		{
			idc = 3105;
			colorBackground[] = {0,0,0,0.7};
			onLBSelChanged  = "_this call life_fnc_clothingFilter";
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};		

		class BuyButtonKey : Life_RscShopButton 
		{
			idc = -1;
			text = "$STR_Global_Buy";
			onButtonClick = "[] call life_fnc_buyClothes;";
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class CloseButtonKey : Life_RscShopButton 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
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