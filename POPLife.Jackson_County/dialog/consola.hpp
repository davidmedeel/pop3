
class consola
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['consola', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['consola', nil]; ";
	
	class controls {
		
		class fondoizq: IGUIBack
		{
			idc = 8398;
			x = 0.00912499 * safezoneW + safezoneX;
			y = 0.0182 * safezoneH + safezoneY;
			w = 0.281531 * safezoneW;
			h = 0.9306 * safezoneH;
		};
		class fondoder: IGUIBack
		{
			idc = 8399;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.924 * safezoneH;
		};
		
		// Referencias de las posiciones secundarias

		class posicionL: RscHitbox
		{
			idc = 8428;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.0182 * safezoneH + safezoneY;
			w = 0.281531 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class posicionR: RscHitbox
		{
			idc = 8429;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.0182 * safezoneH + safezoneY;
			w = 0.281531 * safezoneW;
			h = 0.0792 * safezoneH;
		};		

		// Entradas

		class e1: RscEdit
		{
			idc = 8404;
			style = 16;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			autocomplete = "scripting";
			font = "EtelkaMonospacePro";
			x = 0.01325 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.274312 * safezoneW;
			h = 0.1232 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class e2: e1
		{
			idc = 8405;
			x = 0.01325 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.274312 * safezoneW;
			h = 0.1232 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class e3: e1
		{
			idc = 8406;
			x = 0.01325 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.274312 * safezoneW;
			h = 0.1232 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class e4: e1
		{
			idc = 8407;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
			x = 0.01325 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.274312 * safezoneW;
			h = 0.5192 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		// Entrada monitores

		class m1: RscEdit
		{
			idc = 8408;
			autocomplete = "scripting";
			font = "EtelkaMonospacePro";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			shadow = false;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class m2: m1
		{
			idc = 8410;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m3: m1
		{
			idc = 8412;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m4: m1
		{
			idc = 8414;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m5: m1
		{
			idc = 8416;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m6: m1
		{
			idc = 8418;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m7: m1
		{
			idc = 8420;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class m8: m1
		{
			idc = 8430;
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.275344 * safezoneW;
			h = 0.0286 * safezoneH;
		};			

		// Respuesta monitores

		class r1: RscEdit
		{
			idc = 8409;
			font = "EtelkaMonospacePro";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			shadow = false;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.0666 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r2: r1
		{
			idc = 8411;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.1326 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r3: r1
		{
			idc = 8413;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.1986 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r4: r1
		{
			idc = 8415;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.2646 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r5: r1
		{
			idc = 8417;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.3306 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r6: r1
		{
			idc = 8419;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.3966 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		class r7: r1
		{
			idc = 8421;
			text = "";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.4626 * safezoneH + safezoneY;
			w = 0.275342 * safezoneW;
			h = 0.0242 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};	
		class grp_r8: RscControlsGroup
		{
			idc = 8432;
			x = 0.700065 * safezoneW + safezoneX;
			y = 0.5308 * safezoneH + safezoneY;
			w = 0.290808 * safezoneW;
			h = 0.3806 * safezoneH;
			colorBackground[] = {0,0,0,0};

			class Controls
			{
				class r8: RscStructuredText
				{
					idc = 8431;

					font = "EtelkaMonospacePro";
					sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = false;
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,1};
					x = 0.0113447 * safezoneW;
					y = -0.00220004 * safezoneH;
					w = 0.275343 * safezoneW;
					h = 0.352 * safezoneH;
				};
			};
		};

		// Checkboxes

		class check1: RscCheckbox
		{
			idc = 8422;
			x = -0.00531252 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class check2: RscCheckbox
		{
			idc = 8423;
			x = 0.979531 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		// Hitboxes
		class hb1: RscHitbox
		{
			idc = 8424;
			x = 0.295812 * safezoneW + safezoneX;
			y = 0.031052 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.1166 * safezoneH;

		};
		class hb2: RscHitbox
		{
			idc = 8425;
			x = 0.295813 * safezoneW + safezoneX;
			y = 0.1612 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.1166 * safezoneH;
		};
		class hb3: RscHitbox
		{
			idc = 8426;
			x = 0.295811 * safezoneW + safezoneX;
			y = 0.2932 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.1166 * safezoneH;
		};
		class hb4: RscHitbox
		{
			idc = 8427;
			x = 0.295855 * safezoneW + safezoneX;
			y = 0.423726 * safezoneH + safezoneY;
			w = 0.086625 * safezoneW;
			h = 0.1166 * safezoneH;
		};	

		// Botones

		class b1: RscButton
		{
			idc = 8401;
			periodFocus = 0;
			periodOver = 0;
			period = 0;
			text = "LOCAL"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class b2: b1
		{
			idc = 8402;
			text = "SERVER"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class b3: b1
		{
			idc = 8403;
			text = "GLOBAL"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class b4: b1
		{
			idc = 8400;
			text = "BORRAR"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
