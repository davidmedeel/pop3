class dat1
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat1.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat2
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat2.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat3
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat3.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat4
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat4.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat5
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat5.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat6
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat6.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat7
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat7.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class dat8
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad = "";
	objects[]={};

	class controls {
		class img: RscPicture
		{
			type = CT_STATIC;
			style = ST_PICTURE;
			idc = -1;
			text = "\pop_iconos\icons\dat8.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.374 * safezoneH;
		};
	};
};

class progresoRoboDeDatos
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad="uiNamespace setVariable ['progresoRoboDeDatos',_this select 0]";
	objects[]={};

	class controls {
		class barrita: RscProgress
		{
			idc = 4000;
			x = 0.44856 * safezoneW + safezoneX;
			y = 0.727 * safezoneH + safezoneY;
			w = 0.100656 * safezoneW;
			h = 0.0374 * safezoneH;
			colorBar[] = {0.1,0.8,0,1};
		};
        class medel: RscText
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



class datosRobados
{
	idd = -1;
	movingEnable = 0;
	fadein = 0;
	duration = 9e+012;
	fadeout = 0;
	name = "";
	onLoad="uiNamespace setVariable ['datosRobados',_this select 0]";
	objects[]={};

	class controls {
		class texto: RscText
		{
			idc = 4001;
			text = "error"; //--- ToDo: Localize;
			x = 0.448439 * safezoneW + safezoneX;
			y = 0.7926 * safezoneH + safezoneY;
			w = 0.101062 * safezoneW;
			h = 0.0308 * safezoneH;
			colorText[] = {0,1,0,1};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.033;
		};
        class medel: RscText
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




