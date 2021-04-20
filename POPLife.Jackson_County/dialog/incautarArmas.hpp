
class incautarArmas {
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['incautarArmas', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['incautarArmas', nil];";

	class controls {

		class fondo: IGUIBack
		{
			idc = 2200;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class texto: RscText
		{
			idc = 1000;
			text = "¿Qué tipo de arma quieres incautar?"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.702,0.102,0.102,1};
		};
		class fusil: RscButton
		{
			idc = 1600;
			onButtonClick = "['fusil'] spawn ica_fnc_incautarArmas;";
			text = "Fusil"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class pistola: RscButton
		{
			idc = 1602;
			onButtonClick = "['pistola'] spawn ica_fnc_incautarArmas;";
			text = "Pistola"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class credito: RscText
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
