class centralita {
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['centralita_dialog', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['centralita_dialog', nil];";


	class controls {
		class centralita_bg: IGUIBack
		{
			idc = -1;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 36.5 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
		class centralita_etiqueta1: RscText
		{
			idc = -1;
			text = "Centralita Policial de Lakeside - Asignacion de patrullas"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = -0.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 38 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 1.5 * GUI_GRID_H;
		};
		class centralita_et2: RscText
		{
			idc = -1;
			text = "Mando H50:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "Zeta 10:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1003: RscText
		{
			idc = -1;
			text = "Zeta 11:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1004: RscText
		{
			idc = -1;
			text = "Zeta 20:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1005: RscText
		{
			idc = -1;
			text = "Zeta 21:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1006: RscText
		{
			idc = -1;
			text = "Zeta 30:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1007: RscText
		{
			idc = -1;
			text = "Zeta 31:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1008: RscText
		{
			idc = -1;
			text = "Bravo 10:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1009: RscText
		{
			idc = -1;
			text = "Bravo 20:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1010: RscText
		{
			idc = -1;
			text = "Bravo 30:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1011: RscText
		{
			idc = -1;
			text = "Bravo 40:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1012: RscText
		{
			idc = -1;
			text = "Metacoptero:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1013: RscText
		{
			idc = -1;
			text = "Marítima:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1014: RscText
		{
			idc = -1;
			text = "Intervención:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1015: RscText
		{
			idc = -1;
			text = "Asignación:"; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class centralita_editH50: RscEdit
		{
			idc = 777701;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ10: RscEdit
		{
			idc = 777702;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ11: RscEdit
		{
			idc = 777703;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ20: RscEdit
		{
			idc = 777704;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ21: RscEdit
		{
			idc = 777705;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ30: RscEdit
		{
			idc = 777706;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ31: RscEdit
		{
			idc = 777707;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editS10: RscEdit
		{
			idc = 777708;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editZ40: RscEdit
		{
			idc = 777709;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editA100: RscEdit
		{
			idc = 777710;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editB100: RscEdit
		{
			idc = 777711;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editC100: RscEdit
		{
			idc = 777712;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editD100: RscEdit
		{
			idc = 777713;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editInt: RscEdit
		{
			idc = 777714;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_editMeta: RscEdit
		{
			idc = 777715;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 29.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class centralita_btnActualizar: RscButton
		{
			idc = 777716;
			text = "ACTUALIZAR"; //--- ToDo: Localize;
			x = 24 * GUI_GRID_W + GUI_GRID_X;
			y = 25 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "['actualizar'] spawn ica_fnc_centralita;";
		};
		class centralita_btnCerrar: RscButton
		{
			idc = 777717;
			text = "CERRAR"; //--- ToDo: Localize;
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 25 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			action = "closedialog 0;";
		};
	}; // Controls
};
