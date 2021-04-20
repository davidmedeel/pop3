
class sangrado {
	idd = -1;
	movingEnable = 0;
	duration = 0.1;
	fadeout = 1;
	
	onLoad = "uiNamespace setVariable ['sangrado', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['sangrado', nil]; ";
	
	class controls {
		class img: RscPicture
		{
			idc = 7015;
			text = "\pop_iconos\icons\medICA\sangrado4.paa";
			x = -0.00221877 * safezoneW + safezoneX;
			y = -0.00379999 * safezoneH + safezoneY;
			w = 1.00341 * safezoneW;
			h = 1.0054 * safezoneH;
		};
	};
};

