
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] execFSM "\life_server\cleanup.fsm";

_extDB = false;

if(isNil {uiNamespace getVariable "life_sql_id"}) then {
 
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	"extDB2" callExtension "9:ADD_DATABASE:POPLIFE_DB";
	call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:POPLIFE_DB:SQL_CUSTOM_V2:%1:a3poplife",(call life_sql_id)]);
	"extDB2" callExtension "9:LOCK";
	_extDB = true;
	diag_log "extDB: Conexión establecida con la base de datos";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	_extDB = true;
	diag_log "extDB2: Already Setup";
};

if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB: Error Comprueba los logs de extDB para mas informacion";
};

["resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["deleteOldHouses",1] spawn DB_fnc_asyncCall;
["deleteOldGangs",1] spawn DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;
life_oplevel = 0;

__CONST__(JxMxE_PublishVehicle,"No");

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];
/* Rosen politica */
lista_candidatos = [];
publicVariable "lista_candidatos";
lista_votantes = [];
publicVariable "lista_votantes";
votacion = true;
publicVariable "votacion";

listaCasas = [
    "Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_i_House_Small_01_V3_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Small_02_V3_F",
	"Land_i_House_Small_03_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V3_F",
	"Land_smd_budova3_open",
	"Land_smd_dum_olezlina_open",
	"Land_smd_sara_zluty_statek_in",
	"Land_smd_hospoda_mesto",
	"Land_smd_dum_olez_istan2_maly_open",
	"Land_smd_dum_olez_istan2_open",
	"Land_smd_dum_mesto_in_open",
	"Land_smd_dum_olez_istan1_open2",
	"Land_smd_cihlovej_dum_mini",
	"Land_smd_house_y_open",
	"Land_smd_dum_olez_istan1_open",
	"Land_smd_budova4_in",
	"Land_HouseB",
	"Land_HouseA",
	"Land_HouseA1_L",
	"land_pop_chalet",
	"Land_HouseC1_L",
	"Land_Home6b_DED_Home6b_01_F",
	"Land_Home3r_DED_Home3r_01_F",
	"Land_HouseDoubleAL",
	"Land_HouseDoubleAL2",
	"Land_smd_budova2_open",
	"Land_Ranch_DED_Ranch_01_F",
	"Land_Ranch_DED_Ranch_02_F"
];
publicVariable "listaCasas";

listaGarajes = [
    "Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_smd_garaz_long_open",
	"Land_smd_garaz_mala_open",
	"Land_smd_garaz_open"
];
publicVariable "listaGarajes";

_t0 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Llenando array funciones Icaruk (server)... ----------";
diag_log "--------------------------------------------------------------";

_arr = [];
_cosas = [
	"initHud", "onmap", "editando", "cheto", "item", "classToname", "classtopic", "meteaccion", "negtopos", "numtostr", "strtoarr", "instring", "revela", "masCercano", "getpos", "tengo", "mapmarkers", "setvelocity", "setvelocityras", "playmovenow", "switchmove", "cargainv", "addEH", "ocultame", "anuncio", "anunciosimple", "masuno", "barrita", "borrame", "bloqueodinero", "creaMatricula", "sync",
	"menuCompraventa", "arraytienda", "infolog", "menuy",
	"preciocombustible", "precio",
	"subasta", "initsubasta", "recogebeneficios", "subebajabeneficios",
	"initexp", "exptolevel", "exp", "arrayexp", "limitadordearmas", "costeSP", "ganoExp",
	"pesca", "picando", "llenabotella", "talando", "initnaufragios", "agricultura", "initmineria", "procesado", "basura","obras",
	"hacker", "ganzua", "initportatil", "mirodocumentos", "resetdatos", "roboconcesionario", "robodedatos", "roboalcalde", "robojoyeria","fugacarcel",
	"tiendamafia","tiendaterrorista", "traficantedroga", "camello", "initdroga", "blanqueo",
	"sacodineropublico", "camaras", "puntoscarnet", "tiendaPolicia", "matriculas3D", "cacheo",
	"initvars", "menutransportes", "menumineria", "carga", "descarga", "gasolinera", "menualmacen", "entregaPaquete",
	"wikipedia", "impuestos", "nigromante", "consumo", "comobebo", "inithabilidades", "crafteo", "dadinero", "dallaves", "mensajesica", "posicion", "autobusMagico", "reporte", "houdini", /*"vistabonita",*/
	"loteria", "consola", "rendimiento", "eligeDato", "meteDato",
	/* funciones WarBlast */
	"objetos_poner","tiempo_server",
	/* fin funciones WarBlast */
	/* funciones Tisor */
	"centralita",
	/* fin funciones Tisor */
	/* funciones Rosen */
	"apuestas","efecto","inscripcion","votar","listaCandidatos","listaInscripcion","initCandidatos","initVotantes","resultados","sillaelectrica","bancoheist","pescar",
	/* fin funciones Rosen */
	/* funciones Medel */
	"quitardinero","policia","check","robobanco","roboclub7","roboropa",
    "robopaco","robomanolo","robosucursal","robomilitar",
    "robofarmacia","roboalterne","robonuclear",
    "empresa", "dupeoCoche", "anuncioDebug",
    "dineroAdminC", "dineroAdminB", "dineroAdmin",
    "robolezo", "betti", "captura", "logs", "customlog", "incautarArmas", "ventaOrganos",
    "limpiador", "hint", "hintSilent", "gesDinero",
    "online", "avionetas", "godModeDebug",
    "menuPoli", "entrarServicio", "probarVeh",
    "granjero", "nombresNPC", "tiendaMilitar", "tpMilitar",
    "equipo", "reiniciarRobosCurso", "reiniciarRobos",
    "kickAdmin", "forzarDesconexionAdmin", "sacarDelVehiculo", "luna",
    "explotar", "quitarNiebla", "quitarLluvia", "desesposarJugador", "killAdmin", "copiarEquipacion",
    "ponEquipacion", "recoil", "enviaMensaje", "esposarJugador", "venami", "voyati",
    "voyatuVeh", "moverEnMiVeh", "adminSalto", "teleport5metros", "mensaje", "invisible", "adminCongelar",
    "adminCurar", "llenarVehiculo", "adminCrasheo", "adminLlaves", "adminEspectador", "adminParticulas",
    "adminMarcadores", "dedia", "adminBorrar", "adminlicencias", "adminReparar", "adminRevivir", "adminArsenal", "nombres",
    "vehGOD", "entrarServicioAdmin", "adminVestirse", "marcadoresVehiculo",
    "p0", "confirmacion", "informacion", "cierraTodo", "autoEquipador", "checkMap", "marcadores", "antiMacros", "nombreFake", "taller", "tiroAgua", "bomberos", "generarIncendio", "magneto",
    "incendiosDebug", "comproRopa", "direccion", "silencer",
	/* fin funciones Rosen */
	"hab_golpe", "hab_molotov", "hab_pociondeinvis", "hab_pociondeparkour", "hab_pociondeadmin", "hab_reparar",
	"EH", "usoitemfis", "pongoItem",
	"initmed", "sistemamedica", "sangrando", "borroso", "dolor", "diagnostico", "tratamiento", "fractura", "toxicidad", "inconsciente", "guardacargamed","enterrador", "organos",
	"climacliente", "climaservidor",
	//FUNCIONES HEISENBERG
	"menucrafteo","tanque",
	//BZ
	"zonamafia","correos","lvlalerta"
];

for "_idx" from 0 to (count _cosas) -1 do {
	_arr pushBack (format ["ica_fnc_%1", _cosas select _idx]);
};

arr = _arr;
publicVariable "arr";

diag_log "--------------------------------------------------------------";
diag_log format ["-------- Array funciones Icaruk (server) lleno en %1s. --------", diag_tickTime - _t0];
diag_log "--------------------------------------------------------------";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[
		1*60,
		20*61,
		0,
		2*60,
		0,
		0
] execVM "\life_server\repetitive_cleanup.sqf";


{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

/*_t1 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Casas con puertas en modo Hulk (server)... ----------";
diag_log "--------------------------------------------------------------";
{
	_x allowDamage false;
	diag_log format ["%1",_x];
} forEach (nearestObjects [[10000,10000,0], listaCasas, 9000]);
diag_log "--------------------------------------------------------------";
diag_log format ["-------- Casas listas en forma de Hulk (server) en %1s. --------", diag_tickTime - _t1];
diag_log "--------------------------------------------------------------";
*/
[] spawn TON_fnc_initHouses;
[] spawn TON_fnc_gangCash;
[0] spawn ica_fnc_tiempo_server;
/*Rosen Poltica*/
lista_votantes=[];
lista_candidatos=[];
votacion = true;
publicVariable "votacion";

life_server_isReady = true;
publicVariable "life_server_isReady";
life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];
publicVariable "life_attachment_point";
robosactivos = 0;
publicVariable "robosactivos";

Desc = 1;
publicVariable "Desc";

fnc_limpiador = {private [ 
 "_limpiar_grupos", "_borrar_ropa", "_borrar_muertos", "_borrar_cochesgg", "_borrar_cochesvacios", 
 "_borrar_cochesolvidados", "_nvl_dano", "_borrar_ruinas", "_i", "_count_borrado", "_rompo" 
]; 
 
 
_limpiar_grupos = true;     
_borrar_cochesvacios = true;     
_borrar_cochesolvidados = false;    
_borrar_ruinas = true;   
_borrar_ropa = true;     
_borrar_muertos = true;  
_borrar_cochesgg = true; 
_nvl_dano = 0.99;      
      
 
_count_borrado = []; 
_i= 0; 
_rompo = false; 
 
if ((count _this) < 1) then { 
 
 
 if (_borrar_muertos) then { 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   }; 
  } forEach allDeadMen; 
 }; 
 
 _count_borrado set [0, _i]; 
 _i= 0; 
 
 if (_borrar_ropa) then { 
 
  private _szrot_obj = ( 
   allMissionObjects "WeaponHolder" + 
   allMissionObjects "GroundWeaponHolder" + 
   allMissionObjects "WeaponHolderSimulated" 
  ); 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   }; 
  } forEach _szrot_obj; 
 }; 
 
 _count_borrado set [1, _i]; 
 _i= 0; 
 
 if (_borrar_ruinas) then { 
 
  private _ruins = allMissionObjects "Ruins"; 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   }; 
  } forEach _ruins; 
 }; 
 
 _count_borrado set [2, _i]; 
 _i= 0; 
 
 if (_borrar_cochesgg) then { 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
     if (_x getvariable ["borrar",0] > 5) then {deleteVehicle _x} else {_x setvariable ["borrar",_x getvariable ["borrar",0] + 1,true]}; 
    _i = _i + 1; 
   };   
  } forEach allDead; 
 }; 
 
 _count_borrado set [3, _i]; 
 _i= 0; 
 
 if (_borrar_cochesvacios) then { 
 
  { 
   if ((damage _x > _nvl_dano || {!canMove _x}) && {{alive _x} count crew _x == 0}) then {
 
    if !(_x getVariable ["persistent",false]) then {
     if (_x getvariable ["borrar",0] > 5) then {deleteVehicle _x} else {_x setvariable ["borrar",_x getvariable ["borrar",0] + 1,true]}; 
     _i = _i + 1; 
    }; 
   }; 
  } forEach vehicles; 
 }; 
 
 _count_borrado set [4, _i]; 
 _i= 0; 
 
 if (_borrar_cochesolvidados) then { 
 
  {                     
   if ({alive _x} count crew _x == 0) then { 
 
    if !(_x getVariable ["persistent",false]) then { 
     if (_x getvariable ["borrar",0] > 5) then {deleteVehicle _x} else {_x setvariable ["borrar",_x getvariable ["borrar",0] + 1,true]}; 
     _i = _i + 1; 
    }; 
   }; 
  } forEach vehicles; 
 }; 
 
 _count_borrado set [5, _i]; 
 _i= 0; 
 
 if (_limpiar_grupos) then { 
 
  { 
   if ((count (units _x)) == 0) then { 
    deleteGroup _x; 
    _x = grpNull; 
    _x = nil; 
    _i = _i + 1; 
   }; 
  } foreach allGroups; 
 }; 
 
 _count_borrado set [6, _i];     
 
} else { 
 
 params ["_zonaCus"]; 
 
 
 switch (typeName _zonaCus) do { 
 
  case "STRING": { 
   if !(_zonaCus in allMapMarkers) then { 
    _rompo = true; 
   }; 
  }; 
   
  case "OBJECT": { 
   if !(_zonaCus isKindOf "EmptyDetector") then { 
    _rompo = true; 
   }; 
  }; 
  default {_rompo = true;}; 
 }; 
 
 if (_rompo) exitWith { 
 }; 
 
 if (_borrar_muertos) then { 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   };   
  } forEach (allDeadMen inAreaArray _zonaCus); 
 }; 
 
 _count_borrado set [0, _i]; 
 _i= 0; 
 
 if (_borrar_ropa) then {
 
  private _szrot_obj = (
  allMissionObjects "WeaponHolder" + 
  allMissionObjects "GroundWeaponHolder" + 
  allMissionObjects "WeaponHolderSimulated" 
  ) inAreaArray _zonaCus; 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   };    
  } forEach _szrot_obj; 
 }; 
 
 _count_borrado set [1, _i]; 
 _i= 0; 
 
 if (_borrar_ruinas) then { 
 
  private _ruins = (allMissionObjects "Ruins") inAreaArray _zonaCus; 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1;        
   }; 
  } forEach _ruins; 
 }; 
 
 _count_borrado set [2, _i]; 
 _i= 0; 
 
 if (_borrar_cochesgg) then { 
 
  { 
   if !(_x getVariable ["persistent",false]) then { 
    deleteVehicle _x; 
    _i = _i + 1; 
   }; 
  } forEach (vehicles inAreaArray _zonaCus); 
 }; 
 
 _count_borrado set [3, _i]; 
 _i= 0; 
 
 if (_borrar_cochesvacios) then { 
 
  { 
   if ((damage _x > _nvl_dano || {!canMove _x}) && {{alive _x} count crew _x == 0}) then { 
 
    if !(_x getVariable ["persistent",false]) then { 
     if (_x getvariable ["borrar",0] > 5) then {deleteVehicle _x} else {_x setvariable ["borrar",_x getvariable ["borrar",0] + 1,true]}; 
     _i = _i + 1; 
    }; 
 
   }; 
 
  } forEach (vehicles inAreaArray _zonaCus); 
 }; 
 
 _count_borrado set [4, _i]; 
 _i= 0; 
 
 if (_borrar_cochesolvidados) then { 
 
  {                     
   if ({alive _x} count crew _x == 0) then { 
 
    if !(_x getVariable ["persistent",false]) then { 
     deleteVehicle _x; 
     _i = _i + 1; 
    }; 
   }; 
  } forEach (vehicles inAreaArray _zonaCus); 
 }; 
 
 _count_borrado set [5, _i]; 
 _i= 0; 
 
 if (_limpiar_grupos) then { 
 
  { 
   if ((count (units _x)) == 0) then { 
    deleteGroup _x; 
    _x = grpNull; 
    _x = nil; 
    _i = _i + 1; 
   }; 
  } foreach allGroups; 
 }; 
 
 _count_borrado set [6, _i]; 
}; 

if (daytime >= 18 OR daytime < 8) then {

{setdate [1970,1,20,date select 3,date select 4];0 setOvercast 0} remoteexeccall ["bis_fnc_call",0];

};


if !(_rompo) then {
 
 diag_log format [
  "** Limpiador: Objetos Borrados: 
  %1 -Cuerpos muertos, 
  %2 -Cosas botadas, 
  %3 -Objetos danados, 
  %4 -Vehs destruidos, 
  %5 -Vehs abandonados danados, 
  %6 -Vehs abandonados, 
  %7 -Grupos Vacios 
  **", 
  _count_borrado select 0, 
  _count_borrado select 1, 
  _count_borrado select 2, 
  _count_borrado select 3, 
  _count_borrado select 4, 
  _count_borrado select 5, 
  _count_borrado select 6 
 ];
};};

publicVariable "fnc_limpiador";

{
	waituntil {!isnil "license_civ_donator"};

	sleep 5;

	Desc = 1;

} remoteexec ["bis_fnc_spawn", -2, true];
