
/*
por: Icaruk
*/

if (isServer) exitWith {}; // esto es para clientes

0 spawn ica_fnc_climaCliente;
waitUntil {!isNil {experiencia}};

arrayInfo = ["", "", "", "", "", "", "", "", "* POP Life", "* v 1.0"];
0 spawn ica_fnc_initExp;
0 spawn ica_fnc_impuestos;
["init"] call ica_fnc_comoBebo;
[] call ica_fnc_initHabilidades;
0 spawn ica_fnc_consumo;
["comprobador"] spawn ica_fnc_roboNuclear;
["init"] call ica_fnc_camaras;
0 spawn ica_fnc_EH;
0 spawn ica_fnc_initHUD;
call ica_fnc_matriculas3D;

if (isNil {profileNamespace getVariable "arraySMS"}) then {
	_arr = []; _arr resize 30;
	profileNamespace setVariable ["arraySMS", _arr];
};

waitUntil {!isNull (uiNamespace getVariable "HUDica")};
[] call ica_fnc_infolog;

0 spawn ica_fnc_mapMarkers;

[] call life_fnc_debug;

if (_this select 1 == 0 && player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 12 && (cursorObject isKindOf "Car") && (primaryWeapon player)=="pop_extintor" && (damage cursorObject) > 0.9) exitWith {cursorObject setVariable ["apagado",1,true];[player,player,1] spawn ica_fnc_tiroAgua};

player addAction ["", {
	call ica_fnc_limitadorDeArmas
}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

[player] spawn ica_fnc_initMed;
["loop"] spawn ica_fnc_posicion;

waitUntil {!isNil {heNacido}};

// ["El parche 2.06.1 contiene un cambio importante. Consulta el changelog en el foro."] spawn BIS_fnc_guiMessage;

[] execVM "presentacion.sqf";
["recibo"] call ica_fnc_bloqueoDinero;

if ((isNil {medel_din}) OR (isNil {medel_atmdin})) exitWith {"errorica" call BIS_fnc_endMission};

//rosen
0 spawn {
	while {true} do {
		discoteca say3D "disco";
		sleep 760;
	};
};

0 spawn {
	while {true} do {
	sleep (60 + (random 60));
		call ica_fnc_sync;
	};
};
/*
medel_din = 0;
medel_atmdin = 0;
0 spawn {
	while {true} do {
		if ((medel_din > 0) OR (medel_atmdin > 0)) then {
			[format ["CHETO ----- %1 (%2) tiene %3€ en mano y %4€ en el banco", name player, getPlayerUID player, medel_din, medel_atmdin], "diag_log", false, false, false] call BIS_fnc_MP;
		};
		sleep 20;
	};
};
/*
// call ica_fnc_silencer;
