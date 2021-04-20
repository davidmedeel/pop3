class mensajesica
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['mensajesica', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['mensajesica', nil]; ";

	class controls {
		class imagen: RscPicture
		{
		type = CT_STATIC;
		style = ST_PICTURE;
		idc = -1;
		text = "\pop_iconos\paa\mano.paa";
		x = 0.65467 * safezoneW + safezoneX;
	y = 0.31308 * safezoneH + safezoneY;
	w = 0.345429 * safezoneW;
	h = 0.692705 * safezoneH;
		};
		class lista: RscListbox
		{
			idc = 7080;
			sizeEx = 0.036;

			x = 1.025;
			y = 0.32;
			w = 0.3375;
			h = 0.536;
		};
		class entrada: RscEdit
		{
			idc = 7082;
			style = 16;

			x = 1.025;
			y = 0.9;
			w = 0.3375;
			h = 0.184;
		};
		class desplegable: RscCombo
		{
			idc = 7081;

			x = 1.025;
			y = 0.86;
			w = 0.3375;
			h = 0.044;
		};
		class boton: RscButtonVerde
		{
			idc = 7083;

			text = "ENVIAR"; //--- ToDo: Localize;
			x = 1.025;
			y = 1.08;
			w = 0.3375;
			h = 0.044;
		};
	};
};



