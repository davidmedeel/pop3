
class informacion
{
    idd = 3200;
    name= "informacion";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn ica_fnc_informacion; uiNameSpace setVariable ['informacion', _this select 0];";
	onUnLoad = "uiNameSpace setVariable ['informacion', nil];";

	class controls {

		class fondo: IGUIBack
		{
			idc = 4000;
			x = 0.338094 * safezoneW + safezoneX;
			y = 0.2998 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.4686 * safezoneH;
		};
		class texto: RscStructuredText
		{
			idc = 4001;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.3042 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class listaJugadores: RscListbox
		{
			idc = 4002;
			sizeEx = 0.040;
			x = 0.476281 * safezoneW + safezoneX;
			y = 0.3042 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class b: RscButton
		{
			idc = 4003;
			text = "CERRAR"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.7244 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.0396 * safezoneH;
		};
		class edit: RscEdit
		{
			idc = 4004;
			x = 0.478344 * safezoneW + safezoneX;
			y = 0.7266 * safezoneH + safezoneY;
			w = 0.129938 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
