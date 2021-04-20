
class life_admin_menu
{
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_adminMenu; uiNameSpace setVariable ['life_admin_menu', _this select 0];";
	onUnLoad = "uiNameSpace setVariable ['life_admin_menu', nil];";

class controlsBackground {

	class fondo: RscText
	{
		idc = 1000;
		x = 0.298906 * safezoneW + safezoneX;
		y = 0.324 * safezoneH + safezoneY;
		w = 0.489844 * safezoneW;
		h = 0.594 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class cabecera: RscText
	{
		idc = 1001;
		text = "Panel de Administración - Plata o Plomo"; //--- ToDo: Localize;
		x = 0.298906 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.474375 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {0.702,0.102,0.102,1};
		colorBackground[] = {0,0,0,0.7};
	};
};

	class controls {

		class listaJugadores: RscListBox
		{
			idc = 2902;
			sizeEx = 0.040;
			onLBSelChanged = "[_this] spawn life_fnc_adminquery";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class infoJugador: RscStructuredText
		{
			idc = 2903;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class cerrar: Life_RscButtonMenu
		{
			idc = 2906;
			onButtonClick = "closeDialog 0;";
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0.25,0.19,1};
		};
		class reparar: RscButton
		{
			idc = 2904;
			onButtonClick = "[] spawn ica_fnc_adminReparar;";
			text = "Reparar"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class llaves: RscButton
		{
			idc = 2905;
			onButtonClick = "[] call ica_fnc_adminLlaves;";
			text = "Llaves"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class licencias: RscButton
		{
			idc = 2907;
			onButtonClick = "[] call ica_fnc_adminLicencias;";
			text = "Licencias"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class fuego: RscButton
		{
			idc = 2908;
			onButtonClick = "[] call ica_fnc_adminParticulas";
			text = "Fuego"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class crashear: RscButton
		{
			idc = 2911;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCrasheo;";
			text = "Crashear"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cachear: RscButton
		{
			idc = 2405;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_cacheo;";
			text = "Cachear"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class iconoX: RscPicture
		{
			idc = 1200;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class marcadores: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_adminMarcadores;";
			text = "Marcadores"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class nombres: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_nombres;";
			text = "Nombres"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class vestirse: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_adminvestirse;";
			text = "Vestirse"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class congelar: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCongelar;";
			text = "Congelar"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class voyATI: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyati;";
			text = "VOY A TI"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class invisible: RscButton
		{
			idc = 2911;
			onButtonClick = "[] call ica_fnc_invisible;";
			text = "Invisible"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class revivir: RscButton
		{
			idc = 2911;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminRevivir;";
			text = "Revivir"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class buscador: RscEdit
		{
			idc = 1400;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class venAMI: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_venami;";
			text = "VEN A MI"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class curar: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCurar;";
			text = "Curar"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class espectador: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminEspectador;";
			text = "Espectador"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class recoil: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_recoil;";
			text = "No Recoil"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class texto: RscEdit
		{
			idc = 1700;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.427969 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class enviar: RscButton
		{
			idc = 2911;
			onButtonClick = "[] call ica_fnc_mensaje;";
			text = "Enviar"; //--- ToDo: Localize;
			x = 0.732031 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class gasolina: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_llenarVehiculo;";
			text = "Gasolina"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class matar: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_killAdmin;";
			text = "Matar"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class marcadoresVehiculo: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_marcadoresVehiculo;";
			text = "Veh Markers"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class dia: RscButton
		{
			idc = 2908;
			onButtonClick = "[] call ica_fnc_dedia;";
			text = "Dia"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class arsenal: RscButton
		{
			idc = 2908;
			onButtonClick = "[] call ica_fnc_adminarsenal";
			text = "Arsenal"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class gesRol: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_dineroAdmin;";
			text = "Dinero Local"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class vehGOD: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_vehGOD;";
			text = "God Mode Veh"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class dejarEnBolas: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_equipo;";
			text = "Dejar en Bolas"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class forzarDesconexion: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_forzarDesconexionAdmin;";
			text = "Forzar Desconexion"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class kick: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_kickAdmin;";
			text = "Kick"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class explotar: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_explotar;";
			text = "Explotar Jugador"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class sacarDelVehiculo: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_sacarDelVehiculo;";
			text = "Expulsar del Vehiculo"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class voyAtuVeh: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyatuVeh;";
			text = "Voy a tu Vehiculo"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class venAmiVeh: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_moverEnMiVeh;";
			text = "Ven a mi Vehiculo"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class gesDineroC: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_dineroAdminC;";
			text = "Gestionar Dinero Cartera"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class gesDineroB: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_dineroAdminB;";
			text = "Gestionar Dinero Banco"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class reiniciarRobosEnCurso: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_reiniciarRobosCurso;";
			text = "Reiniciar Robos en Curso"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class reiniciarRobos: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn ica_fnc_reiniciarRobos;";
			text = "Reiniciar Robo"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class luna: RscButton
		{
			idc = 2911;
			onButtonClick = "[] remoteexec ['ica_fnc_luna', 0];";
			text = "Luna"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class esposar: RscButton
		{
			idc = 2911;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_esposarJugador;";
			text = "Esposar"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class quitarEsposas: RscButton
		{
			idc = 2911;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_desesposarJugador;";
			text = "Desesposar"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class entrarServicio: RscButton
		{
			idc = 5908;
			onButtonClick = "[] spawn ica_fnc_entrarServicioAdmin;";
			text = "Entrar / Salir de Servicio"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class spawnearVehiculo: RscButton
		{
			idc = 2908;
			onButtonClick = "[] spawn VVS_fnc_openVVS;";
			text = "Spawnear Vehiculo"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class quitarNiebla: RscButton
		{
			idc = 2911;
			onButtonClick = "[] remoteexec ['ica_fnc_quitarNiebla', 0];";
			text = "Quitar Niebla"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class quitarLluvia: RscButton
		{
			idc = 2911;
			onButtonClick = "[] remoteexec ['ica_fnc_quitarLluvia', 0];";
			text = "Quitar Lluvia"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class copiarEquipa: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_copiarEquipacion;";
			text = "Copiar Equipacion"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ponerEquipa: RscButton
		{
			idc = 2908;
			onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_ponEquipacion;";
			text = "Poner Equipacion"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};


/* #Codygu
$[
	1.063,
	["dsdds",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"fondo",[1,"",["0.180417 * safezoneW + safezoneX","0.0190369 * safezoneH + safezoneY","0.649894 * safezoneW","0.923659 * safezoneH"],[0.8431,0.0431,0.4353,1],[0.302,0.302,0.302,0.8334],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 0;","idc = -1;","style = 0;","font = |PuristaMedium|;"]],
	[1001,"listaJugadores",[1,"",["0.185575 * safezoneW + safezoneX","0.137135 * safezoneH + safezoneY","0.226947 * safezoneW","0.692744 * safezoneH"],[0.6,0,0,1],[0,0,0,0.6984],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 5;","idc = 2902;","style = 16;","colorDisabled[] = {0.2,0.2,0.2,1};","colorSelect[] = {0.302,0.8115,0.302,1};","font = |PuristaMedium|;","maxHistoryDelay = 0;","rowHeight = 0;","soundSelect[] = {|\A3\ui_f\data\sound\RscListbox\soundSelect|,0.09,1};","onLBSelChanged = |[_this] spawn est_fnc_adminQuery|;"]],
	[1002,"Control1618008941",[2,"",["12 * GUI_GRID_W + GUI_GRID_X","-7.5 * GUI_GRID_H + GUI_GRID_Y","39 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0,0,0.6984],[-1,-1,-1,-1],"","-1"],["type = 13;","idc = 2903;","style = 0;","size = |(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) ~ 1)|;","tooltipColorBox[] = {1,1,1,1};","tooltipColorShade[] = {1,1,1,1};","tooltipColorText[] = {1,1,1,1};"]],
	[1003,"Fuego",[2,"Fuego",["12 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2052;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminUni;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1004,"Vestirse",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1005,"Licencias",[2,"Licencias",["28 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 6847;","onButtonClick = |[] call est_fnc_adminLicencias;|;","style = |0+2|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1009,"Llaves",[2,"Llaves",["28 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1010,"Cachear",[2,"Cachear",["28 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2915;","style = |0+2|;","onButtonClick = |[call compile format [^%1^, (lbData [2902, lbCurSel (2902)])]] spawn est_fnc_cacheo;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1012,"Invisible",[2,"Invisible",["12 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2905;","style = |0+2|;","onButtonClick = |[player, true, true] call est_fnc_ocultame;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1013,"Revivir",[2,"Revivir",["28 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 6900;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminRevivir;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1014,"Matar",[2,"Matar",["28 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2906;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKill;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1015,"Congelar",[2,"Congelar",["28 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2904;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminFreeze;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1016,"Curar",[2,"Curar",["28 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2914;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminHR;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1020,"Control1324182751",[2,"",["-10.5 * GUI_GRID_W + GUI_GRID_X","28.5 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","3 * GUI_GRID_H"],[0.6,0,0,1],[0,0,0,0.6984],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 2;","idc = 1400;","style = 0;","autocomplete = ||;","colorDisabled[] = {0.2,0.2,0.2,1};","colorSelection[] = {0.302,0.8118,0.302,1};","font = |PuristaMedium|;"]],
	[1021,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1017,"",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1011,"",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1022,"",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1023,"",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1024,"",[2,"Vestirse",["12 * GUI_GRID_W + GUI_GRID_X","29.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1006,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1007,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1008,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1018,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1019,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1025,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1026,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","29.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1027,"",[2,"Vestirse",["28 * GUI_GRID_W + GUI_GRID_X","29.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1028,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1029,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1030,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1031,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1032,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1033,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1034,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1035,"",[2,"Vestirse",["36 * GUI_GRID_W + GUI_GRID_X","29.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1036,"d",[1,"ffdf",["0.417474 * safezoneW + safezoneX","0.346057 * safezoneH + safezoneY","0.0750239 * safezoneW","0.0488708 * safezoneH"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1038,"",[2,"Llaves",["28 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1039,"",[2,"Llaves",["36 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1040,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1041,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1042,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1043,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","14.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1044,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","17.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1045,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","20.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1046,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","23.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1047,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","26.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1048,"",[2,"Llaves",["44 * GUI_GRID_W + GUI_GRID_X","29.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2908;","style = |0+2|;","onButtonClick = |[] call est_fnc_adminKeys;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1049,"buscador",[1,"",["0.185369 * safezoneW + safezoneX","0.0601622 * safezoneH + safezoneY","0.226947 * safezoneW","0.0659757 * safezoneH"],[0.6,0,0,1],[0,0,0,0.6984],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"],["type = 2;","idc = 1400;","style = 0;","autocomplete = ||;","colorDisabled[] = {0.2,0.2,0.2,1};","colorSelection[] = {0.302,0.8118,0.302,1};","font = |PuristaMedium|;"]],
	[1050,"",[1,"Enviar",["0.334947 * safezoneW + safezoneX","0.840874 * safezoneH + safezoneY","0.0722105 * safezoneW","0.0879676 * safezoneH"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1037,"",[2,"Vestirse",["20 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","7.27273 * GUI_GRID_W","2.22222 * GUI_GRID_H"],[1,1,1,1],[0.0738,0.0559,0.0559,0.7698],[-1,-1,-1,-1],"","(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)"],["type = 1;","idc = 2919;","style = |0+2|;","onButtonClick = |[] spawn est_fnc_adminvestirse;|;","borderSize = 0;","colorBackgroundActive[] = {0.0745,0.0549,0.0549,1};","colorBackgroundDisabled[] = {0,0,0,0};","colorBorder[] = {0,0,0,0};","colorDisabled[] = {0.2,0.2,0.2,0};","colorFocused[] = {0.2,0.2,0.2,0.8651};","colorShadow[] = {0,0.2,0.2,0};","font = |PuristaMedium|;","offsetPressedX = 0.01;","offsetPressedY = 0.01;","offsetX = 0.01;","offsetY = 0.01;","soundClick[] = {|\A3\ui_f\data\sound\RscButton\soundClick|,0.09,1};","soundEnter[] = {|\A3\ui_f\data\sound\RscButton\soundEnter|,0.09,1};","soundEscape[] = {|\A3\ui_f\data\sound\RscButton\soundEscape|,0.09,1};","soundPush[] = {|\A3\ui_f\data\sound\RscButton\soundPush|,0.09,1};"]],
	[1051,"cabecera",[1,"Panel de AdministraciÃ³n - Plata o Plomo",["0.185369 * safezoneW + safezoneX","0.0161785 * safezoneH + safezoneY","0.639578 * safezoneW","0.0439838 * safezoneH"],[0.702,0.102,0.102,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
