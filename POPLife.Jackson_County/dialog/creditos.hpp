
class creditos
{
    idd = 656656567;
    name= "creditos";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNameSpace setVariable ['creditos', _this select 0];";
	onUnLoad = "uiNameSpace setVariable ['creditos', nil];";

	class controls {

		class fondo: IGUIBack
		{
			idc = 2200;
			x = 0.324688 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class programacion: RscText
		{
			idc = 1000;
			text = "PROGRAMACIÓN"; //--- ToDo: Localize;
			x = 0.407174 * safezoneW + safezoneX;
			y = 0.257911 * safezoneH + safezoneY;
			w = 0.263007 * safezoneW;
			h = 0.0660243 * safezoneH;
			colorText[] = {1,0.68,0,1};
		};
		class ica: RscText
		{
			idc = 1001;
			text = "Icaruk - 75%"; //--- ToDo: Localize;
			x = 0.412331 * safezoneW + safezoneX;
			y = 0.301927 * safezoneH + safezoneY;
			w = 0.0618841 * safezoneW;
			h = 0.0330121 * safezoneH;
		};
		class medel1: RscText
		{
			idc = 1002;
			text = "Medel - 15%"; //--- ToDo: Localize;
			x = 0.412331 * safezoneW + safezoneX;
			y = 0.323935 * safezoneH + safezoneY;
			w = 0.0618841 * safezoneW;
			h = 0.0330121 * safezoneH;
		};
		class estrada: RscText
		{
			idc = 1003;
			text = "Estrada - 10%"; //--- ToDo: Localize;
			x = 0.412331 * safezoneW + safezoneX;
			y = 0.345943 * safezoneH + safezoneY;
			w = 0.067041 * safezoneW;
			h = 0.0330121 * safezoneH;
		};
		class mapeo: RscText
		{
			idc = 1004;
			text = "MAPEO"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,0.68,0,1};
		};
		class pke1: RscText
		{
			idc = 1005;
			text = "PKE - 80%"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class climent: RscText
		{
			idc = 1006;
			text = "Edu Climent - 20%"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class diseno: RscText
		{
			idc = 1007;
			text = "DISEÑO"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.066 * safezoneH;
			colorText[] = {1,0.68,0,1};
		};
		class pke2: RscText
		{
			idc = 1008;
			text = "PKE - 98%"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class medel2: RscText
		{
			idc = 1009;
			text = "Medel - 1%"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class borja: RscText
		{
			idc = 1010;
			text = "Borja Sanchez - 1%"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class botonCerrar: RscButton
		{
			idc = 1600;
			text = "CERRAR"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class credits: RscText
		{
			idc = 1011;
			text = "Creditos"; //--- ToDo: Localize;
			x = 0.324662 * safezoneW + safezoneX;
			y = 0.235903 * safezoneH + safezoneY;
			w = 0.0825121 * safezoneW;
			h = 0.0660243 * safezoneH;
			colorText[] = {0,0.3,0.6,1};
		};
	};
};
