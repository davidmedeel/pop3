class life_weapon_shop
{
	idd = 38400;
	movingEnabled = false;
	enableSimulation = true;
	class controlsBackground
	{
		class itemListBG: Life_RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.418 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls
	{

		class Title: Life_RscTitle
		{
			idc = 38401;			
			text = ""; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};

		class FilterList: Life_RscCombo
		{
			idc = 38402;
			onLBSelChanged = "_this call ext_fnc_weaponShopFilter";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};	

		class itemList: Life_RscListBox
		{
			idc = 38403;
			sizeEx = 0.035;
			onLBSelChanged = "_this call ext_fnc_weaponShopSelection";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class itemInfo: Life_RscStructuredText
		{
			idc = 38404;
			x = 0.515468 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};	

		class ButtonBuySell: Life_RscShopButton
		{
			idc = 38405;
			text = "$STR_Global_Buy";
			onButtonClick = "[] spawn ext_fnc_weaponShopBuySell; true";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;				
		};

		class ButtonClose: Life_RscShopButton
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.407188 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;			
		};
		
		class ItemCount: Life_RscEdit
		{
			idc = 38406;
			text = "1"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};		
	};
};