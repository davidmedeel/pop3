#include <macro.h>

// Run Some Client Stuff
execVM"A3L_Functions\a3lint.sqf";
[] execVM "A3L_Stuff\jailsystem.sqf";

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];

waitUntil {!isNull player && player == player};

_t0 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Cargando funciones Icaruk... ----------";
diag_log "--------------------------------------------------------------";

waitUntil {!isNil {arr}};
[player, arr] call ica_fnc_varToServer;
waitUntil {recibido};

diag_log "--------------------------------------------------------------";
diag_log format ["-------- Funciones Icaruk cargadas en %1s. --------", diag_tickTime - _t0];
diag_log "--------------------------------------------------------------";

titleText ["Inicializando cliente, espera por favor...", "PLAIN"];

_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting ArmA 3 Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Setting up actions";
[] call life_fnc_acciones;
diag_log "::Life Client:: actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
diag_log "::Life Client:: Executed custom client functions";

titleText ["Espera a que el servidor haga sus cosas...", "PLAIN"];
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};

titleText ["Cargando datos...", "PLAIN"];

//diag_log "::Life Client:: Group Base Execution";
if (count playableUnits > 0) then {
	[] spawn life_fnc_escInterupt;
};

if ((profilenamespace getVariable "rutome") > 0 ) then {0 spawn ica_fnc_nigromante; noSpawn = true}; // estoy muerto
if (!isNil {profileNamespace getVariable "noiposci"}) then {[false] spawn ica_fnc_posicion; noSpawn = true}; // estoy vivo y voy a mi posicion



_handle = [] spawn life_fnc_inicio;
waitUntil {scriptDone _handle};

//Para la vision y carga de los jugadores
setViewDistance 2000;
setTerrainGrid 25;
setViewDistance 1500;

//Radio y sonidos de radio ambientales
player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;
0 fadeRadio 0;
enableEnvironment true;


player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["surrender",false,true]; //Set surrender to false
player setVariable["lockpicking",false,true];
//activar medical advaned system

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[player,life_sidechat,playerSide] remoteexeccall ["TON_fnc_managesc",2];
0 cutText ["","BLACK IN"];

// [] call life_fnc_hudSetup; // esto es de A3L, ahora se usa lo de ica
//LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
//LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
//[] call life_fnc_settingsInit;

player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
player setVariable["nombreFake", nil, false];

life_fnc_moveIn = compileFinal
"
    life_disable_getIn = false;
    player moveInCargo (_this select 0);
    life_disable_getOut = true;
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	medel_atmdin = medel_atmdin + _price;
";

[] call life_fnc_initRacing;
[] execVM "ica\initica.sqf";
//Añadir LLaves
[] execVM "acj\fn_addKey.sqf";

enableEnvironment false;

// Medel
ClicksPerSecond = 0; 
lastlogging = 0; 
clickingstarted = false;

[] spawn ica_fnc_antiMacros;

["Load"] spawn ica_fnc_marcadores;
["Init"] spawn ica_fnc_marcadores;

["Init"] spawn ica_fnc_taller;

[] spawn medel_fnc_restarts;
[] spawn ica_fnc_anuncioDebug;
[] spawn ica_fnc_godModeDebug;
[] spawn ica_fnc_incendiosDebug;

["init"] call ica_fnc_silencer;
["Init"] spawn ica_fnc_p0;
["Init"] spawn ica_fnc_granjero;
["Init"] spawn ica_fnc_limpiador;

//["NPC"] spawn ica_fnc_bomberos;

["Init"] spawn ica_fnc_empresa;
["Init"] spawn ica_fnc_robopaco;
["Init"] spawn ica_fnc_robomanolo;
["Init"] spawn ica_fnc_roboclub7;
["Init"] spawn ica_fnc_roboalterne;
["Init"] spawn ica_fnc_robofarmacia;
["Init"] spawn ica_fnc_robomilitar;
["Init"] spawn ica_fnc_robobanco;
["Init"] spawn ica_fnc_robosucursal;
["Init"] spawn ica_fnc_roboropa;
["Init"] spawn ica_fnc_robonuclear;
["Init"] spawn ica_fnc_robolezo;
["Init"] spawn ica_fnc_captura;
["Init"] spawn ica_fnc_avionetas;

// -------------------------------
// Silencer
// -------------------------------

{
	_valor = profileNamespace getVariable [_x, 0];
	
	if !(_valor isEqualType 0) then {
		[format ["%1 (UID %2) tenía el valor %3 en la variable %4", name player, getPlayerUID player, _valor, _x], "icarukLog_silencer.txt"] call des_fnc_log;	
	};
} forEach [
	"GUI_BCG_RGB_R", "GUI_BCG_RGB_G", "GUI_BCG_RGB_B", "GUI_BCG_RGB_A",
	"IGUI_GCG_RGB_R", "IGUI_GCG_RGB_G", "IGUI_GCG_RGB_B", "IGUI_GCG_RGB_A", 
	"IGUI_grid_mission_W", "IGUI_grid_mission_H"
];

diag_log "--------------------------------------------------------------";
diag_log "-------- Jugadores en modo Hulk (server)... ----------";
diag_log "--------------------------------------------------------------";

player allowDamage true;

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
6 enableChannel false;
7 enableChannel false;
8 enableChannel false;

call compile preprocessFileLineNumbers "core\functions\fn_announce.sqf";

__CONST__(life_paycheck,life_paycheck);

[] spawn life_fnc_asyncInit;

//(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "0 spawn ica_fnc_talando;"];

if (call life_donator > 0) then {license_civ_donator = true;} else {license_civ_donator = false;};
