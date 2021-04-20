
class Life_Vehicle_Shop_v2_3D
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	onUnLoad = "[] call life_fnc_vehicleShopEnd3DPreview";

	class controlsBackground
	{
		class MainBackground: Life_RscText
		{
			idc = -1;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.66 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class SecondBackground: Life_RscText
		{
			idc = -1;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscTitle
		{
			idc = 2301;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class VehicleTitleBox: Life_RscText
		{
			idc = -1;
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class VehicleInfoHeader: Life_RscText
		{
			idc = 2330;
			x = 0.819687 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RentCar: Life_RscButtonMenu
		{
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			idc = 1006;
			text = "Alquilar"; //--- ToDo: Localize;
			x = 0.0771875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class BuyCar: Life_RscButtonMenu
		{
			idc = 2309;
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class closeButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 1011;
			text = "Cerrar"; //--- ToDo: Localize;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class probarBoton: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn ica_fnc_probarVeh;";
			idc = 1012;
			text = "Probar"; //--- ToDo: Localize;
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls
	{
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			sizeEx = 0.040;
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			x = 0.025625 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class ColorList: Life_RscCombo
		{
			idc = 2304;
			onLBSelChanged = "[Life_Preview_3D_Vehicle_object,(_this select 1)] spawn life_fnc_colorVehicle";
			x = 0.0720312 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			x = 0.819687 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.275 * safezoneH;
		};
	};
};
