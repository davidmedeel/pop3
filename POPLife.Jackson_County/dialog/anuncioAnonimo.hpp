
class anuncioAnonimo {
	idd = 10000;
	name = "anuncioAnonimo";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class tituloBackGround: Life_RscText {
			colorBackground[] = {0, 0.62, 0.62, 1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class principal: Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
class controls {
		
		class Titulo: Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "PoPLife Noticias:";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class texto: Life_RscStructuredText {
			idc = -1;
			text = "SMS para todos:";
			x = 0.12;
            y = 0.4;
			w = 0.2;
			h = 0.1;
		};
		
		class mensaje: Life_RscEdit {
            idc = 5254;
            text = "";
            sizeEx = 0.04;
            x = 0.275; 
            y = 0.4;
            w = 0.4; 
            h = 0.04;	
		};

		class descripcion: Life_RscStructuredText {
			idc = -1;
			text = "Este mensaje será transmitido a través del servidor de forma anónima";
			x = 0.12;
            y = 0.5;
			w = 0.5;
			h = 0.1;
		};

		class cerrar: Life_RscButtonMenu {
			idc = -1;
			text = "Cerrar";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class enviar: Life_RscButtonMenu {
			idc = -1;
			text = "Enviar";
			onButtonClick = "[] call medel_fnc_anuncioAnonimo; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
