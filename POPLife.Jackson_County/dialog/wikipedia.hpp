
class wikipedia {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['wikipedia', _this select 0]; abierto = true;";
	onUnLoad = "uiNamespace setVariable ['wikipedia', nil]; abierto = nil";

	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.214342 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.605347 * safezoneW;
			h = 0.6424 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class texto: RscStructuredText
		{
			idc = 5055;
			x = 0.429872 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.377442 * safezoneW;
			h = 0.5962 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.027;
			font = "Zeppelin33";
		};
		class lista: RscListbox
		{
			idc = 5056;
			x = 0.2195 * safezoneW + safezoneX;
			y = 0.1876 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.627 * safezoneH;
			onLBSelChanged = "['actualiza'] call ica_fnc_wikipedia";
		};
		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.414406 * safezoneW + safezoneX;
			y = 0.1876 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.627 * safezoneH;
		};
	};
};
