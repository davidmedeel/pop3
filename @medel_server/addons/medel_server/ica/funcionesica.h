
class master_funcionesica
{
	tag = "ica";

	class raiz
	{
		file = "\medel_server\ica";
		class initHUD {};
	};

	class funciones
	{
		file = "\medel_server\ica\funciones";
		class onmap {};
		class editando {};
		class cheto {};
		class item {};
		class classToName {};
		class classToPic {};
		class meteAccion {};
		class negToPos {};
		class numToStr {};
		class strToArr {};
		class inString {};
		class revela {};
		class masCercano {};
		class confirmacion {};
		class getPos {};
		class tengo {};
		class mapMarkers {};
		class setVelocity {};
		class setVelocityRas {};
		class playMoveNow {};
		class switchMove {};
		class cargaInv {};
		class addEH {};
		class ocultame {};
		class anuncio {};
		class anuncioSimple {};
		class masUno {};
		class barrita {};
		class borrame {};
		class bloqueoDinero {};
		class creaMatricula {};
		class rendimiento {};
		class sync {};
	};

	class admin
	{
		file = "\medel_server\ica\admin";
		class consola {};
	};

	class medelRobos
	{
		file = "\medel_server\medel\robos";
		class policia {};
		class check {};
		class robobanco {};
		class roboropa {};
		class robomanolo {};
		class robopaco {};
		class robosucursal {};
		class roboalterne {};
		class robomilitar {};
		class roboclub7 {};
		class robofarmacia {};
		class robolezo {};
		class robonuclear {};
	};

	class medelLogs
	{
		file = "\medel_server\medel\logs";
		class customlog {};
		class logs {};
	};

	class medelDialog
	{
		file = "\medel_server\medel\dialog";
		class informacion {};
	};

	class medelServicio
	{
		file = "\medel_server\medel\policia\servicio";
		class menuPoli {};
		class entrarServicio {};
	};

	class medelFunciones
	{
		file = "\medel_server\medel\funciones";
		class limpiador {};
		class dineroAdminC {};
		class dineroAdminB {};
		class dineroAdmin {};
		class gesDinero {};
		class online {};
		class probarVeh {};
		class nombresNPC {};
		class p0 {};
		class checkMap {};
		class antiMacros {};
		class cierraTodo {};
		class autoEquipador {};
		class marcadores {};
		class nombreFake {};
		class taller {};
	};

	class medelHint
	{
		file = "\medel_server\medel\hint";
		class hint {};
		class hintSilent {};
	};

	class medelCaptura
	{
		file = "\medel_server\medel\captura";
		class captura {};
	};

	class medelAdmin {
		file = "\medel_server\medel\admin";
		class equipo {};
		class reiniciarRobosCurso {};
		class reiniciarRobos {};
		class kickAdmin {};
		class forzarDesconexionAdmin {};
		class sacarDelVehiculo {};
		class luna {};
		class explotar {};
		class quitarNiebla {};
		class quitarLluvia {};
		class desesposarJugador {};
		class killAdmin {};
		class copiarEquipacion {};
		class ponEquipacion {};
		class recoil {};
        class enviaMensaje {};
		class esposarJugador {};
		class venami {};
		class voyati {};
		class voyatuVeh {};
		class moverEnMiVeh {};
        class adminSalto {};
		class teleport5metros {};
		class mensaje {};
		class invisible {};
        class adminCongelar {};
        class adminCurar {};
		class llenarVehiculo {};
        class adminCrasheo {};
        class adminLlaves {};
        class adminEspectador {};
        class adminParticulas {};
        class adminMarcadores {};
		class dedia {};
        class adminBorrar {};
		class adminlicencias {};
		class adminReparar {};
		class adminRevivir {};
		class adminArsenal {};
		class nombres {};
		class vehGOD {};
		class entrarServicioAdmin {};
		class adminVestirse {};
		class marcadoresVehiculo {};
	};

	class medelDebug
	{
		file = "\medel_server\medel\debug";
		class anuncioDebug {};
		class godModeDebug {};
	};

	class medelPolicia
	{
		file = "\medel_server\medel\policia";
		class betti {};
		class incautarArmas {};
		class quitardinero {};
		class tpMilitar {};
	};

	class medelDupeos
	{
		file = "\medel_server\medel\utilidades";
		class dupeoCoche {};
	};

	class medelFarmeos
	{
		file = "\medel_server\medel\farmeos";
		class empresa {};
		class avionetas {};
		class granjero {};
	};

	class medelEMS
	{
		file = "\medel_server\medel\ems";
		class ventaOrganos {};
	};

	class clientserver
	{
		file = "\medel_server\ica\funciones\clientserver";
		class varToClient {};
	};

	class dialog
	{
		file = "\medel_server\ica\dialog";
		class menuCompraVenta {};
		class arrayTienda {};
		class infolog {};
		class menuY {};
		class eligeDato {};
		class meteDato {};
	};

	class precios
	{
		file = "\medel_server\ica\funciones\precios";
		class precioCombustible {};
		class precio {};
	};

	class subasta
	{
		file = "\medel_server\ica\subasta";
		class subasta {};
		class initSubasta {};
		class recogeBeneficios {};
		class subeBajaBeneficios {};
	};

	class experiencia
	{
		file = "\medel_server\ica\exp";
		class initExp {};
		class expToLevel {};
		class exp {};
		class arrayExp {};
		class limitadorDeArmas {};
		class costeSP {};
		class ganoExp {};
	};

	class farmeo
	{
		file = "\medel_server\ica\farmeo";
		class pesca {};
		class picando {};
		class llenaBotella {};
		class talando {};
		class initNaufragios {};
		class agricultura {};
		class initMineria {};
		class procesado {};
		class basura {};
		class obras {};
		class correos {};
	};

	class robos
	{
		file = "\medel_server\ica\robos";
		class hacker {};
		class ganzua {};
		class initPortatil {};
		class miroDocumentos {};
		class resetDatos {};
		class roboConcesionario {};
		class roboDeDatos {};
		class roboAlcalde {};
		class roboJoyeria {};
		class fugacarcel {};
	};

	class mafia
	{
		file = "\medel_server\ica\mafia";
		class tiendaMafia {};
		class traficanteDroga {};
		class camello {};
		class initDroga {};
		class blanqueo {};
		class tiendaterrorista {};
		class zonamafia {};
	};

	class policia
	{
		file = "\medel_server\ica\policia";
		class sacoDineroPublico {};
		class camaras {};
		class puntosCarnet {};
		class tiendaPolicia {};
		class tiendaMilitar {};
		class matriculas3D {};
		class cacheo {};
		class lvlalerta {};
	};

	class suministros
	{
		file = "\medel_server\ica\suministros";
		class initVars {};
		class menuTransportes {};
		class menuMineria {};
		class carga {};
		class descarga {};
		class gasolinera {};
		class menuAlmacen {};
		class entregaPaquete {};
	};

	class jugador
	{
		file = "\medel_server\ica\jugador";
		class wikipedia {};
		class impuestos {};
		class nigromante {};
		class consumo {};
		class comoBebo {};
		class initHabilidades {};
		class crafteo {};

		class daDinero {};
		class daLlaves {};
		class mensajesica {};

		class posicion {};
		class vistaBonita {};
		class autobusMagico {};
		class reporte {};
		class silencer {};

		class houdini {};
	};

	class tonterias
	{
		file = "\medel_server\ica\tonterias";
		class loteria {};
	};
	class habilidades
	{
		file = "\medel_server\ica\jugador\habilidades";
		class hab_golpe {};
		class hab_molotov {};
		class hab_pocionDeInvis {};
		class hab_pocionDeParkour {};
		class hab_pocionDeAdmin {};
		class hab_reparar {};
	};

	class inventario
	{
		file = "\medel_server\ica\inventario";
		class EH {};
		class usoItemFis {};
		class pongoItem {};
	};

	class sistemaMedicaruk
	{
		file = "\medel_server\ica\sistemaMedicaruk";
		class initMed {};
		class sistemaMedICA {};
		class sangrando {};
		class borroso {};
		class dolor {};
		class diagnostico {};
		class tratamiento {};
		class fractura {};
		class toxicidad {};
		class inconsciente {};
		class guardaCargaMed {};
		class enterrador {};
		class organos {};
	};

	class clima
	{
		file = "\medel_server\ica\clima";
		class climaCliente {};
		class climaServidor {};
	};

	class regalo
	{
		file = "\medel_server\ica\spawner";
		class crearegalo {};
	};

    class objetos
    {
    	file = "\medel_server\war";
        class objetos_poner {};
		class tiempo_server {};
    };

    class tisor
    {
    	file = "\medel_server\tisor";
    	class centralita {};
    };

	class rosen
	{
		file = "\medel_server\rosen";
		class apuestas {};
		class efecto {};
		class sillaelectrica {};
		class bancoheist {};
		class pescar {};
	};

	class rosenPolitica
	{
		file = "\medel_server\rosen\politica";
		class inscripcion {};
		class votar {};
		class initCandidatos {};
		class listaCandidatos {};
		class initVotantes {};
		class listaInscripcion {};
		class resultados {};
	};

	class util
	{
		file = "\medel_server\ica\HW\util";
		class tanque {};
	};
	class crafteo
	{
		file = "\medel_server\ica\HW\crafteo";
		class menucrafteo {};
	};
};
