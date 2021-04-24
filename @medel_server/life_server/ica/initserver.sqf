
/*
por: Icaruk & Medel
*/

//0 spawn ica_fnc_climaServidor;
0 spawn ica_fnc_initVars;
0 spawn ica_fnc_initNaufragios;
0 spawn ica_fnc_initMineria;

["init"] spawn ica_fnc_initSubasta;
[] spawn ica_fnc_resetDatos;
["reset0"] spawn ica_fnc_initPortatil;
["loop"] spawn ica_fnc_initPortatil;
// [] spawn ica_fnc_crearegalo; // pendiente
["init"] spawn ica_fnc_loteria;
["init"] spawn ica_fnc_roboConcesionario;
0 spawn ica_fnc_initDroga;
["init"] spawn ica_fnc_roboJoyeria;
["init"] spawn ica_fnc_basura;

//["Init"] spawn ica_fnc_generarIncendio;

_listaRobos = [];
missionNamespace setVariable ["ActualRobos",0,true];
missionNamespace setVariable ["ListaRobos",[_listaRobos],true];
missionNamespace setVariable ["RobosEnCurso", 0, true];
missionNamespace setVariable ["nopolicia", false, true];

missionNamespace setVariable ["robosPequenos",0,true];
missionNamespace setVariable ["robosMedianos",0,true];
missionNamespace setVariable ["robosGrandes",0,true];

missionNamespace setVariable ["combustible",0.22,true];

Paco setVariable ["reciente", false, true];
Paco setVariable ["robando", false, true];

Manolo setVariable ["reciente", false, true];
Manolo setVariable ["robando", false, true];

Farmacia setVariable ["reciente", false, true];
Farmacia setVariable ["robando", false, true];

Club7 setVariable ["reciente", false, true];
Club7 setVariable ["robando", false, true];

Putas setVariable ["reciente", false, true];
Putas setVariable ["robando", false, true];

Ropa setVariable ["reciente", false, true];
Ropa setVariable ["robando", false, true];

Militar setVariable ["reciente", false, true];
Militar setVariable ["robando", false, true];

Lezo setVariable ["reciente", false, true];
Lezo setVariable ["robando", false, true];

Banco setVariable ["reciente", false, true];
Banco setVariable ["robando", false, true];

Sucursal setVariable ["reciente", false, true];
Sucursal setVariable ["robando", false, true];

Nuclear setVariable ["reciente", false, true];
Nuclear setVariable ["robando", false, true];

missionNamespace setVariable ["probandoCoche",0,true];

missionNamespace setVariable ["nivelAlerta",0,true];

Zona_1 setVariable ["capturando", false, true];

Zona_2 setVariable ["capturando", false, true];

Zona_1 setVariable ["owner", "Libre", true];

Zona_2 setVariable ["owner", "Libre", true];

_Pos1 = position Zona_1;
_Pos2 = position Zona_2;

_capT1 = "Zona1_Marker";
_capT2 = "Zona2_Marker";

_capText = "Esta zona está libre";

_capM1 = createMarker [_capT1, _Pos1];
_capM2 = createMarker [_capT2, _Pos2];

_capM1 setMarkerColor "ColorBlue";
_capM2 setMarkerColor "ColorBlue";
	
_capM1 setMarkerText _capText;
_capM2 setMarkerText _capText;

_capM1 setMarkerType "b_art";
_capM2 setMarkerType "b_art";

Zona_1 setVariable ["marker", _capM1, true];

Zona_2 setVariable ["marker", _capM2, true];

missionNamespace setVariable ["incendiosEnCurso", 0, true];

uranioTest = nil;
publicVariable "uranioTest";
robosactivos = 0;
publicvariable "robosactivos";
centralitaArray = ["Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre"];

// *** Modo editor ***

if !(isDedicated) then {
	0 spawn ica_fnc_climaCliente;
	waitUntil {!isNil {experiencia}};

	0 spawn ica_fnc_initExp;
	0 spawn ica_fnc_impuestos;
	["init"] call ica_fnc_comoBebo;
	[] call ica_fnc_initHabilidades;
	0 spawn ica_fnc_consumo;
	["init"] call ica_fnc_camaras;
	0 spawn ica_fnc_EH;
	0 spawn ica_fnc_initHUD;

	arrayInfo = ["", "", "", "", "", "", "", "", "v1", "POPLIFE"];
	if (isNil {profileNamespace getVariable "arraySMS"}) then {
		_arr = []; _arr resize 30;
		profileNamespace setVariable ["arraySMS", _arr];
	};

	waitUntil {!isNull (uiNamespace getVariable "HUDica")};
	[] call ica_fnc_infolog;

	0 spawn ica_fnc_mapMarkers;

	player addAction ["", {
		call ica_fnc_limitadorDeArmas
	}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

	[player] spawn ica_fnc_initMed;
    ["loop"] spawn ica_fnc_posicion;
 	waitUntil {!isNil {heNacido}};
	[] execVM "presentacion.sqf";
	["recibo"] call ica_fnc_bloqueoDinero;

	// mierda de test

	player addBackpack "b_huntingbackpack";
	player addUniform "U_C_Poloshirt_redwhite";
	player addItem "itemMap";
	player assignItem "itemMap";
	player addmagazines ["CUP_30Rnd_9x19_EVO", 3]; player addweapon "r3f_mp5a5";
	player addmagazines ["RH_16Rnd_9x19_cz", 3]; player addweapon "RH_cz75";
};
