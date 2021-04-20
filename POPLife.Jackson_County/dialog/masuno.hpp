
class masuno
{
	idd = -1;
	fadein=0.5;
	duration = 3;
	fadeout=0.5;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['masuno',_this select 0]";
	onUnload="uiNamespace setVariable ['masuno',nil]";

	class controls
	{
		class masuno: RscStructuredText
		{
			idc = 4065;
			text = ""; //--- ToDo: Localize;
			x = 0.372131 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.045;
		};
	};
};
